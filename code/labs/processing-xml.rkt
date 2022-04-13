#lang racket

(require csc151)
(require csc151/rex)
(require csc151www)

;; CSC 151-NN (SEMESTER)
;; Lab: Processing XML (processing-xml.rkt)
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

; +-------------------------+----------------------------------------
; | Exercise 0: Preparation |
; +-------------------------+

#|
We repeat the preparation instructions here as a reminder of what
you need to get done to make the lab work.
|#

#|
a. Have the traditional start-of-lab discussion.  That is, introduce
yourselves; discuss working strategies, strengths, and weakness; and
review the reading.
|#

#|
b. You'll need a variety of packages for this lab.  Install the 
following packages in DrRacket using File -> Install Package....

* `html-parsing`
* `html-writing`
* `sxml`
* `https://github.com/grinnell-cs/csc151www.git#main`
|#

#|
c. Make a copy of [excerpt.html](../files/sample-web/excerpt.html),
which you may recall from a recent lab.
|#

#| A |#

; +--------------------------------------------+---------------------
; | Exercise 1: From HTML strings to XML lists |
; +--------------------------------------------+

#|
a. Write a string that describes a portion of an HTML page that
contains at least two paragraphs, each of which has an emphasis tag
and one of which has a strong tag.
|#

(define two-paragraphs
  "<p>...</p><p>...</p>")

#|
b. Predict the result of converting that string to an SXML structure
(the list-based representation of XML).

<TODO: Enter your prediction.
|#

#|
c. Check your answer experimentally.  Enter an explanation of the
result.  If you're not sure what's going on, move on to part d.

    > (string->xml two-paragraphs)
    <TODO: ENTER YOUR OUTPUT>

<TODO: Enter an explanation.>
|#

#|
d. As you may have noticed, only the first of the two paragraphs was
converted.  Why?  Because `string->xml` expects *one* xml structure.
Hence, we'll need to group the two paragraphs into something, say
a `div`.

Verify that the following instruction adds the `div` tags appropriately.
You need not enter anything.
|#

(define two-paragraph-div
  (string-append "<div>" two-paragraphs "</div>"))

#|
e. Predict the structure of the converted string.

<TODO: Enter your prediction.>
|#

#|
f. Check your answer experimentally.  Then enter any notes.

    > (string->xml two-paragraph-div)
    <TODO: ENTER YOUR OUTPUT>

<TODO: Enter your notes.>
|#

#|
g. Consider `g1` and `g2` below.  Will they be the same or different?  
If they will be different, how?

<TODO: Enter your answer>
|#

(define g1 (string->xml "<div><p>One</p><p>Two</p></div>"))
(define g2 (string->xml "<div><p>One</p> <p>Two</p></div>"))

#|
h. Check your answer experimentally.  Enter any notes as to what
you observe.

<TODO: Enter your notes.
|#

#| B |#

; +--------------------------------------------+---------------------
; | Exercise 2: From SXML lists to HTML strings |
; +--------------------------------------------+

#|
a. Write a list-based SXML representation of an unordered list of
three aphorisms (common sayings), at least one of which contains
an emphasized word.
|#

(define aphorisms
  '(ul (li "Computers are sentient and malicious")
       (li "")
       (li "")))

#|
b. What do you expect to have happen if you convert that back to a string?

<TODO: Enter your answer.>
|#

#|
c. Check your answer experimentally.  Then add any notes.

    > (xml->string aphorisms)
    <TODO: Enter an answer here>

<TODO: Enter any notes>
|#

#|
d. Using `(string->file str fname)`, save the converted string to
a file named `pxml-02a.html` on your Desktop.  (You may also save
it elsewhere.)

    > <TODO: Enter the command you used>
|#

#|
e. Check the contents of the file by opening the file with GEdit.

<TODO: Enter any notes you may have.>
|#

#|
f. Load the file in your Web browser.  It will be at something like
`file:///home/username/Desktop/pxml-02a.html`.  (You will have to
substitute your own user name.)

<TODO: Enter any notes you may have.>
|#

#|
g. Using `(xml->file aphorisms)`, save the XML to a file named
`pxml-02b.html` on your Desktop.  (You may also save it elsewhere.)
|#

#|
h. Check the contents of the file by opening the file with a
text editor.

<TODO: Enter any notes you may have.>
|#

#|
i. Load the file in your Web browser.  It will be at something like
`file:///home/username/Desktop/pxml-02b.html`.

<TODO: Enter any notes you may have.>
|#

#| A |#

; +---------------------------------------+--------------------------
; | Exercise 3: Rewriting HTML as strings |
; +---------------------------------------+

#|
You may recall that the file `excerpt.html` contains an excerpt from
_Through the Looking Glass_.
|#

#|
a. Review the HTML document by opening it in a text editor.
|#

#|
b. Review the HTML document by opening it in your Web browser.
|#

#|
c. Write instructions to read in `excerpt.html`, delete all spaces,
and save it to `pxml-03a.html`.  You will likely want to use
`file->string`, `string-replace`, and `string->file`.

