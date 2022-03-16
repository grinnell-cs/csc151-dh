---
title: "EBoard 22 (Section 1): Vectors"
number: 22
section: eboards
held: 2022-03-16
link: true
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [~5 min]
* Racket stuff [~10 min]
* Questions [~5 min]
* Lab [~60 min]

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
```

Minor update: Allow it to handle integers as well as lists of integers.

```
```

Next variant: Add support for nesting

```
```

Questions
---------

### Reading questions

### Other issues

Lab
---

### Preparation

* Have the normal start-of-lab discussion.
* Save the file as `vectors.rkt`

### During Lab

General

### Wrapup

* "Sam said I could stop here."

