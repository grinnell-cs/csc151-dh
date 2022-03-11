#lang racket

(require csc151)
(require racket/match)
(require racket/undefined)
(require rackunit)

;; CSC 151 (SEMESTER)
;; Lab: Patterns of recursion (recursion-patterns.rkt)
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

#|
In this lab, we'll explore common "patterns" of writing recursive
functions and apply those patterns to new problems.
|#

; +---------------------+--------------------------------------------
; | Provided Procedures |
; +---------------------+

;;; (list-length lst) -> integer?
;;;   lst : list?
;;; Determine the number of values in the list
(define list-length
  (lambda (lst)
    (if (null? lst)
        0
        (+ 1 (list-length (cdr lst))))))

;;; (list-sum lst) -> number?
;;;   lst : listof number?
;;; Add up all the numbers in the list
(define list-sum
  (lambda (lst)
    (if (null? lst)
        0
        (+ (car lst) (list-sum (cdr lst))))))

;;; (list-product lst) -> number?
;;;   lst : listof number?
;;; Multiply all the numbers in the list.
(define list-product
  (lambda (lst)
    (if (null? lst)
        1
        (* (car lst) (list-product (cdr lst))))))

#| B |#

; +-------------------------+----------------------------------------
; | Exercise 1: Preparation |
; +-------------------------+

#|
a. Gather the code for at least six recursive functions over lists
you've written or read.  (If you can gather more, that's even better.)
Do not include `list-sum`, `list-length`, or `list-product`, which we've 
provided above.
|#

; <TODO: Paste the code here>

#|
b. Make a list of the broad input and output types of each procedure.
For example, some procedures take a list of a particular length and
return a list of the same length; some return a shorter list; and some
return a different kind of value.  For the provided procedures, each of
`list-sum` and `list-product` takes a list of numbers and produces a
number based on those numbers, while `list-length` takes a list of any
type as input and produces an integer that does not depend on the content.

<TODO: Add your notes here>
|#

#|
c. Do your best to identify common patterns of code in similar
procedures.  That is, look at what is similar and what is different.
For example, both `list-length` and `list-sum` begin with a `(null?
lst)` base-case test, return 0 in the base case, and add something
to the recursive call.  They differ only in the procedure name and
the value that they add.  We'd say that they have the following
pattern.  (Words in all caps are the ways in which the two procedures
differ.)

    (define PROC
      (lambda (lst)
        (if (null? lst)
            0
            (+ VALUE (PROC (cdr lst))))))

In contrast, although both `list-sum` and `list-product` share the base
case test, they have different base cases.  However, they both employ
`(car lst)` in the recursive computation.

    (define PROC
      (lambda (lst)
        (if (null? lst)
            IDENTITY-VALUE
            (OP (car lst) (PROC (cdr lst))))))

<TODO: Add your patterns here, along with any notes you consider appropriate.>
|#

#|
d. Gather the code for at least four recursive functions over integers
you've written or read.  (If you can gather more, that's even better.)
|#

; <TODO: Paste the code here>

#|
e. Make a list of the broad input and output types of each procedure.

<TODO: Add your notes here>
|#

#|
f. Do your best to identify common patterns of code in similar procedures.

<TODO: Add your patterns here, along with any notes you consider appropriate.>
|#

#| A |#

; +-----------------------+------------------------------------------
; | Exercise 2: Reduction |
; +-----------------------+

#|
a. We expect that you've identified a common pattern for the problem
of "reduce a list of values to a single value", perhaps a pattern
that includes a default value if the list is empty.  If not, either
design that pattern or ask one of the class staff for help.

<TODO: Paste that pattern here.>
|#

#|
b. Using that pattern, write a recursive procedure, `(join-strings
strings)`, that takes a list of strings as a parameter and returns
the result of joining those strings together.  (You may use
`string-append` but not `reduce`.) 

Make sure to consider your base-case test, your base case, and what
to do after the recursive call.
|#

(define join-strings
  (lambda (strings)
    undefined))

