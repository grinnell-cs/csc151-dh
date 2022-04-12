---
title: Processing XML
summary: |
  We consider some techniques for processing XML documents, including
  ways to extract information from XML documents and to build new XML
  documents from old.
---
*Warning*: To run the code in this lab, you will likely need to update your `csc151` package, add the `csc151www` package, and require `csc151www`.
You add the `csc151www` package with `https://github.com/grinnell-cs/csc151www.git#main`.
You may also have to download and explicitly require some other Racket libraries, including `html-parsing`, `html-writing`, and `sxml`.

As you've seen in your recent experiments, we can write programs that help us garner information on texts, not only quantitative properties like word lengths, but also more abstract concepts that we try to express algorithmically.
We can also use these techniques to transform texts, replacing or excising portions, or even building new documents based on old.
(While we have not yet explored the connections, it is likely that the Dadaists would have appreciated some of our uses of randomness to build new texts from existing texts.)

As you may recall from your explorations of XML, digital humanists often find it useful to "mark up" documents to provide additional information on the document.
When we mark documents using XML or HTML (a kind of XML document type), we add information and enforce a hierarchical structure on the document.

What if we want to analyze or transform a document that contains the additional information?

Regular expressions may serve in some cases.
For example, if we want to count the number of paragraphs in an HTML document, we can use an expression like 
 
```
(length (rex-find-matches (rex-concat (rex-string "<")
                                         (rex-char-set "pP")
                                         (rex-char-set " >"))
```
 
That is, we want to find the number of times a paragraph tag appears.
The `<` marks the start of the tag.
It can be a `p` tag or a `P` tag.
It may immediately end with a `>` or there may be a space and some attributes.

However, it turns out that some aspects of hierarchical documents are difficult, if not impossible, to express with regular expressions.
For example, what if we only want to count the number of times that emphasized text appears within another section of emphasized text, as in 

> `<em>this is a <em>boring</em> example</em>`

You will find that it is surprisingly hard to write an expression that counts the `<em>boring</em>` in that instance, but does not do so for `<em>this</em> is also a <em>boring</em> example</em>`".

More generally, because regular expressions are designed to describe *sequences*, they are ill-suited to describing *hierarchical* structures.
In response to the challenge of such description, computer scientists have developed a variety of hierarchical pattern languages for different contexts and situations.
In the cases of XML and HTML, we rely on a few languages that the World Wide Web Consortium (W3C) designed for such processes.
XPath is a notation, somewhat like regular expressions, for describing patterns in an XML document.
XSLT is a programming language that permits us to transform XML documents, using XPath to help describe the portions to be transformed.

We'll focus on the use of adaptations of XPath into the Racket language.

## Representing XML/HTML documents in Racket

At first glance, it seems relatively straightforward to represent an XML document in Racket: Each element can be a list.  
We can then nest lists within lists (within lists, within lists, ...) to represent the hierarchy.
For the text that appears in elements, we can just use strings.

For example, consider the following document fragment.

```text
<div>
<p>
  The Very Hungry Caterpillar opened the book and began reading aloud.
</p>

<blockquote>
  <p>Alice observed the Caterpillar reading.</p>
  <p><q>This is <em>quite</em> confusing</q>, said Alice.</p>
</blockquote>
</div>
```

We might represent that in Racket as follows.

```drracket
'(div
  (p "The Very Hungry Caterpillar opened the book and began reading aloud.")
  (blockquote
   (p "Alice observed the Caterpillar reading.")
   (p (q "This is " (em "quite") " confusing")
      ", said Alice.")))
```

Unfortunately, while the Racket community agrees generally on this approach, many libraries make slightly different decisions about some subtleties, such as how to deal with whitespace or optional attributes.
Libraries also differ as to how pedantic they are about the format of textual representation of the XML.

We will rely on some of the more common libraries, along with some additional simplifications we have introduced.
You will find that the expressions look much like the example above, with the addition of some optional attributes, which will appear as `(@ (name1 val1)
(name2 val2) ...)` immediately after the tag name.

```drracket
'(div (@ (class "example") (id "vhc"))
  ...)
```

You can rely on four basic procedures to convert between text and this format.

