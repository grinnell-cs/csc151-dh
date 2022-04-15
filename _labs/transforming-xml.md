---
title: Processing XML
summary: |
  We consider some techniques for transforming XML documents, including
  ways to extract information from XML documents and to build new XML
  documents from old.
---

## Useful notation

`'(tag (@ (name1 val1) (name2 val2) ...) element1 element2 ...)`
  : A list-based representation of an XML/HTML element.
    The attribute section is optional.
    The elements are either strings or themselves XML/HTML elements.

`"//tag"` 
  : An XPath pattern to search for elements with the given tag.

`"//tag0/tag1"` 
  : An XPath pattern to search for elements with tag `tag1`
that appear directly under elements with tag `tag0`.

`"//tag0//tag1"` 
  : An XPath pattern to search for elements with tag `tag1`
    that appear anywhere under elements with tag `tag0`.

`"//tag[1]"` 
  : An XPath pattern for the first instance of the tag within an enclosing
    element.  (We also have similar `"//tag[2]"` and so on and so forth.)

`"//tag[@class='name']"` 
  : An XPath pattern for all tags with the given class.

`"//tag[contains(@class, 'name')]`
  : An XPath pattern for all tags whose class includes the name.
    Particularly useful when we assign multiple classes to the same
    tag.

`"//text()"` 
  : An XPath pattern for all of the text in a document.

`"//tag[contains(text(),'string')]"` 
  : An XPath pattern for all instances of the tag that contain that 
    string in their text.

## Useful procedures

`(file->xml fname)` 
  : Read an HTML or XML document and convert it to the list-based 
    representation.

`(xml->file xml fname)` 
  : Save the list-based representation of an HTML or XML document in 
    a file.

`(string->xml str)` 
  : Convert a string to the list-based representation.

`(xml->string xml)` 
  : Convert the list-based representation to a string.

`(sxpath-match pattern xml)` 
  : Search the xml document for matching patterns.

`(sxpath-replace pattern xml proc)` 
  : Update any element matching the pattern by applying `proc`.

`(sxpath-delete pattern xml)` 
  : Delete any element matching the pattern.

`(sxpath-remove pattern xml)` 
  : Remove the tag in any element matching
    the pattern, moving any contents of the element up to the enclosing
    element.

## Preparation

a. Have the traditional start-of-lab discussion.  That is, introduce
yourselves; discuss working strategies, strengths, and weakness; and
review the reading.

b. You'll need a variety of packages for this lab.  Install the 
following packages in DrRacket using File -> Install Package....

* `html-parsing`
* `html-writing`
* `sxml`
* `https://github.com/grinnell-cs/csc151www.git#main`

c. Make a copy of [excerpt.html](../files/sample-web/excerpt.html),
which you may recall from [a recent lab](../labs/www).

d. Download the starter code for this lab.

* [transforming-xml.rkt](../code/labs/transforming-xml.rkt)

## Acknowledgements

This lab is closely based on [an earlier lab by Samuel A. Rebelsky](https://rebelsky.cs.grinnell.edu/~rebelsky/Courses/CSC151/2019S/labs/transforming-xml.html).  In Spring 2022, it was updated to add more details, to take the new "instructions in code form", and to accommodate changes to our libraries.

The `csc151www` libraries to support these exercises on on the [Racket SXML libraries](https://docs.racket-lang.org/sxml/), and on Neil Van Dyke's [html-parsing](https://docs.racket-lang.org/html-parsing/) and [html-writing](https://docs.racket-lang.org/html-writing/) libraries.
