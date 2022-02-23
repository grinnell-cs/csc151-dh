#lang racket

(require csc151)
(require rackunit)

;; CSC 151 (SEMESTER)
;; Lab: Recursion basics
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

#|
In this lab, we'll gain some intuition about the *mechanics* of
recursion by practicing reading and interpreting recursive code using
our mental model of computation.
|#

#| AB |#

; +------------------------------+-----------------------------------
; | Exercise 1: Into the unknown |
; +------------------------------+

#|
In this exercise, each partner will receive a function to analyze.
If you are working together in person, each will go through and
speak aloud about what they are doing.  If you are working online,
please work with your function on your own and then get together
to discuss the functions and what you discovered about them.

a. Note the pre-conditions on the function you were assigned (in
   this case, those are the types of the parameters. With those in
   mind, first explore executions of your function by trying out
   2--3 examples of your function in the interpreter.

b. Next, confirm your intuition by using your mental model of
   computation to give a step-by-step trace/evaluation of the 
   an expression supplied to you.

c. Finally, develop an explanation of what your chosen function does.
   Note that your functions (and many recursive functions over lists)
   have a specific form:

    (if (null? l)
        ; case where l is null
        ; case where l is non-null
        )

   In other words, the behavior of the function can be broken up into
   two independent sub-problems:

   + How do I solve the problem when the list is empty (`null`)?
     We call this the *base case* of the function.
   + How do I solve the problem when the list is non-`null`?
     We call this the *recursive case* of the function.

   Explain your function's behavior below by writing what your
   function does in the base and recursive cases.
|#

#| A |#

; +-------------------------------+----------------------------------
; | Exercise 1a: Into the unknown |
; +-------------------------------+

#|
Consider the following two recursive function definition below.
|#

;;; (func-1 x l) -> ??
;;;   x : any/c
;;;   l : list?
;;; ??
(define func-1
  (lambda (x l)
    (if (null? l)
        (list x)
        (cons (car l) (func-1 x (cdr l))))))

#|
Analyze your function by doing the following:
|#

#|
a. Examples

<TODO: Try the procedure on multiple inputs and enter your examples from 
the interactions pane here.>
|#

#|
b. Trace

    ; for func-1
    (func-1 9 '(1 8 2))
--> 
<TODO: Finish the derivation>
|#

#|
c. Explanation

Base case: <TODO: write your explanation here>

Recursive case: <TODO: write your explanation here>
|#


#| B |#

; +-------------------------------+----------------------------------
; | Exercise 1b: Into the unknown |
; +-------------------------------+

#|
Consider the following recursive function definition below.
|#

;;; (func-2 l1 l2) -> ??
;;;   l1 : list?
;;;   l2 : list?
;;; ??
(define func-2
  (lambda (l1 l2)
    (if (null? l1)
        l2
        (cons (car l1) (func-2 (cdr l1) l2)))))

#|
a. Examples

<TODO: Try some examples. Enter your examples from the interactions pane here.>
|#

#|
b. Trace

    ; for func-2
    (func-2 '(8 4 2) '(1 8 9 6 3))
---> 

<TODO: finish the trace here>
|#

#|
c. Explanation

Base case: <TODO: write your explanation here>

Recursive case: <TODO: write your explanation here>
|#

#| AB |#

#| This part is for online partners only. |#

#|
d. Once you and your partner are done with their analysis, take turns
   presenting your work and explanations to each other. Make sure to
   present your examples, step-by-step derivation, and explanation.
   Ask questions of the presenter if you are unsure about how the
   function behaves or why it behaves in the way described.
|#

; +---------------------------+--------------------------------------
; | Exercise 2: Deeper waters |
; +---------------------------+

#|
In this exercise, we'll perform the same activity as the previous 
exercise, but with a more complicated set of recursive functions.

Plan to perform the same steps as the previous problem to analyze your
function's behavior.  Record them as separate sections, as in the
a, b, and c from the prior problem.
|#

#| A |#

; +----------------------------+-------------------------------------
; | Exercise 2a: Deeper Waters |
; +----------------------------+

;;; (func-3 x l) -> ??
;;;   x : any/c
;;;   l : list?
;;; ??
(define func-3
  (lambda (x l)
    (if (null? l)
        null
        (if (equal? (car l) x)
            (func-3 x (cdr l))
            (cons (car l) (func-3 x (cdr l)))))))

#|
a. Examples

|#

#|
b. Trace

When working through the step-by-step evaluation of your function,
use the following expression:

    (func-3 7 '(1 7 2 7))
--> 
|#

#|
c. Explanation

|#

#| B |#

; +----------------------------+-------------------------------------
; | Exercise 2b: Deeper waters |
; +----------------------------+


;;; (func-4 l1 l2) ->??
;;;   l1 : list?
;;;   l2 : list?
;;; ??
(define func-4
  (lambda (l1 l2)
    (if (null? l2)
        l1
        (func-4 (cons (car l2) l1) (cdr l2)))))

#|
a. Examples

|#

#|
b. Trace

When working through the step-by-step evaluation of your function,
use the following expressions:

; for func-4
(func-4 '() '(8 3 9 1))
|#

#|
c. Explanation

|#

#| AB |#

#|
If you are working online, take turns presenting your derivation and
explanation of your function's behavior to your partner. Ask questions
of the presenter if you are unsure  about how the function behaves or
why it behaves in the way described.
|#

#| A |#

; +----------------------------------------+-------------------------
; | Exercise 3: Debugging, recursive style |
; +----------------------------------------+

;;; You'll drive in this exercise. The next exercise is similar, but
;;; with your partner driving instead.

#|
Consider the following attempt at a recursive definition of a function
that computes the length of a list.
|#

(define my-length
  (lambda (l)
      (if (null? l)
          1
          (my-length (cdr l)))))

#|
a. Build a small test suite for this function using `rackunit` in the
   space below. What tests do you need to ensure that you "cover all
   the cases" of this program's execution?
|#

;;; <TODO: write your rackunit test suite for my-length here>

#|
b. In your testing, you should have noted that the function doesn't
   behave as expected! Using the debugging techniques we've developed
   as well as your mental model of computation, determine the cause
   of the problem and fix it in your code. Ensure that your modified
   function passes all of your tests. Describe the problem and your
   fix in the space below:

;;; <TODO: write your explanation of the code's problem and your fix>

|#

#| B |#

; +----------------------------------------+-------------------------
; | Exercise 4: Debugging, recursive style |
; +----------------------------------------+

#|
You'll drive in this exercise. The prior exercise was similar, but
with your partner driving instead.

Consider the following attempt at a recursive definition of a function
that computes the product of the elements of a list.  (The product is
the result of multiplying them together.)
|#

(define my-product
  (lambda (l)
    (if (null? l)
        0
        (my-product (cdr l)))))

#|
a. Build a small test suite for this function using `rackunit` in the
   space below. What tests do you need to ensure that you "cover all
   the cases" of this program's execution?
|#

;;; <TODO: write your rackunit test suite for my-sum here>

#|
b. In your testing, you should have noted that the function doesn't
   behave as expected! Using the debugging techniques we've developed
   as well as your mental model of computation, determine the cause
   of the problem and fix it in your code. Ensure that your modified
   function passes all of your tests. Describe the problem and your
   fix in the space below:

;;; <TODO: write your explanation of the code's problem and your fix>

|#

#| AB |#

; +----------------------------------------+-------------------------
; | Exercise 5: Go tell it on the mountain |
; +----------------------------------------+

#|
As described in the reading, recursion looks like it shouldn't work
because the definition of a recursive function is circular. Based on
your experiences so far, why does recursion seems to work despite this
initial perception of circularity? In particular, try to identify what
is *necessary* for the program to do to ensure the "circular"
definition doesn't lead to the problems you explored in the second
self-check.

Discuss this prompt with your partner and write up your response in a
few sentences in the space below:

<TODO: write your explanation here>

|#

#| AB |#

; +------------------+-----------------------------------------------
; | Submit your work |
; +------------------+

#|
Yes, that's right.  Although you haven't written much code, you've done
enough to learn a bit about recursion.  It's time to submit.
|#

#| AB |#

; +---------------------------+--------------------------------------
; | For those with extra time |
; +---------------------------+

#|
If you find that you have extra time, you might attempt one or more
of the following procedures.
|#

; +--------------------------------+---------------------------------
; | Extra 1: Recursive reflections |
; +--------------------------------+

#|
a. Make a list of all the list procedures you've encountered.

b. Pick one of them.  Consider whether it can be done using the
normal model and, if so, what you do in the empty list case and
what you do after the recursive call.  (Don't actually implement
it; just think about the parts.)  For example:

Procedure: (append l1 l2)
Base case (l1 is empty); return l2
After recursive call: Cons the car of l1 onto the recursive result

Procedure: (length lst)
Base case (lst is empty): return 0
After recursive call: Add 1 to the recursive result

Procedure: 
Base case (___ is empty): return ___
After recursive call: ___ to the recursive result

c. Repeat step b as many as times as you wish.
|#

; +--------------------------+---------------------------------------
; | Extra 2: Singleton lists |
; +--------------------------+

#|
As you've seen, `(null? lst)` checks if a list has zero elements.

Suppose we want to write a procedure, `(singleton? lst)`, that checks 
whether a list has exactly one element.

Many students are tempted to write the following.

(define singleton?
  (lambda (lst)
    (= 1 (length lst))))

We very much prefer this alternate definition.

(define singleton?
  (lambda (lst)
    (and (not (null? lst))
         (null? (cdr lst)))))

a. Explain how the second `singleton?` procedure works.

<ENTER YOUR ANSWER HERE>

b. The first version of `singleton?` is definitely easier to read.
Explain why we might still prefer the second one?  (Consider the
definition of length from before as you answer this question.)

<ENTER YOUR ANSWER HERE>

c. Write a non-recursive procedure, `(simple-length lst)` that returns 

* "empty", if the list has no elements;
* "one", if the list has one element; 
* "two", if the list has two elements; and
* "many", if the list has more than two elements.

You may not use `length` or `recursion` in solving this problem.
|#

(define simple-length
  (lambda (lst)
    ???))