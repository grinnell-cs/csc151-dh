#lang racket

(require csc151)
(require csc151/rex)
(require csc151www)

;; CSC 151-NN (SEMESTER)
;; Lab: Transforming XML (transforming-xml.rkt)
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
b. Save this file as `transforming-xml.rkt`.
|#

#|
c. You'll need a variety of packages for this lab.  If you haven't done
so already, install the following packages in DrRacket using File ->
Install Package....

* `html-parsing`
* `html-writing`
* `sxml`
* `https://github.com/grinnell-cs/csc151www.git#main`
|#

#|
d. Make a copy of [excerpt.html](../files/sample-web/excerpt.html),
which you may recall from a recent lab.
|#

#|
e. Read the file `excerpt.html` into the variable `excerpt`.
|#

(define excerpt
  (file->xml "excerpt.html"))

#| A |#

; +----------------------------------+-------------------------------
; | Exercise 1: Exploring quotations |
; +----------------------------------+

#|
As you may recall, `excerpt.html` contains a short excerpt from
_Through the Looking Glass_.
|#

#|
a. Write an expression that identifies all of the quotations in that
document.
|#

(define excerpt-quotations
  ???)

#|
b. Write an expression that identifies all of the quotations by the
White Queen.  You may have to review the original document to determine
how we have marked such quotations.
|#

(define white-queen-says
  ???)

#|
c. Write an expression that identifies all of the spoken quotations.
|#

(define excerpt-spoken-quotations
  ???)

#| B |#

; +----------------------------------+-------------------------------
; | Exercise 2: Off with their heads |
; +----------------------------------+

#|
a. Write an expression that replaces every one of the White Queen's
quotations with the text "Off with their heads!".  You can check
the result by saving to a file with

    > (xml->file white-queen-now-says "temp.html")

and then opening the file in a Web browser.
|#

(define white-queen-now-says
  ???)

#|
b. Write an expression that removes every one of the White Queen's
quotations.  Once again, you can check the result by saving to a
file with

    > (xml->file silence-the-white-queen "temp.html")

and then opening the file in a Web browser.
|#

(define silence-the-white-queen
  ???)

#| A |#

; +--------------------------+---------------------------------------
; | Exercise 3: Reformatting |
; +--------------------------+

#|
a. Write an expression that strongly emphasizes every spoken quotation .
That is, put a `strong` tag around the quotation.  Once again, you may
want to preview the result in a Web browser.
|#

(define speak-strongly
  ???)

#|
b. Write an expression that turns every spoken quotation into all caps.
That is, identify the text within the quotation and call `string-upcase`
on that text.
|#

(define cap-says
  ???)

#| B |#

; +-----------------------------+------------------------------------
; | Exercise 4: Dequoting Alice |
; +-----------------------------+

#|
Write an expression that removes the `q` tag from any of Alice's quotations.
|#

(define dequote-alice
  ???)

#| A |#

; +----------------------------+-------------------------------------
; | Exercise 5: Inserting text |
; +----------------------------+

#|
Write an expression that inserts the text `"PAY ATTENTION:"` at the
start of every quotation.  

Reminder: You can use `append` to join lists.  In this case, you'll
want to join a list of the tag (and, possibly, the attributes), a
list of the string, and the rest of the contents of the element.

Note that this process is complicated by the possible inclusion of 
attributes in the quotation.  Fortunately, there's a 
`(has-attributes? element)` procedure that checks whether or not there's
a set of attributes.
|#

(define pay-attention
  ???)

#| AB |#

; +----------------+-------------------------------------------------
; | Time to submit |
; +----------------+

#|
Make sure to submit both the racket file and the excerpt.html file.
|#

; +---------------------------+--------------------------------------
; | For those with extra time |
; +---------------------------+

#|
Start working on the next mini-project.
|#