#|
(test-equal? "join-strings: empty list" (join-strings '()) "")
(test-equal? "join-strings: empty list" (join-strings '()) "")
(test-equal? "join-strings: singleton list" (join-strings '("a")) "a")
(test-equal? "join-strings: multi-word list" 
             (join-strings '("a" "b" "c" "d")) 
             "abcd")
(test-equal? "join-strings: multi-word list, some empty strings"
             (join-strings '("a" "b" "" "c" "" "d" ""))
             "abcd")
|#

#|
c. Using that pattern, write a procedure, `(join-lists list-of-lists)`,
that takes a list of lists as a parameter and joins them all together
into a single list.  (You may use `append` but not `reduce`.)

Make sure to consider your base-case test, your base case, and what
to do after the recursive call.
|#

(define join-lists
  (lambda (list-of-lists)
    undefined)) ; TODO: Finish me.

#|
(test-equal? "join-lists: empty list" (join-lists '()) '())
(test-equal? "join-lists: list of empty list" (join-lists '(())) '())
(test-equal? "join-lists: singleton list" (join-lists '((a))) '(a))
(test-equal? "join-lists: list of singleton lists"
             (join-lists '((a) (b) (c) (d)))
             '(a b c d))
(test-equal? "join-lists: list of varying-length lists"
             (join-lists '((a b) (c d e) (f) (g h) (i j k l)))
             '(a b c d e f g h i j k l))
(test-equal? "join-lists: list of varying-length lists, some empty"
             (join-lists '(() (a b) (c d e) (f) () (g h) () () (i j k l) ()))
             '(a b c d e f g h i j k l))
(test-equal? "join-lists: list of varying-length lists, some with sublists"
             (join-lists '(() (a b) (c (d e)) () ((f) (g))))
             '(a b c (d e) (f) (g)))
|#

; +---------------------+--------------------------------------------
; | Exercise 3: Extrema |
; +---------------------+

#|
a. We expect that you've identified a common pattern for the problem
of "find the most extreme value in a list", such as the largest real
number in a list of real numbers or the longest string in a list of
strings.  Remind yourself of that pattern or write it.  Then include
it here.

<TODO: Paste that pattern here.>
|#

#|
b. Using that pattern, write a procedure that finds the alphabetically
last string in a non-empty list of strings.

Make sure to consider your base-case test, your base case, and what
to do after the recursive call.
|#

(define alphabetically-last
  (lambda (strings)
    undefined))

#|
(test-equal? "alphabetically-last: singleton list" 
             (alphabetically-last '("a")) 
             "a")
(test-equal? "alphabetically-last: first in a mixed list"
             (alphabetically-last '("z" "h" "a" "b" "p" "q"))
             "z")
(test-equal? "alphabetically-last: last in a mixed list"
             (alphabetically-last '("h" "a" "b" "p" "q" "z"))
             "z")
(test-equal? "alphabetically-last: inside a mixed list (1)"
             (alphabetically-last '("h" "y" "a" "b" "p" "q"))
             "y")
(test-equal? "alphabetically-last: inside a mixed list (2)"
             (alphabetically-last '("h" "a" "x" "b" "p" "q" "d"))
             "x")
(test-equal? "alphabetically-last: inside a mixed list (3)"
             (alphabetically-last '("h" "a" "b" "w" "p" "q" "d"))
             "w")
(test-equal? "alphabetically-last: inside a mixed list (4)"
             (alphabetically-last '("h" "a" "b" "a" "v" "p" "q" "d"))
             "v")
|#

#|
c. Write tests for a procedure that finds the integer closes to zero
in a list of integers.  Make sure to consider negative numbers!
|#

(define closest-to-zero
  (lambda (ints)
    undefined))

#|
(test-equal? "closest-to-zero: your first test" 
             (closest-to-zero '(42)) 
             42)
|#

#|
d. Using the pattern from part a, write closest-to-zero.

Make sure to consider your base-case test, your base case, and what
to do after the recursive call.
|#

#| B |#

; +----------------------------------+-------------------------------
; | Exercise 4: Reduction, Revisited |
; +----------------------------------+

#|
a. In an exercise above, you identified a pattern for the problem of
reducing a list to a single value, provided  you have a default
value for empty lists.  However, as you may recall, the `reduce`
procedure we provide has a slightly different semantics.  That procedure
stops when there is one element left in the list and, in that case,
returns the one value in the list.

Find or write a pattern for this variant of reduction.
|#

#|
b. Using that pattern, write a recursive procedure, `(join-with-commas
strings)`, that takes a list of strings as a parameter and returns
the result of joining those strings together with commas and spaces
beween them.  Note that this procedure requires the new pattern,
since you don't want a space for the singleton string. 

Make sure to consider your base-case test, your base case, and what
to do after the recursive call.
|#

(define join-with-commas
  (lambda (strings)
    undefined)) ; TODO: Finish me

#|
(test-equal? "join-with-commas: singleton list" 
             (join-with-commas '("a")) 
             "a")
(test-equal? "join-with-commas: two-element list" 
             (join-with-commas '("a" "b")) 
             "a, b")
(test-equal? "join-with-commas: three-element list" 
             (join-with-commas '("a" "b" "c"))
             "a, b, c")
(test-equal? "join-with-commas: six-word list" 
             (join-with-commas '("a" "b" "c" "d" "e" "f"))
             "a, b, c, d, e, f")
(test-equal? "multi-word list, some empty"
             (join-with-commas '("a" "b" "" "c" "" "d" ""))
             "a, b, , c, , d, ") ; I hope I got this right.
|#

#| AB |#

; +---------------------------+--------------------------------------
; | For those with extra time |
; +---------------------------+

#|
If you find yourself with extra time, consider doing one or more of
the following exercises.  Make sure to read through all of them to
decide which seem like the most fun or the most useful.
|#

; +-------------------------------+----------------------------------
; | Extra 1: Sequences of Numbers |
; +-------------------------------+

#|
a. Consider the procedures `sequence-one` and `sequence-two`, given
below.  What does each do?

sequence-one: <TODO: Explain>
sequence-two: <TODO: Explain>
|#

(define sequence-one
  (lambda (n)
    (sequence-one-helper 1 n)))

(define sequence-one-helper
  (lambda (i n)
    (if (= i n)
        null
        (cons i (sequence-one-helper (+ i 1) n)))))

(define sequence-two
  (lambda (n)
    (sequence-two-helper 0 n)))

(define sequence-two-helper
  (lambda (i n)
    (if (= i n)
        null
        (cons (expt 10 i) (sequence-two-helper (+ i 1) n)))))

#|
b. As you've noted, both procedures produce sequences of numbers
build from a counter that goes up to, but does not include n.
Amazingly, that's a common problem.  Design a pattern for producing
such sequences.

<TODO: Insert your pattern here.>
|#

#|
c. Use your pattern to write a procedure that produces the list
'("a" "aa" "aaa"
|#

#|
d. Use your pattern to write a procedure that produces the list
'(#\a #\b #\c ...).  In this case,  you can assume that `n` is
not greater than 26.
|#

; +--------------------+---------------------------------------------
; | Extra 2: Filtering |
; +--------------------+

#|
We've found patterns for one of the big-three list procedures.  Let's
look at another.  
|#

#|
a. Write a recursive procedure, `(select-as words)`, that takes a list 
of strings as an input and selects only the words that begin with the
letter #\a.

Make sure to consider.

* Your best-case test (e.g., is it the empty list or the singleton list)?
* Your base-case value.
* What the recursive case will look like if the first element in the 
  list begins with #\a.
* What the recursive case will look like if the first element in the
  list does not begin with #\a.
|#

(define select-as
  (lambda (words)
    undefined))

#|
b. Write a recursive procedure, `(select-odds numbers)`, that takes
a list of numbers as input and selects only those that are odd integers.

Make sure to consider.

* Your best-case test (e.g., is it the empty list or the singleton list)?
* Your base-case value.
* What the recursive case will look like if the first element in the 
  list is not an integer.
* What the recursive case will look like if the first element in the
  list is an integer, but not odd.
* What the recursive case will look like if the first element in the
  list is both odd and an integer.
|#

(define select-odds
  (lambda (numbers)
    undefined))

#|
c. Using these two procedures as examples, define a pattern for "select
elements of a list that meet some criteria".
|#

; +----------------------------+-------------------------------------
; | Extra 3: Skipping Elements |
; +----------------------------+

#|
As you may have noted in the `join-with-commas` example, empty strings
lead to some strange output.  

    > (join-with-commas '("a" "b" "" "c" "" "d" ""))
    "a, b, , c, , d, " ; I hope I got this right.

In this case, we really want to do a combination of reducing and
filtering.  That is, we want to throw away the empty strings and
then join.  But we'd rather not process the list twice.

Write a procedure, `better-join-with-commas`, that does just that.

    > (better-join-with-commas '(""))
    ""
    > (better-join-with-commas '("a"))
    ""
    > (better-join-with-commas '("a" "b"))
    "a, b"
    > (better-join-with-commas '("a" ""))
    "a"
    > (better-join-with-commas '("" "b"))
    "b"
    > (better-join-with-commas '("" ""))
    ""
    > (better-join-with-commas '("a" "b" "c"))
    "a, b, c"
    > (better-join-with-commas '("" "b" "c"))
    "b, c"
    > (better-join-with-commas '("a" "" "c"))
    "a, c"
    > (better-join-with-commas '("a" "b" ""))
    "a, b"
    > (better-join-with-commas '("" "" "c"))
    "c"
    > (better-join-with-commas '("" "b" ""))
    "b"
    > (better-join-with-commas '("a" "" ""))
    "a"
|#

(define better-join-with-commas
  (lambda (word)
    undefined))
