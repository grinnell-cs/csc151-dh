---
title: "EBoard 22 (Section 2): Vectors"
number: 22
section: eboards
held: 2022-03-16
link: true
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [~5 min]
* Racket stuff [~20 min]
* Questions [~5 min]
* Lab [~50 min]

Administrivia
-------------

### Introductory notes

* Happy Wednesday!
* I hope that you are adjusting to daylight savings time.  (I'm not sure
  that I am yet.)
    * This may be the last time we have to adjust!
* I'm still working on the grade summaries.  Sorry.
* We will be doing a second vectors lab on Friday.
    * If you can't be in class on Friday, please do it on your own.
* If anyone wants a Kindle copy of _Weapons of Math Destruction: How 
  Big Data Increases Inequality and Threates Democracy_, DM me and
  I'll send you a copy.  (I bought a lot when it was on sale.)
* There are a lot of illnesses going around campus.  If you feel
  ill, please don't attend class.  But do send me email.

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

* No reading for Friday.
* Today's lab due Thursday at 10:30 p.m.
    * As usual, "SAM SAID I CAN STOP HERE"
* Quiz 8 distributed Thursday at 8am, due Sunday at 4pm: Randomness.
* **UPDATE**: MP 5 due Thursday after break at 10:30 p.m.  

### Upcoming Token-Generating Activities

_Note: For mentor sessions, I'd like reflections and not just "this is what we did._

* Mentor session tonight at 8pm

### Other Upcoming Activities

* Spring break

### Spring Break PSA

* Take care of yourselves.
* If at all possible, please take a break.  
    * Rest your brains (at least somewhat).
* Moderation!  (Perhaps not in sleep, but even in sun.)
* Consent is essential.
* Historically, students bring a host of disease variants back to campus
  after spring break.  Plan to mask (not just in my class) after spring
  break.

Sample Quiz 8
-------------

_Write programs that produce unpredictable output._

Grinnell has suggested that we make up “random ids” for the students in our classes that we can use in online platforms.

Write a procedure, `(random-id)`, that creates a string consisting of a random six-letter identifier of the form consonant-vowel-consonant-vowel-consonant-vowel, with all letters uppercase.

```
> (random-id)
"PALEQO"
> (random-id)
"ZEDUMI"
```

Isn’t that fun?

Racket/Lab Stuff
----------------

### Converting lists to strings

One of the points of the `int-list->string` exercise was that printing
of lists is optimistic in Racket.  We assume we have a list until
proven otherwise.

We'll use a local helper rather than the separate procedure.  To
define local recursive helpers, we use `letrec` rather than `let.
(The reason is complicated.)

I'm using `cond` rather than `if` because I expect to add more cases.

```
(define int-list->string
  (letrec ([; helper is used for all but the car; it add spaces and values
            helper
            (lambda (val)
              (cond
                [(null? val)
                 ""]
                [else
                 (string-append " " 
                                (number->string (car val))
                                (helper (cdr val)))]))])
    (lambda (val)
      (cond
        [(null? val)
         "()"]
        [else
         (string-append "("
                        (number->string (car val))
                        (helper (cdr val))
                        ")")]))))
```

Next version: Add support for a dot at the end.

```
; What if the pair structure does not end in null?  What would you
; change in this code?
(define int-listish->string
  (letrec ([; helper is used for all but the car; it add spaces and values
            helper
            (lambda (val)
              (cond
                [(null? val)
                 ""]
                [(number? val)                                  ; ADDED
                 (string-append " . " (number->string val))]    ; ADDED
                [else
                 (string-append " "
                                (number->string (car val))
                                (helper (cdr val)))]))])
    (lambda (val)
      (cond
        [(null? val)
         "()"]
        [else
         (string-append "("
                        (number->string (car val))
                        (helper (cdr val))
                        ")")]))))
```

Minor update: Allow it to handle integers as well as lists of integers.

```
(define int-thing->string
  (letrec ([helper
            (lambda (val)
              (cond
                [(null? val)
                 ""]
                [(number? val)
                 (string-append " . " (number->string val))]
                [else
                 (string-append " "
                                (number->string (car val))
                                (helper (cdr val)))]))])
    (lambda (val)
      (cond
        [(null? val)
         "()"]
        [(number? val)
         (number->string val)]
        [else
         (string-append "("
                        (number->string (car val))
                        (helper (cdr val))
                        ")")]))))
```

Next variant: Add support for nested structures.

```
(define int-thing->string
  (letrec ([helper
            (lambda (val)
              (cond
                [(null? val)
                 ""]
                [(number? val)
                 (string-append " . " (number->string val))]
                [else
                 (string-append " "
                                (int-thing->string (car val))
                                (helper (cdr val)))]))])
    (lambda (val)
      (cond
        [(null? val)
         "()"]
        [(number? val)
         (number->string val)]
        [else
         (string-append "("
                        (int-thing->string (car val))
                        (helper (cdr val))
                        ")")]))))
```

Questions
---------

### Reading questions

What's a vector literal vs. a vector?

> A vector literal is one we create with a tick.  `'#(1 2 3)`

> A "normal" vector is one we create in almost any other way (with
  `vector` or `make-vector` or `list->vector` or ...)

> We often avoid vector literals because they do not permit `vector-set!`
  (or other mutation).

Can we see an example of `vector-set!`

> Yup

Why do the examples have so many `/kernel` at the end.

> We use `/kernel` to name our helper procedures.

> I'll work on changing that.

What is `when`?

> `(when TEST EXP1 EXP2 ...)` is an alternate to `cond` and `if`.
  It first evaluates `TEST`.  If test holds, it evaluate *all* the expressions
  in turn.  If the test doesn't hold, the `when` returns nothing.

> Shorthand for `(cond [TEST EXP1 EXP2 ...])`.  Easier to read, formats
  better.

Can I think of it as a do-while loop?

> I won't stop you, but that's not how most people think of it.

> It is useful for recursive repetition.

Will we ever do while loops.

> Nope.  You have recursion.  Why would you need anything else?

### Other issues

Lab
---

### Preparation

* Save the file as `vectors.rkt`.
* Grab `pg1260.txt`, too.
* Have the normal start-of-lab discussion.
* Read over the code!

### During Lab

See board for memory model.

`(time exp)` evaluates the expression, prints out the time, and then
returns the value of the expression.

### Wrapup

* "Sam said I could stop here."
* Make sure to submit pg1260 too.
