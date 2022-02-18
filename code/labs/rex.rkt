#lang racket

(provide (all-defined-out))
(require csc151)
(require csc151/rex)

;; CSC-151 (SEMESTER)
;; Lab: Regular Expressions
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

#| AB |#

; +-------------+----------------------------------------------------
; | Preparation |
; +-------------+

#|
In this lab, you and your partner will practice manipulating files
and strings using file and regular-expression (rex) procedures.

a. Don't forget our new "start of session".  Chat with your partner
about working habits and strengths.  Maybe share something interesting
about yourself.

b. Make sure to save this file as `rex.rkt`.
|#

; +---------------+--------------------------------------------------
; | Provided code |
; +---------------+

(define phishy
  "fishy: one cat, one hat, two things, \none fish, two fish, red fish, blue fish, green and yellow fish \nred books \n\n\none and two\tor\tthree and four\nthat is flat\n")

#| B |#

; +--------------------------------------------------------+---------
; | Exercise 1: Splitting strings with regular expressions |
; +--------------------------------------------------------+

#|
Let's suppose we want to break `phishy` into smaller groups of strings.
|#

#|
a. One way to break up that string is at each space. Write an expression 
to do so. (You should not need regular expressions, at least not yet;
`string-split` should suffice.)  

Note that your goal here is that `split-at-space` is a list of strings.
You need not write a procedure here (or anywhere in exercise 1).
|#

(define split-at-space "<TODO>")

#|
b. Another way to break up that string is at each newline character.
Write an expression to do so. (You still should not need regular
expressions, at least not yet.)
|#

(define split-at-newline "<TODO>")

#|
c. The word "and" appears a few times in that string. Split it at that word.
|#

(define split-at-and "<TODO>")

#|
d. As you may have noted in the previous exercise, it seems insufficient
to split at a space, or a newline, or even a tab (which we didn't
try yet).

Write an expression that uses regular expressions to split phishy
at any single whitespace character (space, tab, or newline).  You
should use `rex-split-string` and a rex of your choice (probably
a `rex-char-set` or a `rex-any-of`).
|#

(define split-at-whitespace "<TODO>")

#|
e. As you may noted (perhaps should have noted), the list created
by `split-at-whitespace` contains many empty strings.  That's because
we're splitting at a single whitespace character but the file
contains sequences of whitespace characters, such as a space and a
newline, or multiple newlines in a row. Write an expression that
splits sample at any nonempty sequence of whitespace characters.
|#

(define split-at-whitespace-sequences "<TODO>")

#|
f. As you may have noted, the previous example includes characters
in "words" that are not alphabetical, such as the colon in "fishy:"
and the comma in "hat,". Write an expression that splits sample at
any nonempty sequence of non-alphabetical characters.

Note: You may have to list all of the alphabetical characters.  Or
you can copy them from here.

"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
|#

(define split-at-non-alphabetical "<TODO>")

#| A |#

; +------------------------------+-----------------------------------
; | Exercise 2: Extracting words |
; +------------------------------+

#|
a. Write a procedure, (string->simple-words str), that takes a string as
input and splits it into the "words" (sequences of alphabetical
characters).  You should use `rex-find-matches` and an appropriate
rex pattern.

> (string->simple-words phishy)
'("fishy" "one" "cat" "one" "hat" "two" "things" "one" "fish" "two" "fish" "red" "fish" "blue" "fish" "green" "and" "yellow" "fish" "red" "books" "one" "and" "two" "or" "three" "and" "four" "that" "is" "flat")
> (string->simple-words "hello+goodbye, ph33r")
'("hello" "goodbye" "ph" "r")
|#

;;; (string->simple-words str) -> listof? string?
;;;   str : string?
;;; Make a list of all the words (sequences of letters)
;;; that appear in str.
(define string->simple-words
  (lambda (str)
    ???))

#|
b. Write a procedure, `(string->words str)`, that takes a string
as input and splits into words that can contain alphabetical characters,
hyphens, apostrophes, and digits.
|#

;;; (string->words str) -> listof? string?
;;;   str : string?
;;; Make a list of all the words (sequences of letters, hyphens,
;;; apostrophes, and digits) that appear in str.
(define string->words
  (lambda (str)
    ???))

#| B |#

; +----------------------------+-------------------------------------
; | Exercise 3: Matching words |
; +----------------------------+

#|
Once we have a list of words (or any strings), we may want to extract the
ones that match a certain pattern.  For example, we might want all the
words that start with an f.

    > (define lowercase (rex-char-range #\a #\z))
    > (define lowercase-sequence (rex-repeat-0 lowercase))
    > (define rex-starts-with-f
        (rex-concat (rex-string "f") 
                    lowercase-sequence))
    > (filter (section rex-matches? rex-starts-with-f <>)
              (string->words phishy))
    '("fishy" "fish" "fish" "fish" "fish" "fish" "four" "flat")

Write a procedure, `(rex-match-strings rex strings)`, that takes
a rex-style regular expression and a list of strings as parameters
and returns those in the list that match `rex`.

    > (rex-match-strings rex-starts-with-f (string->words phishy))
    '("fishy" "fish" "fish" "fish" "fish" "fish" "four" "flat")
    > (rex-match-strings (rex-concat lowercase-sequence
                                     (rex-string "o")
                                     lowercase-sequence)
                         (string->words phishy))
    '("one" "one" "two" "one" "two" "yellow" "books" "one" "two" "or" "four")
|#

;;; (rex-match-strings rex strings) -> list-of string?
;;;   rex : rex?
;;;   strings : list-of string?
;;; Find all of the elements of strings for which `(rex-match rex str)`
;;; holds.
(define rex-match-strings
  (lambda (rex strings)
    ???))

#| A |#

; +------------------------+-----------------------------------------
; | Exercise 4: Word games |
; +------------------------+

#|
As you might expect, `rex-match-strings` can help with a variety of
word games or puzzles, such as "list all words that contain the
five vowels in alphabetical order".

Of course, to do so, we need a long list of words.

Fortunately, most Linux systems come with such a list, which is often
stored in `/usr/share/dict/words`.  Since that list is in the public
domain, we've made a copy which you should have downloaded as `words.txt`.
(If not, go back to the instructions for the lab.)
|#

#|
a. Using `file->lines`, read the words file into a variable.
|#

(define words ???)

#|
b. Using `rex-match-strings`, a regular expression of your own design,
and `words`, find all the words that start with a z and end with a
y.
|#

(define zy ???)

#|
c. Using `rex-match-strings`, a regular expression of your own design,
and `words`, find all the words that start with an x, end with an a,
and have exactly nine letters.
|#

(define x9a ???)

#|
d. Using `rex-match-strings`, a regular expression of your own design,
and `words, find all the words that contain the five vowels (a, e, i, o,
and u) in order.
|#

(define aeiou ???)

#| AB |#

; +------------------+-----------------------------------------------
; | Submit your work |
; +------------------+

#|
a. Make sure you've saved this file as rex.rkt.

b. Upload this file to Gradescope.  (If all goes well, it should be
able to find the words.txt file.)
|#

#| AB |#

; +---------------------------+--------------------------------------
; | For those with extra time |
; +---------------------------+

#|
If you find that you have extra time, come up with some other interesting
patterns to look for in the words list.
|#