<TODO: Enter your instructions here.>
|#

#|
d. What do you expect the new file to look like when you load it
in your Web browser?

<TODO: Enter your answer here.>
|#

#|
e. Open the file in your Web browser to check your answer.  Then enter
any notes you have.  You may also want to open the file in a text editor
to check what is happening.

<TODO: Enter your notes here.
|#

#|
f. Propose a mechanism for dealing with any problems you observed.
Do not spend more than three minutes on this part of the exercise. 

<TODO: Enter suggestions.>
|#

#|
g. Write a set of instructions to read in `excerpt.html`, replace
all `em` tags with `strong` tags, and save the result back to
`pxml-03b.html`.  Once again, you should stick with the string
representation, and use `file->string`, `string-replace`, and
`string->file`.
|#

#|
h. Check your results as above.

<TODO: Enter an notes.>
|#

; +-----------------------------------------------------------------------+
; | Exercise 4: Extracting information from HTML with regular expressions |
; +-----------------------------------------------------------------------+

#|
a. Write instructions to load `excerpt.html` into a string, which we
will call `excerpt`.
|#

(define excerpt
  ???)

#|
b. Using regular expressions, determine how many times a quotation
appears in `excerpt`.  You will likely use `rex-find-matches` to
extract all of them and then `length` to count them.
|#

(define count-of-quotations-rex
  ???)

#|
c. Using regular expressions, determine how many times emphasized
text appears in `excerpt`.
|#

(define count-of-emphasis-rex
  ???)

#|
d. Using regular expressions, determine how many times emphasized
text appears within a quotation.  Spend no more than three minutes
on this problem; it's okay if you don't get it quite right.
|#

(define count-of-emphasis-in-quotes-rex
  ???)

#|
e. Write a procedure, `(count-paragraphs-rex str)`, that uses regular
expressions to count how many paragraph tags appear in `str`.
|#

(define count-paragraphs
  (lambda (str)
    ???))

#|
f. Using regular expressions, determine what portions of 
`excerpt` are emphasized.  Your result should be a list of
strings.  Do not spend more than three minutes on this
part of the exercise.
|#

(define emphasized-portions-rex
  ???)

#| B |#

; +---------------------------------+--------------------------------
; | Exercise 5: Switching to SXPath |
; +---------------------------------+

#|
a. Store the contents of `excerpt.html` in an SXML structure.
|#

(define excerpt-sxpath
  ???)

#|
b. Using `sxpath-match`, determine how many quotations are in 
`excerpt-sxpath`.
|#

(define count-of-quotations-sxpath
  ???)

#|
c. Using `sxpath-match`, determine how many times emphasized
text appears in `excerpt`.
|#

(define count-of-emphasis-sxpath
  ???)

#|
d. Using `sxpath-match`, determine how many times emphasized
text appears within a quotation.  Spend no more than three minutes
on this problem; it's okay if you don't get it quite right.
|#

(define count-of-emphasis-in-quotes-sxpath
  ???)

#|
e. Write a procedure, `(count-paragraphs-sxpath str)`, that uses
`sxpath-match` to determine how many paragraph tags appear in `str`.
|#

(define count-paragraphs-sxpath
  (lambda (str)
    ???))

#|
f. Using `sxpath`, determine what portions of `excerpt.html` are
emphasized.  Your result should be a list of strings.  Do not spend
more than three minutes on this part of the exercise.  
|#

(define emphasized-portions-sxpath
  ???)

; +----------------------------------+-------------------------------
; | Exercise 6: Comparing approaches |
; +----------------------------------+

#|
In a paragraph or two, summarize the strengths and weaknesses
of each approach to analyzing HTML documents.  (The approaches
are regular expressions/strings and `sxpath`.)

<TODO: Enter your notes here.>
|#

#| A |#

; +-----------------------------------+------------------------------
; | Exercise 7: Summarizing documents |
; +-----------------------------------+

#|
In the reading, we said that it should be possible to extract all
of the emphasized text from a document and then put it into a new
document by putting the list of elements in a paragraph, the paragraph
in a body element, and the body in an html element.

That is, repeat the steps from the reading, using `q` rather than
`em`, and making any other modifications you consider appropriate.
|#

#|
a. Try doing that with all the quotations in the `excerpt.html` document.
You should save the result in `excerpt-quotations.html`.

<TODO: Enter your instructions here.
|#

#|
b. Preview the document you created.  You need not enter anything
for this exercise.
|#

#|
c. Enter notes on what was interesting/useful about this exercise.

<TODO: Enter your notes.>
|#

#| AB |#

; +------------+-----------------------------------------------------
; | Submitting |
; +------------+

#|
You should submit your processing-xml.rkt file as well as any files
that you explicitly read.
|#

#| AB |#

; +---------------------------+--------------------------------------
; | For those with Extra Time |
; +---------------------------+

#|
If you find that you have extra time, you should read over the
following exercises and choose one or more to attempt.
|#

