---
title: "EBoard 39 (Section 3): Presentations + Sorting algorithms"
number: 39
section: eboards
held: 2022-05-11
link: true
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [~10 min]
* Project presentations [~40 min]
* Questions [~10 min]
* Notes from Friday's lab [20 min]
* Sorting out sorting [whatever is left]

Administrivia
-------------

### Introductory notes

* Happy Summer Weather!
* Grade reports released last night.
* We have a variety of things to do on Friday.  I hope everyone who can make
  it to class will make it.
    * Notify me if you cannot make it.
* Goodbye to those of you who will not be here on Friday.  We will miss you.
    * Get notes from your classmates. 
    * Identify someone to pick up Friday handouts for you.  (Yes, we wil
      have Friday handouts.)
    * Fill out the EOCE after class on Friday.
    * See Micah at Monday's mentor session.
* Did someone leave an adapter at the podium?

### Reminders

* We will continue to wear masks until the end of the semester.  
* Please say your name when you ask or answer a question (even if I've
  just called you by name).  Say your partner's name, too!
* Evening tutors are available 7--10 p.m. Sunday through Thursday as
  well as 3--5 p.m. on Sunday.
* Our final mentor session is Monday at 8pm.

### Upcoming work

* Thursday, May 12, 10:30 p.m.: SoLA 4
    * Released 2:30 p.m. TODAY
    * SoLA 5 is optional

### Upcoming Token-Generating Activities

* Mentor session Monday of Finals Week (8pm)
* Thursday, 7:30, Latin American Music Ensemble in Sebring-Lewis

### Other Upcoming Activities

Presentations
-------------

* Bad Libs
* Textual Analysis
* Steamy
* Translator

Questions
---------

I've overspent my tokens.  What happens?

> Traditionally, you lose a reading, lab, or LA for each two tokens you've
  overspent.  (I try to pick the one that is least harmful.)

> We'll discuss it on Friday.

It appears that I'm missing a bunch of reading responses.  What do I do?

> Turn them in by emailing them to me (at a cost of two tokens each).

I emailed you a bunch of late reading responses / labs and they are still
not posted.  What should I do?

> Remind me.

Can I take an incomplete in your class?

> You may not make up readings, labs, or LAs on an incomplete.

> You may complete one or two MPs for which you have not turned in
  second redos.

I have too much work due tomorrow.  Can I have an extension on SoLA 4?

> Yes, if you talk to me in advance.

Are tokens updated?

> Nope.  Maybe tonight.

Can we have food on Friday?

> Only if you promise that it won't affect what you enter on the EOCEs.

Lab notes
---------

### Binary Search

Binary search is not constant time, but it's also much faster than a
linear search.

Suppose we had 1000 elements to look at

* 1000 -> 500 -> 250 -> 125 -> 62 -> 31 -> 15 -> 7 -> 3 -> 1 -> 0
* Ten calls for a failed search

Suppose we had 1,000,000 elements to look at

* 1,000,000 -> 500,000 -> 250,000 -> 125,000 -> 62,500 ->
  31,250 -> 16,000 -> 8,000 -> 4,000 -> 2,000 -> 1,000 -> ten more steps
* Twenty calls for a failed search

Binary search is fast, but requires a sorted vector.

### Alphabetically first

```
;;; (alphabetically-first string) -> string
;;;   strings: both (listof string?) nonempty?
;;; Find the alphabetically first string in the list.
(define alphabetically-first-1
  (lambda (strings)
    (cond
      [(null? (cdr strings))
       (car strings)]
      [(string-ci<=? (car strings) (alphabetically-first-1 (cdr strings)))
       (car strings)]
      [else
       (alphabetically-first-1 (cdr strings))])))

(define alphabetically-first-2
  (lambda (strings)
    ; (counter-increment! AFC 'alphabetically-first-2)
    (if (null? (cdr strings))
        (car strings)
        (first-of-two (car strings)
                      (alphabetically-first-2 (cdr strings))))))

;;; (first-of-two str1 str2) -> string?
;;;   str1 : string?
;;;   str2 : string?
;;; Find the alphabetically first of str1 and str2.
(define first-of-two
  (lambda (str1 str2)
    (if (string-ci<=? str1 str2)
        str1
        str2)))
```

_TPS_

One of these is much worse (on some inputs).  Which one?

* The first one

What inputs are bad?

* The longer the list, the worse the first one is.
* Ones in which the alphabetically first thing is at the end of the list.

Why does that cause bad behavior?

* We have two identical recursive calls
* Those cascade 2 x 2 x 2 x 2 x 2 x ...

Helpful learning outcome

* DON'T INCLUDE IDENTICAL RECURSIVE CALLS IN YOUR PROCEDURE!  It will
  generally make things slow.

### Reversing

