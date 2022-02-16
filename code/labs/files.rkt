#lang racket

(provide (all-defined-out))
(require csc151)

;; CSC-151 (SEMESTER)
;; Lab: Files
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

; +-------------+----------------------------------------------------
; | Preparation |
; +-------------+

#|
In this lab, you and your partner will practice manipulating files
and strings using file and regular-expression (rex) procedures.

Don't forget our new "start of session".  Chat with your partner
about working habits and strengths.  Consider sharing something
interesting about yourself.  

Make sure to save this file as files.rkt.
|#

#| AB |#

; +--------------------------------+---------------------------------
; | Exercise 1: Working with texts |
; +--------------------------------+

#|
Project Gutenberg <https://www.gutenberg.org/> provides an extensive
collection of public domain books in a variety of forms, including
"plain text".

a. Navigate to the Project Gutenberg Web site and download one or two books 
in plain text format. Strive for short- to medium-length books.
_Jane Eyre_ <https://www.gutenberg.org/ebooks/1260> is okay. _The Complete 
Works of William Shakespeare_ <https://www.gutenberg.org/ebooks/100> is not.
Note: You can right click on the link to the text file and select
"Save Link As" to save the file.

<TODO: Enter the title or titles of the books and the corresponding file names.>

b. Pick one of the books you've downloaded and open it in a text editor
to view the content.  If you are working in MathLAN, gedit is the preferred
text  editor, but you can also open it in DrRacket.  (If you do the latter,
don't try to run it.)  Take notes of anything you observe as you glance
through the file.  Spend no more than three minutes looking at the file.

<TODO: Enter notes of anything you observe.>
|#

#| A |#

; +-------------------------------------------+----------------------
; | Exercise 2: Working with texts, revisited |
; +-------------------------------------------+

#|
a. Using a file you downloaded in the prior exercise, write
instructions in the definitions pane to read the characters, words,
lines, and complete contents from the book. (The contents should
be a single string.)  Call the results book-characters, book-words,
book-lines, and book-contents. For example,

(define book-characters (file->chars "pg1260.txt"))
|#

(define book-characters "<FILL IN>")

(define book-words "<FILL IN>")

(define book-lines "<FILL IN>")

(define book-contents "<FILL IN>")

#|
b. Write instructions to extract the first 20 characters, 10 words,
and 5 lines from the book.  Hint: Use list operations you know, such
as `take` or `drop`.
|#

(define first-20-chars "<FILL IN>")

(define first-ten-words "<FILL IN>")

(define first-five-lines "<FILL IN>")

#|
c. Determine how many characters are in the book (in the Scheme
sense, not in the "Alice", "Dr. Strangelove", or "Cowardly Lion"
sense).
|#

(define total-characters "<FILL IN>")

#|
d. Determine how many letters (letters, not characters) appear 
in the book.
|#

(define total-letters "<FILL IN>")

#|
d. Write instructions to extract lines 100 (inclusive) through 120
(exclusive) from the book.
|#

(define lines-100-to-120 "<FILL IN>")

#|
e. Write instructions to determine how many times the letter "a" appears 
in the book. (You need deal only with lowercase "a".)
|#

(define count-of-as "<FILL IN>")

#| B |#

; +----------------------------+-------------------------------------
; | Exercise 3: Creating files |
; +----------------------------+

#|
As you may recall, the procedure (string->file str fname), saves a
string to the named file. There's also a (lines->file lines fname),
that saves a list of strings to the named file, one string per line.
|#

#|
a. Write a procedure to save line 100 of any file to the file line100.txt. 
|#

;;; (save-line-100 infile) -> void?
;;;   infile : string?
;;; Save line 100 of the given file to line100.txt
(define save-line-100
  (lambda (infile)
    ???))

#|
b. Use that procedure to save line 100 of your book to line100.txt.
Your call will look something like the following.

    (save-line-100 "pg1260-1.txt")

You don't have to enter anything here.
|#

#|
c. Check in the filesystem to make sure that you successfully
created that file.
|#

#|
d. Verify that you were successful by using file->string with that
same file name.

    (define line100 (file->string "line100.txt"))
|#

#|
e. Write a procedure to save lines 100 (inclusive) through 120 (exclusive) 
of any file to the file excerpt.txt.
|#

;;; (save-lines-100-to-120 fname) -> void?
;;;   fname : string?
;;; Saves lines 100 (inclusive) to 120 (exclusive) of
;;; the given file to the file excerpt.txt
(define save-lines-100-to-120
  (lambda (infile)
    ???))

#|
f. Use that procedure to save those lines from your book.
Your call will look something like the following.

    (save-lines-100-to-120 "pg1260-1.txt")

You don't have to enter anything here.
|#

#|
g. Check in the filesystem to make sure that you successfully
created that file.
|#

#|
h. Verify that you were successful by using file->string with that same 
file name.

    (define excerpt (file->string "excerpt.txt"))
|#

#| AB |#

; +------------------+-----------------------------------------------
; | Submit your work |
; +------------------+

#|
Submit your work to Gradescope.  Note that you will likely need to
submit the text files you've downloaded/created in addition to the
DrRacket file.
|#

#| AB |#

; +---------------------------+--------------------------------------
; | For those with extra time |
; +---------------------------+

#|
If you find that you have extra time, you might attempt one or
more of the following exercises.
|#

; +---------------------------+--------------------------------------
; | Extra 1: Something phishy |
; +---------------------------+

#|
Consider the following variable named `phishy`.
|#

(define phishy
  "fishy: one cat, one hat, two things, \none fish, two fish, red fish, blue fish, green and yellow fish \nred books \n\n\none and two\tor\tthree and four\nthat is flat\n")

#|
a. Suppose we create a file with 

    (string->file phishy "phishy.txt") 

What do you expect the contents of that file to look like?

<TODO: Enter an answer here.>
|#

#|
b. Check your answer experimentally.

<TODO: Cut and paste the results of your experiment here.>
|#

#|
c. One way to break up that string is at each space. Write an expression 
to do so. (You should not need regular expressions, at least not yet;
`string-split` should suffice.)
|#

(define split-at-space "<TODO>")

#|
d. Another way to break up that string is at each newline character.
Write an expression to do so. (You still should not need regular
expressions, at least not yet.)
|#

(define split-at-newline "<TODO>")

#|
e. The word "and" appears a few times in that string. Split it at that word.
|#

(define split-at-and "<TODO>")

; +---------------------------------+--------------------------------
; | Extra 2: Generalized extraction |
; +---------------------------------+

#|
In the main part of the lab, we wrote a procedure that extracted
line 100 of a file and saved it to another file, as well as a procedure
that extracted lines 100 (inclusive) to 120 (exclusive) of a file
and saved them to another file.  Generalize these functions using
the following documentation.
|#

;;; (excerpt start finish source target) -> void?
;;;   start : integer? (line number)
;;;   finish : integer? (line number)
;;;   source : string? (file name)
;;;   target : string? (file name)
;;; Extract lines start (inclusive) to finish (exclusive) of source,
;;; saving the result to target.
(define excerpt
  (lambda (start finish source target)
    ???))