; +-------------------------+----------------------------------------
; | Extra 1: Inserting text |
; +-------------------------+

#|
a. Write a procedure that inserts the text `"PAY ATTENTION:"` at
the start of every quotation.

Reminder: You can use `append` to join lists.  In this case, you'll
want to join a list of the tag (and, possibly, the attributes), a
list of the string, and the rest of the contents of the element.

Note that this process is complicated by the possible inclusion of
attributes in the quotation.  Fortunately, there's a `(has-attributes?
element)` procedure that checks whether or not there's a set of
attributes.
|#

(define pay-attention
  (lambda (sxml)
    ???))

; +---------------------------+--------------------------------------
; | Extra 2: From XML to HTML |
; +---------------------------+

#|
When we studied XML and HTML, we saw that XML is much more expressive
than HTML, but that HTML provides a bit more standardization on the
components of a document.  It is therefore often useful to store
information in the more expressive XML form and then use a program
to automatically convert the XML to HTML for display.  XSLT can do
this, but it's sometimes a bit complicated, so we'll do so using
Racket.

Consider the following XML document, taken from the reading on
XML, intended to represent a list of books.

    <?xml version="1.0" encoding="UTF-8"?>
    <collection>
      <name>Project Gutenberg</name>
      <bookinfo book-id="000001">
        <author><first>Thomas</first> <last>Jefferson</last></author>
        <title>The Declaration of Independence of the United States of America</title>
        <url>https://www.gutenberg.org/ebooks/1</url>
      </bookinfo>
      <bookinfo book-id="000002">
        <author>
          Anonymous
          <alternative>
            The United States of America
          </alternative>
        </author>
        <title>The United States Bill of Rights</title>
        <url>https://www.gutenberg.org/ebooks/2</url>
      </bookinfo>
      <bookinfo book-id="000011">
        <author author-id="412369">
          <first>Lewis</first> <last>Carroll</last>
          <alternative>
            <first>Charles</first> <middle>Lutwidge</middle> <last>Dogson</last>
          </alternative>
        </author>
        <title>Alice's Adventures in Wonderland</title>
        <url>https://www.gutenberg.org/ebooks/11</url>
      </bookinfo>
      <bookinfo book-id="000012">
        <author author-id="412369"/>
        <title>Through the Looking-Glass</title>
        <url>https://www.gutenberg.org/ebooks/12</url>
      </bookinfo>
    </collection>

We might want to turn that information into a Web page with 
quick links to each of the books mentioned.  In particular,
we'd like something like the following.

    <html>
    <head>
    <title>Some online books at Project Gutenberg</title>
    </head>
    <body>
    <ul>
      <li><a href="https://www.gutenberg.org/ebooks/1">The Declaration of Independence of the United States of America</a></li>
      <li><a href="https://www.gutenberg.org/ebooks/2">The United States Bill of Rights</a></li>
      <li><a href="https://www.gutenberg.org/ebooks/11">Alice in Wonderland</a></li>
      <li><a href="https://www.gutenberg.org/ebooks/12">Through the Looking-Glass</a></li>
    </ul>
    </body>
    </html>

In an abbreviated list representation, we might express that as follows.

    '(html
      (head (title "Some online books at Project Gutenberg"))
      (body
       (ul
        (li (a (@ (href "https://www.gutenberg.org/ebooks/1")) "The Declaration of Independence of the United States of America"))
        (li (a (@ (href "https://www.gutenberg.org/ebooks/2")) "The United States Bill of Rights"))
        (li (a (@ (href "https://www.gutenberg.org/ebooks/11")) "Alice in Wonderland"))
        (li (a (@ (href "https://www.gutenberg.org/ebooks/12")) "Through the Looking-Glass")))))
|#

#|
a. Write a procedure, `book->list-item` that takes a book in list-based XML form
and converts it to corresponding HTML in the form listed above.

    > (define bill-of-rights
        '(bookinfo (@ (book-id "000002")) 
                   (author "Anonymous" 
                           (alternative "The United States of America")) 
                   (title "The United States Bill of Rights") 
                   (url "https://www.gutenberg.org/ebooks/2")))
    
    > (book->list-item bill-of-rights)
    '(li (a (@ (href "https://www.gutenberg.org/ebooks/2")) "The United States Bill of Rights"))
|#

(define book->list-item
  (lambda (book)
    ???))

#|
b. Save the XML from above into `books.xml`.
|#

#|
c. Using `file->xml` and `sxpath-match`, extract a list of the books
from `books.xml`.

<TODO: Enter your instructions.>
|#

#|
d. Using a technique similar to that of earlier problems, turn your
list of books into a Web page (in SXML list representation).  That
is,

* Apply `book->list-item` to each element of the list.
* Prepend `ul` using `cons`.
* Wrap the new `ul` element in a `body`.
* Create a `head` element with a title.
* Wrap the `head` and `body` elements into an `html` element.

<TODO: Enter your instructions>
|#

#|
e. Save your result to `books.html` and load it into your Web browser.
|#