```
;;; (list-append l1 l2) -> list?
;;;   l1, l2 : list?
;;; Returns the list formed by placing the elements of l2 after the elements
;;; of l1, preserving the order of the elements of l1 and l2.
(define list-append
  (lambda (l1 l2)
    (cond
      [(null? l1)
       l2]
      [else
       (cons (car l1)
             (list-append (cdr l1) l2))])))

;;; (list-reverse l) -> list?
;;;   l : list?
;;; Returns l with the elements in the opposite order.
(define list-reverse-1
  (lambda (l)
    (match l
      ['()
       null]
      [(cons x tail)
       (list-append (list-reverse-1 tail) (list x))])))

#|
(list-reverse-1 '(1 2 3))
-> (list-append (list-reverse-1 '(2 3)) '(1))
-> (list-append (list-append (list-reverse-1 '(3)) '(2)) '(1))
-> (list-append (list-append (list-append (list-reverse-1 '()) '(3)) '(2)) '(1))
-> (list-append (list-append (list-append '() '(3)) '(2)) '(1))
-> (list-append (list-append '(3) '(2)) '(1))
-> (list-append '(3 2) '(1))
-> '(3 2 1)
; We did not show the steps for list-append
|#

(define list-reverse-2
  (lambda (l)
    (letrec ([helper
              (lambda (l so-far)
                (match l
                  ['() 
                   so-far]
                  [(cons x tail)
                   (helper tail (cons x so-far))]))])
      (helper l null))))
```

`list-reverse-2 is much faster than list-reverse-1`.  It is not just an
issue of tail recursion.  Why is `list-reverse-1` slow?  How many calls
to `list-append` did we make in the example above?  (including the hidden
recursive ones)

How many calls to `list-append` will there be in
`(list-append '(9 8 7 6 5 4 3 2) '(1))`?

> about nine calls (because we recurse through the cdr)

How many calls to `list-append` will there be in
`(list-append '(9 8 7 6 5 4 3) '(2))`?

> about eight calls

How many calls to `list-append` will there be in
`(list-append '(9 8 7 6 5 4) '(3))`?

> about seven

If we used this method to reverse the list '(1 2 3 4 5 6 7 8 9), how
many total calls would we have to `list-append`?

> 9 + 8 + 7 + ... + 1 = 45

If we did a list of length 10?

> 10 + 9 + 8 + .... + 1 = 55

Generalizing

> N + (N-1) + (N-2) + ... + 1 = N(N+1)/2

One hundred elements

> 5050 steps.

Moral?

* Make sure you understand the costs of your helper procedures.  If
  you can avoid linear helper procedures in a recursive function, do
  so.

Background: What is CS?
-----------------------

* Solving problems using computers, including societal problems.
* The study of algorithms and data structures
    * Algorithms are sets of instructions (intended to solve problems)
    * Data structures speak to the organization of data (e.g., list
      vs. vector)

Computer scientists study algorithms by ...

* Writing them!  (More precisely, identifying problems, generalizing
  them, and finding algorithms that might solve them.)
* Analyze them to understand their running time or other resource
  usage, often without running them (e.g., memory).
* Prove them correct (or incorrect) mathematically.
* Applying them to sets of data.
* Validating them using the scientific method (running experiments on them)
* Understand them by running them by hand (tracing)
* Implement them in a computer language.
* Consider the ethical and social implications of the algorithms.
* And more ... e.g., build languages or hardware systems to provide
  a platform for implementing algorithms.

Background: Analyzing algorithms
--------------------------------

Computer scientists analyze algorithms in many different ways.

* Readability.
* Generality.
* Correctness (essential), mathematically or expermentally
* Most frequently, resource usage.
    * How long does it take to run an algorithm on input of certain size?
    * "Long" can be wall-clock time or it can be "number of steps".

Analyzing time

* We don't necessarily see a clear function.
* However, we can often see a clear function if we look at the upper
  bound values.
* We try to look for patterns of the bounding function.
* Common patterns we see
    * Constant, such as `car`, `cdr`, `vector-ref`
    * Logarithmic functions go up by one each time we double the size
      of the input.  Find in a binary search tree, binary search in
      a vector.
    * Linear: As the input size doubles, the number of steps approximately
      doubles.  `map`, since it has to work with every element of the list.
      `list-ref`, since it has to step through the list until it hits
      the nth element.
    * nlogn: Between linear and quadratic, much closer to linear
    * Quadratic: When you double the input size, you approximately
      quadruple the number of steps.
    * Exponential algorithms (e.g., 2^n): When you add one to the input
      size, you double the work.  There are problems for which no known
      non-exponential algorithm exists; whether such algorithms can
      exist remains an open question.  E.g., traveling salescritter
      is an n! algorithms

The problem of sorting 
-----------------------

Given a collection of things, put them in order.

Easy solution: `(sort things less-equal?)`

But we should be able to write our own sort function.

What should we sort?

* It could be a vector, in which case we rearrange it in place.
* It could be a list.
* (Also hash, struct, file, tree)

Algorithm design time
---------------------

In a group of three or four (or maybe five), design at least two
sorting algorithms, one for vectors and one for lists.

Algorithm 1
-----------

* Compare the first two elements: Cons the lesser element to a new
  list and then recurse on the remaining elements.
* When you have one element, you are done.
* Whoops.  That's not sorted.  Try again
* And then again
* If there are N elements in the list, we have to go through all N elements
  each time and, potentially, run the core algorithm N times.  This will
  take about N*N steps.

Algorithm 2
-----------

* Find the smallest remaining element in the vector
* Swap it to the front of the sorted section
* Repeat
* For ten things: 10 + 9 + 8 + 7 + 6 + 5 + 4 + 3 + 2 + 1 = 55
* For N things: N(N+1)/2
