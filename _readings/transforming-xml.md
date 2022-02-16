---
title: Transforming XML
summary: |
  We consider some additional techniques for transforming XML documents
  that build upon our work in extracting information from XML documents.
---
In our initial explorations of [ways to process XML]({{ "/readings/processing-xml.html" | relative_url }}), we considered some approaches to writing programs that take a Web page as input and generate a new Web page based on the information on the page.

While such approaches can be useful, they are not universally applicable.
For example, what happens if we want to replace just one small portion of a page, keeping everything else the same?
Or what if we want to remove rather than extract portions of a page?

While there are XPath-based approaches for working with XML, we will instead return to a technique we are more accustomed to, recursion.
That is, since SXML structures are simply list structures, we can use what we know about recursing over lists to recurse over SXML structures.  Well, almost.  SXML structures are *nested* lists, so we may have to think a bit about the nesting.

## SXML structures, a reminder

Just in case you've forgotten, an SXML structure can be one of two things.

* A string.
* A list consisting of a symbol, an optional attribute list, and zero or more other SXML structures.

The attribute list is a list whose `car` is an at sign (`@`) and whose `cdr` is a list of two-element lists, with the `car` of each list containing a symbol and the `cdr` containing the value, most frequently as a string.
For example, here's a simple paragraph containing some emphasized text.

```
(define ex1
  '(p (@ (class "abstract important"))
      (em "This is an "
          (em "emphasized")
          " sentence.")
      "  "
      "In contrast, this one is not emphasized."))
```

And here's that structure as HTML text.

```
> (display (xml->string ex1))
<p class="abstract important"><em>This is an <em>emphasized</em> sentence.</em>  In contrast, this one is not emphasized.</p>
```

You may note that the paragraph list has five elements.

* The symbol `'p`.
* An attribute list, `(@ (class "abstract important"))`
* Another SXML structure for an emphasized sentence.
* A string of spaces.
* A string for another sentence.

That emphasized sentence has

* The symbol `'em`
* No attribute list.
* A string
* Another SXML structure
* Another string.

## Our first example: Removing spaces

In [a recent lab](../labs/processing-xml) we tried to write a procedure (or at least an expression) that removed spaces from an HTML document.
Unfortunately, removing all spaces from the string using string-replace has some unintended consequences.
Consider our example from above, in HTML form.

```
(define ex2
  "<p class=\"abstract important\"><em>This is an <em>emphasized</em> sentence.</em>  In contrast, this one is not emphasized.</p>")
> (string-replace ex2 " " "")
"<pclass=\"abstractimportant\"><em>Thisisan<em>emphasized</em>sentence.</em>Incontrast,thisoneisnotemphasized.</p>"
> (string-replace ex2 " " "")
"<pclass=\"abstractimportant\"><em>Thisisan<em>emphasized</em>sentence.</em>Incontrast,thisoneisnotemphasized.</p>"
> (string->xml (string-replace ex2 " " ""))
'(pclass (@ (abstractimportant)) (em "Thisisan" (em "emphasized") "sentence.") "Incontrast,thisoneisnotemphasized.")
```

You may note that our `p` tag has turned into a `pclass` tag, our attributes have also lost their space, and more.

So, what can we do?
Instead of relying on a built-in DrRacket procedure, we can write our own.
First, we'll write a small helper that checks whether its parameter is a string.In that case, it deletes the spaces using string-replace.
Otherwise, it just gives back the value.

```
(define remove-spaces
  (lambda (val)
    (cond
      [(string? val)
       (string-replace val " " "")]
      [else
       val])))
```

Let's check it out

```
> (remove-spaces "hello world")
> (remove-spaces "hello world.  My name is eman.")
"helloworld.Mynameiseman."
> (remove-spaces '(p "Hello"))
'(p "Hello")
> (remove-spaces 'p)
'p
```

So far, so good.

But what should we do if we have something like `(p "Hello " (em "and") " goodbye")`?
Our `remove-spaces` procedure doesn't work on the list, because the list is not a string.

```
> (remove-spaces '(p "Hello " (em "and") " goodbye"))
'(p "Hello " (em "and") " goodbye")
```

However, we know one way of dealing with lists.
We can use `map` to do something to each element of the list.

```
> (map remove-spaces '(p "Hello " (em "and") " goodbye"))
'(p "Hello" (em "and") "goodbye")
```

That may get us started on writing a procedure that removes spaces from SXML structures.
If it's a string, we use our `remove-spaces` procedure.
If it's a list (which we'll check using `pair?`, because we assume that we'll have correct SXML), we map `remove-spaces` across the list.

```
(define xml-remove-spaces
  (lambda (val)
    (cond
      [(string? val)
       (remove-spaces val)]
      [(pair? val)
       (map remove-spaces val)]
      [else
       val])))
```

Let's see how it works.

```
> (xml-remove-spaces '(p "Hello " (em "and") " goodbye"))
'(p "Hello" (em "and") "goodbye")
> (xml-remove-spaces '(em "This is an "
                          (em "emphasized")
                          " sentence."))
'(em "Thisisan" (em "emphasized") "sentence.")
```

