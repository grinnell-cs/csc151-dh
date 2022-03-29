---
title: "EBoard 23 (Section 3): Vectors, Continued"
number: 23
section: eboards
held: 2022-03-18
link: true
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [~5 min]
* Racket stuff [~10 min]
* Questions [~15 min]
* Lab [~50 min]

Administrivia
-------------

### Introductory notes

* Happy Friday!
* There's a slim chance that we'll have no mentors today.  If that's the
  case, Sam will do his best to act like multiple people.
* If anyone wants a Kindle copy of _Weapons of Math Destruction: How 
  Big Data Increases Inequality and Threates Democracy_, DM me and
  I'll send you a copy.  (I bought a lot when it was on sale.)
* I forgot my hearing aid today (and I'm still waiting for the
  replacement of my lost one).  Please speak loudly.

### Class mask policy

* We have students in this class with immunocompromised family members
  who they will see during break.  Hence, **Masks are required.**
* We will revisit this policy after spring break, but assume they are
  also required after spring break.

### Reminders

* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* Evening tutors are available 7--10 p.m. Sunday through Thursday as
  well as 3--5 p.m. on Sunday.
* Mentor sessions are Monday 8--9 p.m.  Wednesday, 8--9 p.m., Sunday 4--5 p.m.

### Upcoming work

* Yes, there's a reading for the end of break.  I'll have the reading
  response up soon.
* Today's lab due Sunday at 10:30 p.m. 
    * But please just submit it today.
* Quiz 8 distributed yesterday at 8am, due Sunday at 4pm: Randomness.
* MP 5 due Thursday after break at 10:30 p.m.  
    * I'll get the submission form up soon.

### Upcoming Token-Generating Activities

### Other Upcoming Activities

Racket/Lab Stuff
----------------

### Yesterday's lab, exercise 3

```
    ; Set up the parameters of our experiment so that they are easy to change
    (define size 10000)         ; The size of our structure
    (define rounds 50000)       ; The number of times we look in the structure

    ; Build a list/vector 
    (define list-of-values (range size))
    ; (define vector-of-values (list->vector list-of-values))

    ; We will be ref-ing the list/vector randomly.  For clarity and
    ; replicability, we're going to make a list of all of the values 
    ; we plan to ref (the "probes")
    (define list-of-probes (random-nums rounds size))

    ; We time the cost of ref-ing the vector.  So that the result of
    ; the lots and lots of probing does not show up on the screen, we 
    ; store it in `list-result`.
    (define list-result
      (time (map (section list-ref list-of-values <>) list-of-probes)))
```

What you might have found

* For lists, if we double the number of rounds, we double the time.
    * Implication: More lookups take more time.  That seems reasonable.
      As one student phrased it "If you walk 'round the building twice
      as many times, it should take about twice as long."
* For lists, if we double the size of the list, we also double the time.
    * Implication: the time for `list-ref` scales with the position in 
      the list
* For vectors, if we double the number of rounds, we double the time.
    * Implication: More lookups take more time.  That seems reasonable.
* For vectors, if we double the size of the vector, we have almost no
  effect on time.
    * Implication: The time for `vector-ref` does not depend on the 
      size of the vector.

Broader idea: How do we test assertions about speed, particularly when
most individual operations  are lighting fast?

Question: Why does the time for `list-ref` scale with the position in 
the list?

* List ref is a recursive procedure that has to recurse through the list
  until it hits the appropriate position.
* Will it take any longer to do `(list-ref long-list 100)` than
  `(list-ref short-list 100)`, assuming short-list has 105 elements
  and long-list has 10000000 elements.

Note vector-ref is independent of the position.  Why?  The location
of the kth element in a vector is `k*box-size` from the start of the
vector.  (We store links in the boxes, all links have the same size.)

Questions
---------

### Reading questions

Could you review recursion over vectors?

> Sure.  There are generally two kinds of recursion we do over vectors:
  Recursion in which we are grabbing elements from the vector and
  recursion in which we are changing/setting elements in the vector.

> In both cases, we need to write a helper that keeps track of our
  position in the vector (along with the vector).  That is, in effect,
  numeric recursion.

> We can count down from the top index (length - 1) to zero, or up
  from 0 to the top index.  Some of us prefer counting down so that
  we don't have to repeatedly call `vector-length`.  However,
  `vector-length` is a cheap operation.

    ; Extraction, counting down
    (if (zero? pos)
        (base-case-computation (vector-ref vec 0))
        (combine (vector-ref vec pos)
                 (recurse vec (- pos 1))))

    ; Extraction, counting up
    (if (>= pos (vector-length vec)) ; Like the null list case
        base-value                   ; 0, if we were counting a's
        (combine (vector-ref vec pos)
                 (recurse vec (+ pos 1))))

    ; Mutation, counting down
    (when (>= pos 0)
      (do-something-to! vec pos)
      (recurse vec (- pos 1)))

    ; Mutation, counting up
    (when (< pos (vector-length vec))
      (do-someting-to! vec pos)
      (recurse vec (+ pos 1)))

> For example, let's build a simplified version of `range` that 
  constructs a vector from 0 to n-1.

> Here's the helper

```
(define iota/helper
  (lambda (vec pos)
    (when (< pos (vector-length vec))
      (vector-set! vec pos pos)
      (iota/helper vec (+ pos 1)))))
```

> Does it work?

```
> (define vec (make-vector 5 'a))
> vec
'#(a a a a a)
> (iota/helper vec 3)
> vec
'#(a a a 3 4)
> (iota/helper vec 0)
> vec
'#(0 1 2 3 4)
```

```
(define iota
  (lambda (n)
    (let ([result (make-vector n 1)])
      (iota/helper result 0)
      result)))
```

Some tests

```
(test-equal? "eight"
             (iota 8)
             '#(0 1 2 3 4 5 6 7))
(test-equal? "zero"
             (iota 0)
             '#())
(test-equal? "one"
             (iota 1)
             '#(0))
(test-equal? "annoyingly long vector"
             (iota 100)
             (list->vector (range 100)))
```
What's the difference between `when` and `cond`?

> `cond` lets us check a sequence of conditions/guards and (normally) has
  a final alternate (the `else`).

> `when` only checks one condition/guard and executes multiple things
  the guard holds.

> Unlike `if`, when does not have an alternative.  (cond has an optional,
  but expected alternative)

### Other issues

Lab
---

### Preparation

* Have the normal start-of-lab discussion.
* Read over the code!
* Save the file as `vectors-continued.rkt`

### During Lab

### Wrapup

* "Sam said I could stop here."