* `(file->xml fname)` reads an HTML document and converts it to the internal structure just described.
* `(xml->file html fname)` saves a document in that representation to a text file which can then be loaded in a Web browser. 
* `(string->xml str)` converts a string to the list representation.
* `(xml->string html)` converts the list representation back to a string.

Here are quick examples of the latter two.

```drracket
> (xml->string '(p (@ (class "example"))
                    "This is a "
                    (em "very boring")
                    " example."))
"<p class=\"example\">This is a <em>very boring</em> example.</p>"
> (string->xml "<p id='opinion'>This is an <strong id='redundant'>equally boring</strong> example.</p>")
'(p (@ (id "opinion")) "This is an " (strong (@ (id "redundant")) "equally boring") " example.")
```

Wasn't that exciting?

## Searching XML/HTML documents in Racket

More exciting is the notion that once we have our documents in this representation, we can rely on a few simple tools to start searching them and extracting information.
The most important is the `(sxpath path xml-list)` procedure, which takes an XPath pattern and an encoded XML element as parameters and returns a list of all the matches in the element.

What's an XPath pattern?  We're about to learn that.

The simplest pattern takes the form `"//tag"`, and searches for all of the elements with the given tag.

```drracket
> (define example (string->xml "<p>This is <em>really</em> boring.  <q>This is <em>too</em>.</q></p>"))
> example
'(p "This is " (em "really") " boring.  " (q "This is " (em "too") "."))
> (sxpath-match "//em" example)
'((em "really") (em "too"))
> (sxpath-match "//q" example)
'((q "This is " (em "too") "."))
> (sxpath-match "//em" '(p "No emphasis."))
'()
```

What happens if we nest the emphasis tags in the HTML, as we described earlier?
Let's see.

```drracket
> (define nested (string->xml "<p>Why would anyone <em>nest <em>emphasis</em> within <strong><em>other emphasis</em></strong></em>?</p>"))
> nested
'(p "Why would anyone " (em "nest " (em "emphasis") " within " (strong (em "other emphasis"))) "?")
> (sxpath-match "//em" nested)
'((em "nest " (em "emphasis") " within " (strong (em "other emphasis"))) 
  (em "emphasis") 
  (em "other emphasis"))
```