It looks like it's working fairly well.
Let's try it on a slightly different example.

```
> (xml-remove-spaces '(em "This is an "
                          (em "extra emphasized")
                          " sentence."))
'(em "Thisisan" (em "extra emphasized") "sentence.")
```

Unfortunately, we failed to remove the space in `"extra emphasized"`.

Why?

Because the `map` applied `remove-spaces` to `(em "extra emphasized")`.
And when `remove-spaces` is given a non-string, it just returns that value.

What we need is a procedure like `remove-spaces`, except that it handles both strings and SXML structures.

At this point, the Recursion Fairy should be whispering in your ear: "You're writing that procedure."
That's right , `xml-remove-spaces` should work with both strings and SXML lists, at least once we finish writing it.
And the magic of recursion is that by using it, we come closer to finish writing it.
So let's make that change.

```
(define xml-remove-spaces
  (lambda (val)
    (cond
      [(string? val)
       (remove-spaces val)]
      [(pair? val)
       (map xml-remove-spaces val)] ; Here's where we made the change.
      [else
       val])))
```

We'll check in on both the original examples and the previously failing example.

```
> (xml-remove-spaces '(p "Hello " (em "and") " goodbye"))
'(p "Hello" (em "and") "goodbye")
> (xml-remove-spaces '(em "This is an "
                          (em "emphasized")
                          " sentence."))
'(em "Thisisan" (em "emphasized") "sentence.")
> (xml-remove-spaces '(em "This is an "
                          (em "extra emphasized")
                          " sentence."))
'(em "Thisisan" (em "extraemphasized") "sentence.")
```

Amazingly, it worked!
Or perhaps not so amazingly.
That is, after all, the power of recursion.

Are we done?

No, not yet.

There's one simple update we shoud make.
The original `remove-spaces` is only being called if the input is a string.
The first thing `remove-spaces` does is check whether its input is a string.
So we might as well just use a procedure that knows that it's input is a string.
And we'll make it a local helper because, well, that's the right thing to do.

```
(define xml-remove-spaces
  (let ([remove-spaces (section string-replace <> " " "")])
    (lambda (val)
      (cond
        [(string? val)
         (remove-spaces val)]
        [(pair? val)
         (map xml-remove-spaces val)] ; Here's where we made the change.
        [else
         val]))))
```

It works.
Take our word for it.
It even works for something with much more nesting.

```
> (xml-remove-spaces '(p "In their list were " (ul (li "a book") (li "a movie") (li "and even a " (q "tv show")))))
'(p "Intheirlistwere" (ul (li "abook") (li "amovie") (li "andevena" (q "tvshow"))))
```

How does it work on our original example?

```
> ex1
'(p (@ (class "abstract important")) (em "This is an " (em "emphasized") " sentence.") "  " "In contrast, this one is not emphasized.")
> (xml-remove-spaces ex1)
'(p (@ (class "abstractimportant")) (em "Thisisan" (em "emphasized") "sentence.") "" "Incontrast,thisoneisnotemphasized.")
```

So close!

But not complete.

As you may have noted, we don't want to make the change in the attributes.
How do we avoid that?
We add a check in the case we have a pair.

```
(define xml-remove-spaces
  (let ([remove-spaces (section string-replace <> " " "")])
    (lambda (val)
      (cond
        [(string? val)
         (remove-spaces val)]
        [(pair? val)
         (cond
           [(eq? (car val) '@)
            val]
           [else
            (map xml-remove-spaces val)])]
        [else
         val]))))
```

As you might expect, we want to check the result.

```
> (xml-remove-spaces ex1)
'(p (@ (class "abstract important")) (em "Thisisan" (em "emphasized") "sentence.") "" "Incontrast,thisoneisnotemphasized.")
```

It works!

At this point, you may be wondering why we spent so much effort for a task as unlikely as "remove all the spaces".
It's mostly because the effect of removing spaces is so obvious.
And it helped us consider some important things we often need to do when we write procedures that process XML: We handle nested structures by mapping the same procedure over the whole list; we should skip the attribute lists (unless we want to change attributes); and we handle strings as a separate case.

So we're ready to explore a few more transformation, perhaps more sensible transformation.

## Our second example: Title Case

Or perhaps not so much more sensible.
For our second example, we'll convert our text to "Title Case".
In title case, the first letter of every word is capitalized.
Fortunately, Racket provides us with the handy-dandy `string-titlecase` procedure.

```
> (string-titlecase "hello world")
"Hello World"
> (string-titlecase "this or that")
"This Or That"
> (string-titlecase "THIS or thaT")
"This Or That"
```

Processing the SXML structure is fairly straightforward.
We use the pattern from above, substituting `string-titlecase` for `remove-spaces`.

```
(define xml-titlecase
  (lambda (val)
    (cond
      [(string? val)
       (string-titlecase val)]
      [(pair? val)
       (cond
         [(eq? (car val) '@)
          val]
         [else
          (map xml-titlecase val)])]
      [else
       val])))
```

It works as expected!

