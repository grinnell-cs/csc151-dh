#lang racket

(require csc151)
(require 2htdp/image)

;; CSC 151 (SEMESTER))
;; Lab: List Basics
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

#| AB |#

; +-------------+----------------------------------------------------
; | Preparation |
; +-------------+

#|
a. Introduce yourself to your partner.  Make sure to discuss work 
preferences and what you bring to the partnership.

b. If you haven't done so already, review the list of procedures
in the lab page, making sure that each of you understands the parameters and
purpose of each procedure.

c. Save the lab as `list-basics.rkt`.
|#

#| A |#

; +--------------------------------------+---------------------------
; | Exercise 1: Reviewing the self-check |
; +--------------------------------------+

#|
a. Predict the results of evaluating each of the following expressions.

> (list 2 1)
<ENTER YOUR ANSWER HERE>
> (make-list 1 2)
<ENTER YOUR ANSWER HERE>
> (make-list -1 2)
<ENTER YOUR ANSWER HERE>
> (map - (range 2))
<ENTER YOUR ANSWER HERE>
> (map - (range 2) (list 2 1))
<ENTER YOUR ANSWER HERE>
> (map range (list 2 1))
```
|#

#|
b. Check your predictions with DrRacket.  (Do the checks in the interactions
pane, not here.)
|#

#|
c. Predict the results of each of the following.  You may find it easiest
to check the result of each before going on to the next.

> (range 5 10)
<ENTER YOUR ANSWER HERE>
> (range -4 3)
<ENTER YOUR ANSWER HERE>
> (apply + (range 10))
<ENTER YOUR ANSWER HERE>
> (range 10 -5)
<ENTER YOUR ANSWER HERE>
> (range -5 -10)
<ENTER YOUR ANSWER HERE>
> (range -10 -5)
<ENTER YOUR ANSWER HERE>
> (range 1 9 2)
<ENTER YOUR ANSWER HERE>
> (apply + (range 1 10 2))
<ENTER YOUR ANSWER HERE>
> (range 10 -2 -5)
<ENTER YOUR ANSWER HERE>
|#

#|
d. Check your answers in the interactions pane.
|#

#|
e. Why do you think we had you try so many different inputs to `range`?

<ENTER YOUR ANSWER HERE>
|#

; +-----------------------------------+------------------------------
; | Exercise 2: Other list procedures |
; +-----------------------------------+

#|
The list of procedures in the lab description is not comprehensive.
Spend *no more than three minutes* coming up with a few other procedures
you've encountered that generate or process lists.  Here are some
hints that may help.

* What procedures do you know (other than those listed) that create a
  list of strings?
* What procedures do you know (other than those listed) that create a
  list of characters?
|#

; +---------------------------------+--------------------------------
; | Exercise 3: Translating numbers |
; +---------------------------------+

#|
Consider the problem of turning a string, like "123" into the
corresponding integer.  While `string->number` could help with
such a task, let us assume that it does not exist and we have
to write it on your own.
|#

#|
a. Write or sketch an algorithm, in English, that explains the steps
in converting such strings to integers.  (You can assume that the
strings consist only of digits.) *Spend no more than five minutes
on this part of the exercise.*

<INSERT YOUR ANSWER HERE>

|#

#|
b. One of the things we'll need to do is convert each character in
the string to its corresponding decimal number.  Write a procedure,
`(char->digit char)` that takes as input a digit character
(`#\0`, `#\1`, ...) and converts it to the corresponding digit
(0, 1, ...).

   > (char->digit #\3)
   3
   > (char->digit #\9)
   9
   > (char->digit "9")
   Boom.  Crash.
   > (char->digit #\x)
   ; whatever you want

Note that you may find the collating sequence values helpful.
|#

;; (char->digit char) -> integer?
;;   char : digit-character?
;; Convert a digit character to the corresponding digit/integer.
(define char->digit
  (lambda (char)
    ???))

#|
c. Write a procedure, `(string->digits str)` that takes a string
consisting of only digits as an integer and returns a list of the 
corresponding integers.  

    > (string->digits "123")
    '(1 2 3)
    > (string->digits "42")
    '(4 2)
    > (string->digits "0")
    '(0)

Note that you will likely need to use `map`, `string->list`, and one of 
the procedures you came up with above.
|#

;; (string->digits str) -> list-of integer?
;;   digits: string?
;; Convert a string of digits to a list of integers that represent 
;; the digits of the string.
(define string->digits
  (lambda (str)
    ???))

#|
d. One of the things we'll likely need to do is compute powers of
ten.  Write a procedure, `(ten-to-the n)`, that takes as input an
integer, `n`, and computes 10 to the nth power.

    > (ten-to-the 2)
    100
    > (ten-to-the 3)
    1000
    > (ten-to-the 0)
    1
    > (ten-to-the -1)
    1/10

Note that you will not be using any list operations in creating this
procedure; rather, this is an implicit part of the decomposed larger
problem.
|#

;; (ten-to-the n) -> integer?
;;   n : integer?
;; Compute 10^n.
(define ten-to-the
  (lambda (n)
    ???))

#|
d. Write a procedure, `(powers-of-ten n)`, that produces the first
`n` powers of ten, starting at ten to the 0 (1).  You will likely
need to use `map` and `range` to create this list.

    > (powers-of-ten 5)
    '(1 10 100 1000 10000)
|#

;; (powers-of-ten n) -> list-of integer?
;;   n : non-negative-integer?
;; Compute the first `n` powers of 10.
(define powers-of-ten
  (lambda (n)
    ???))

#|
f. Reconsider the problem of converting a string to an integer.
How will/might the procedures you've just written help you in that
activity?  How might `map` and `apply` help you with that that
activity?  How might the three-parameter `map` help?  (If you're
not sure about the three-parameter `map`, ask one of the course
staff.)

Sketch an algorithm, based on those tools, that might allow you to
do the conversion.  *Once again, spend no moreo than five minutes
on this part of the exercise.*

<INSERT YOUR ANSWER HERE>
|#

#|
g. Write a procedure, `(string->integer str)` that takes a string
consisting only of digits as an integer and returns the value of
that integer.  Do not use `number->integer`.

   > (string->integer "123")
   123
   > (string->integer "42")
   42
   > (string->integer "2342341211231667")
   2342341211231667
   > (string->integer "five")
   Boom.  Crash.
   > (string->integer "-5")
   Boom.  Crash.

Note that you will likely need all of the procedures you've just
written, along with the three-parameter `map` and an `apply`, to
complete this problem.

Think about how those procedures help, as well as what other decomposition
might be necessary.
|#

;; (string->integer str) -> integer?
;;   str: string?
;; Convert a string of digits to the corresponding integer
;; the digits of the string.
(define string->integer
  (lambda (str)
    ???))

#| B |#

; +--------------------------+---------------------------------------
; | Exercise 4: Check values |
; +--------------------------+

#|
In the early days of the Internet, data could become corrupted.  For
example, one letter in a communication might switch.  To help identify
such problems (and, eventually, to help resolve them), many programmers
started adding "check values" to their strings.  Here's a simple
strategy for computing a check value.

* Convert all the letters in the string to their corresponding ASCII or
  Unicode numbers.
* Add all those numbers together.
* Divide the sum by 26 and take the remainder.
* Convert back to a letter, using the conversion 0->A, 1->B, 2->C, ...

For example, given the string "Hello", I might do the following
calculations using DrRacket to help.

    > (char->integer #\H)
    72
    > (char->integer #\e)
    101
    > (char->integer #\l)
    108
    > (char->integer #\o)
    111
    > (+ 72 101 108 108 111)
    500
    > (remainder 500 26)
    6

So the check letter for "Hello" is #\G at least if we're right that
"G" is the 7th letter.  (Do you know why we said 7th rather than 6th?
The conversion does suggest that letter 6 is #\G)

Write a procedure, `(check-letter str)` that takes an arbitrary string
as input and computes its check letter (a character) using that approach.
|#

;;; (check-letter str) -> char?
;;;   str : string?
;;; Compute a check letter for str using the assigned process.
(define check-letter
  (lambda (str)
    ???))

#| AB |#

; +------------------+-----------------------------------------------
; | Submit your work |
; +------------------+

#|
Yay!  You're done with this lab.  Submit your work.  You should know
the drill by now.
|#

#| AB |#

; +---------------------------+--------------------------------------
; | For those with extra time |
; +---------------------------+

#|
If you finish the lab early, you should attempt one or more of these
problems.
|#

; +----------------------------------------+-------------------------
; | Exercise 1: Translating binary numbers |
; +----------------------------------------+

#|
Binary numbers are base-two numbers.  If you haven't encountered
them, binary numbers are a lot like base-ten (normal) numbers except
that instead of ten digits, we have only two (0 and 1).

In base-ten numbers, the rightmost digit gets multiplied by one
("ones column"), the next-to-rightmost gets multiplied by ten
("tens column"), the next-to-next-to-rightmost gets multiplied by
 100 ('hundreds column"), and so on and so forth.

In base-two numbers, the rightmost digit gets multiplied by one
("ones column", the next-to-rightmost digit gets multiplied by
two ("twos column"), the next-to-next-to-rightmost gets multiplied
by four ("fours column") and so on and so forth.

For example, 11001 in binary is 16 + 8 + 1 or 25 in base-ten
notation. 

Write a procedure, `(binary->integer str)` that takes as input a
string consisting of only 0's and 1's that represents a binary
number and converts it to the corresponding integer.

You may find it beneficial to write other helper procedures
along the way.  If you do so, you should consider documenting
those procedures similar to how we have done so.  (You don't
need to do so now, but it's a good habit to develop.)

Note: When/if you take CSC-161, you'll discover that there are a
variety of ways to interpret binary values as numbers.
|#

;; (binary->integer str)
;;   str : string?
;; Convert a string consisting of only 0's and 1's that represents
;; a binary number to the corresponding integer.
(define binary->integer
  (lambda (str)
    ???))

; +-----------------------------+------------------------------------
; | Extra 2: General conversion |
; +-----------------------------+

#|
You've now written two procedures that convert strings of digits to
integers, using different bases.  Document and write a generalized 
version, `(string->integer str base)`, that takes a base from 2 to
10 as a parameters.
|#

; +-------------------------------------------+----------------------
; | Extra 3: Expanding support for conversion |
; +-------------------------------------------+

#|
Add support for negative numbers, bases greater than ten, perhaps
even decimal numbers.
|#