It appears that we get all of the `em` elements, even when they
include or are included within another such element.  
(Note that we've reformatted the output slightly for clarity.)

What if we want just the `em` elements that are included within another element (so not the outer one)?  
The patterns `"//tag0/tag1"` and `"//tag0//tag1"` allow us to look at nesting.
In the first case `tag1` must appear as an immediate subelement of `tag0`.  
In the latter, `tag1` can appear anywhere below `tag0`.  

```drracket
> (sxpath-match "//em/em" nested)
'((em "emphasis"))
> (sxpath-match "//em//em" nested)
'((em "emphasis") (em "other emphasis"))
```

All of those examples had all of the elements in the same paragraph.
What if we have multiple paragraphs?
Let's try a quick example, which we'll then use to think about more detailed selection.

```drracket
> (define stuff
    '(div
      (p (em "one") (em (@ (class "prime")) "two") (em (@ (class "prime")) "three"))
      (p (em (@ (class "square")) "four") (em (@ (class "prime")) "five") (em "six"))
      (p (em (@ (class "prime")) "seven"))
      (p "eight")))
> (sxpath-match "//em" stuff)
'((em "one") (em (@ (class "prime")) "two") (em (@ (class "prime")) "three") (em (@ (class "square")) "four") (em (@ (class "prime")) "five") (em "six") (em (@ (class "prime")) "seven"))
```

Not unsurprisingly, we got all of the emphasized elements.
But what if we wanted only the *first* emphasized element in each paragraph?
If you add a number within brackets after an XPath pattern, you can get the first (or second or ...) matching element.

```drracket
> (sxpath-match "//em[1]" stuff)
'((em "one") (em (@ (class "square")) "four") (em (@ (class "prime")) "seven"))
> (sxpath-match "//em[2]" stuff)
'((em (@ (class "prime")) "two") (em (@ (class "prime")) "five"))
```

In the second case, since there was not a second emphasized element in the third paragraph, we get nothing in the output list.
As you might expect, we get back the empty list if no paragraph has `n` elements.

```drracket
> (sxpath-match "//em[5]" stuff)
'()
```

What about all of those `class` attributes?
Shouldn't we be able to use those, too?
Yes!
You can select the elements with a particular class by appending `[@class='name']` to the path pattern. 

```drracket
> (sxpath-match "//em[@class='prime']" stuff)
'((em (@ (class "prime")) "two") (em (@ (class "prime")) "three") (em (@ (class "prime")) "five") (em (@ (class "prime")) "seven"))
> (sxpath-match "//em[@class='square']" stuff)
'((em (@ (class "square")) "four"))
> (sxpath-match "//em[@class='transcendental']" stuff)
'()
```

If you only care about the elements that *have* a class, no matter what it is, you can just use `[@class]`.

```drracket
> (sxpath-match "//em[@class]" stuff)
'((em (@ (class "prime")) "two") (em (@ (class "prime")) "three") (em (@ (class "square")) "four") (em (@ (class "prime")) "five") (em (@ (class "prime")) "seven"))
```

Of course, you can also use attributes other than `class` to select elements.

There are a host of other Xpath patterns, which we will address at another point.

## Building new XML documents from old

The general transformation of XML documents is comparatively complicated.
For the time being, we are going to consider a simpler approach, one that takes the results of one of our queries and turns it into a new document.

Suppose, for example, that we've extracted some set of elements from one document, and want to present those as a bulleted list in a new document.
What do we need to do?

* First, we must convert each of those elements into an `li` (list item) element.
* We must then "wrap" that list as an unordered list (`ul`).
* We must then put that list in a body element.
* Finally, we should convert the whole thing into an HTML document.

Let's try each in turn.

```drracket
; Our starting document
> (define stuff
    '(div
      (p (em "one") (em (@ (class "prime")) "two") (em (@ (class "prime")) "three"))
      (p (em (@ (class "square")) "four") (em (@ (class "prime")) "five") (em "six"))
      (p (em (@ (class "prime")) "seven"))
      (p "eight")))
```

```drracket
; Extract some elements (in this case, the primes).
> (define elements (sxpath-match "//em[@class='prime']" stuff))
> (length elements)
4
> (car elements)
'(em (@ (class "prime")) "two")
```

```drracket
; Convert each to a list item
> (define items (map (section list 'li <> "\n") elements))
> (car items)
'(li (em (@ (class "prime")) "two") "\n")
```

```drracket
; Convert that into the '(tag item1 item2 ...) form.
> (define lst (cons 'ul items))
> (take lst 2)
'(ul (li (em (@ (class "prime")) "two") "\n"))
```

```drracket
; Wrap that in the body tag.
> (define body (list 'body items))
```

```drracket
; Wrap that in the HTML tag.
> (define page (list 'html body))
```

```drracket
; Check our results
> (display (xml->string page))
Output! <html><body><li><em class="prime">two</em>
Output! </li><li><em class="prime">three</em>
Output! </li><li><em class="prime">five</em>
Output! </li><li><em class="prime">seven</em>
Output! </li></body></html>
```

The HTML is not particularly well formatted, but it should achieve
the results we want.

## Self checks

### Self-check 1

a. What list would you expect to get from the following?

```drracket
> (string->xml "<p class='self-check' id='1'>This is self-check <em>one</em>!</p>")
```

b. What string would you get from the following?

```drracket
> (xml->string '(q (span (@ (class "alice")) "Alice") "said" (q (em "nothing"))))
```

### Self-check 2 (‡)

a. Write an expression that counts how many paragraphs in a document
contain an emphasis tag.  (Note: You'll need to be careful about paragraphs
that contain multiple emphasis tags.)

b. Write an expression that counts how many paragraphs in a document
contain multiple emphasis tags.

## Acknowledgements

This reading first appeared in spring 2019.  Samuel A. Rebelsky wrote most of the text.
In developing the document, Rebelsky relied on a variety of sources, including

* [The W3Schools XPath Tutorial](https://www.w3schools.com/xml/xpath_intro.asp).
* [The W3Schools XSLT Tutorial](https://www.w3schools.com/xml/xsl_intro.asp).
* [The Racket SXML documentation](https://docs.racket-lang.org/sxml/).

The libraries to support these exercises rely not only on the Racket SXML libraries, but also Neil Van Dyke's [html-parsing](https://docs.racket-lang.org/html-parsing/) and [html-writing](https://docs.racket-lang.org/html-writing/) libraries.

