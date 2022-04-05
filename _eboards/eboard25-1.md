---
title: "EBoard 25 (Section 1): Abstract Data Types"
number: 25
section: eboards
held: 2022-04-06
link: true
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [~5 min]
* Racket stuff [~5 min]
* Questions [~5 min]
* Lab [~60 min]

Administrivia
-------------

### Introductory notes

### Class mask policy

* We will continue to wear masks until at least the next course survey.

### Reminders

* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* Evening tutors are available 7--10 p.m. Sunday through Thursday as
  well as 3--5 p.m. on Sunday.
* Mentor sessions are Monday 8--9 p.m.  Wednesday, 8--9 p.m., Sunday 4--5 p.m.

### Upcoming work

* Friday's reading due Thursday at 10:00 p.m.
* Today's lab due Thursday at 10:30 p.m. 
* Quiz 9 distributed Friday at 8am: Vectors.
* MP 5 due Thursday at 10:30 p.m.  
    * Autograder and submission form should be live tonight.
* SoLA 3 next week.

### Sample Quiz

_Design and write functions (potentially recursive functions) that utilize vectors._

Write a procedure, `(vector-swap-neighbors! vec)` that takes an even-length vector as a parameter and swaps the neighboring elements (those at indices 0 and 1, those at indices 2 and 3, etc.).

```
> (define vec (vector 'a 'b 'c 'd 'e 'f))
> (vector-swap-neighbors! (vector 'a 'b 'c 'd 'e 'f))
> vec
'#(b a d c f e)
```

_Hint: You will find a let binding helpful._

### Other Sample Quiz Questions

Check out [Sample SoLA 3](../las/sample-sola-3).

### Upcoming Token-Generating Activities

* Thursday 11am, Convocation
* Thursday 1pm, Baseball vs. Cornell College
* Thursday 3:30pm, Baseball vs. Cornell College
* Saturday 1pm, Softball vs. University of Wisconsin Stevens Point
* Saturday 3pm, Softball vs. University of Wisconsin Stevens Point

### Other Upcoming Activities

Racket/Lab Stuff
----------------

### `add-word!`

How most of you defined `(add-word! counts word)`

```
(define add-word!
  (lambda (counts word)
    (if (hash-has-key? counts word)
        (hash-set! counts word (+ 1 (hash-ref counts word)))
        (hash-set! counts word 1))))
```

Another approach

```
(define add-word!
  (lambda (counts word)
    (hash-set! counts word (if (hash-has-key? counts word)
                               (+ 1 (hash-ref counts word))
                               1))))
```

Another approach.

There is a three-parameter version of `hash-ref`.
`(hash-ref hash key default)`, returns the third parameter if the 
key is not in the table.  We could use that.

```
(define add-word!
  (lambda (counts word)
    (hash-set! counts word (+ 1 (hash-ref counts word 0)))))
```

I might even take it a step further and write a separate
`word-count` procedure.

```
;;; (word-count counts word) -> integer?
;;;   counts : hash? (string -> integer)
;;;   word : string?
;;; Determine how many times word has been added to counts.
(define word-count
  (lambda (counts word)
    (hash-ref counts word 0)))

(define add-word!
  (lambda (counts word)
    (hash-set! counts word (+ 1 (word-count counts word)))))
```

I suppose `count-word!` would have been better than `add-word!`.

### "Functional nature"

A quote from the official Racket documentation.

> A hash table is also either mutable or immutable. Immutable hash tables support effectively constant-time access and update, just like mutable hash tables; the constant on immutable operations is usually larger, but **the functional nature of immutable hash tables can pay off in certain algorithms**. <https://docs.racket-lang.org/reference/hashtables.html> (emphasis mine)

Note that "functional nature" refers to our pre-vectors experience with values and procedures: Procedures do not change their parameters; procedures return new values.

### Mutable and immutable hash tables

In case you didn't discover this, `hash-set` and `hash-remove` will not
work with mutable hash tables, only immutable hash tables.

Questions
---------

### Racket questions

How are hash tables implemented?

> That's beyond the scope of this course.  You'll learn about them in 
  CSC-207.  You could also check out 
  [Micah's 'blog post](https://www.micahcantor.com/blog/mutable-hash-racket/).

### Reading questions

### Other issues

When is our final?

> Our final is optional; it is a chance to complete any learning assessments
  you have not completed.

> It will be much like every other SoLA.  Short problems, 60-minute time
  limits.

> I plan to release it at 8:00 a.m. on Tuesday of finals' week and have
  it due at 5:00 p.m. on Friday of finals' week.

Lab
---

### Preparation

* Have the normal start-of-lab discussion.
* Read over the code!
* Save the file as `data-abstraction.rkt`

### During Lab

### Wrapup