```
> ex1
'(p (@ (class "abstract important")) (em "This is an " (em "emphasized") " sentence.") "  " "In contrast, this one is not emphasized.")
> (xml-titlecase ex1)
'(p (@ (class "abstract important")) (em "This Is An " (em "Emphasized") " Sentence.") "  " "In Contrast, This One Is Not Emphasized.")
```

But what if we want to limit where we make changes?
For example, what if we only want to do titlecase in emphasized text?
In that case, we may need multiple procedures.
One searches for emphasized text and calls the second on the emphasized text.
The second converts to title case.

We already have the second procedure.  It's `xml-titlecase`.  So let's
work on the first.  It will have the same pattern as before, except
that (a) we won't modify the string in most cases and (b) when we see
an `em` at the start of a list, we'll switch to the other.

```
(define xml-titlecase-in-em
  (lambda (val)
    (cond
      [(string? val)
       val]
      [(pair? val)
       (cond
         [(eq? (car val) '@)
          val]
         [(eq? (car val) 'em)
          (xml-titlecase val)]
         [else
          (map xml-titlecase-in-em val)])]
      [else
       val])))
```

And it works as expected.

```
> (xml-titlecase-in-em ex1)
'(p (@ (class "abstract important")) (em "This Is An " (em "Emphasized") " Sentence.") "  " "In contrast, this one is not emphasized.")
```

Since the default case and the string case both return the parameter in its original form, we can shorten the code slightly.

```
(define xml-titlecase-in-em
  (lambda (val)
    (cond
      [(pair? val)
       (cond
         [(eq? (car val) '@)
          val]
         [(eq? (car val) 'em)
          (xml-titlecase val)]
         [else
          (map xml-titlecase-in-em val)])]
      [else
       val])))
```

### Example 3: Converting tags

Our examples so far have all had to do with converting text.
But we can also convert tags.
Or add attributes.
Consider, for example, the problem of converting all emphasized text (`em`) to strongly emphasized text (`strong`).

We can use the pattern from above, adding a bit more work when we identify an emphasized section.  Rather than just mapping the same procedure over the list, we'll map over the `cdr` of the list, and then add a new `car`.

```
(define xml-em->strong
  (lambda (val)
    (cond
      [(pair? val)
       (cond
         [(eq? (car val) '@)
          val]
         [(eq? (car val) 'em)
          (cons 'strong (xml-em->strong (cdr val)))]
         [else
          (map xml-em->strong val)])]
      [else
       val])))
```

We assume you've memorized the original example by now.

```
> (xml-em->strong ex1)
'(p (@ (class "abstract important")) (strong "This is an " (strong "emphasized") " sentence.") "  " "In contrast, this one is not emphasized.")
```

Once again, we might even do this only in limited contexts.
For example, we could convert only when we see emphasized text within a quotation.

```
(define xml-quoted-em->strong
  (lambda (val)
    (cond
      [(pair? val)
       (cond
         [(eq? (car val) '@)
          val]
         [(eq? (car val) 'q)
          (xml-em->strong val)]
         [else
          (map xml-quoted-em->strong val)])]
      [else
       val])))
```

Let's compare the behavior of the two procedures.

```
> (xml-em->strong '(ul (li (em "Unquoted emphasis")) (li (q (em "Quoted emphasis")))))
'(ul (li (strong "Unquoted emphasis")) (li (q (strong "Quoted emphasis"))))
> (xml-quoted-em->strong '(ul (li (em "Unquoted emphasis")) (li (q (em "Quoted emphasis")))))
'(ul (li (em "Unquoted emphasis")) (li (q (strong "Quoted emphasis"))))
```

## Self Checks

### Check 1: Tracing (‡)

In the discussion of `xml-remove-spaces`, we included the following example.

```
> (xml-remove-spaces '(p "In their list were " (ul (li "a book") (li "a movie") (li "and even a " (q "tv show")))))
'(p "Intheirlistwere" (ul (li "abook") (li "amovie") (li "andevena" (q "tvshow"))))
```

Give a rough trace of how we achieved the result.
You need not show all the steps.
For example, when we apply `xml-remove-spaces`, you can add a note as to which rule you're apply.  E.g.,

```
    (xml-remove-spaces '(p "In their list were " (ul (li "a book") (li "a movie") (li "and even a " (q "tv show")))))
    ; It's a list; map!
--> (list (xml-remove-spaces 'p) (xml-remove-spaces "In their list were ") (xml-remove-spaces (ul (li "a book") (li "a movie") (li "and even a " (q "tv show")))))
--> ...
```

### Check 2: Nested emphasis

Write a procedure `(xml-nested-em->strong xml)` that takes an SXML structure as a parameter and returns the same structure with any nested emphasis turned to a strong.  E.g.,

```
> (xml-nested-em->strong '(ul (li (em "This is " (em "doubly emphasized") " while")) (li "This is only " (em "singly emphasized."))))
'(ul (li (em "This is " (strong "doubly emphasized") " while")) (li "This is only " (em "singly emphasized."))))
```

## Acknowledgements

This reading is all new for Fall 2021!  Thank you to the Fall 2021 CSC-151 students who worked with the first version and provided useful commentary.
