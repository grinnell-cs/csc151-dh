---
title: "EBoard 07 (Section 1): Pair Programming"
number: 7
section: eboards
held: 2022-02-09
link: false
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [15 min]
* Questions [?? min]
* Lab [Approximately 60 min]

Administrivia
-------------

### Introductory notes

* I hope you had a pleasant "work differently" day.
* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* We have evening tutors available 7--10 p.m. Sunday through Thursday.
* We mentor sessions: Wenesday, 8--9 p.m., Sunday 4-5 p.m., Monday 8-9 p.m.
* Attendance
    * Repeat your name.
    * Suggest a highlight of your work differently day.
* Note that 02-05-2022 is an ambiguous date, as is 02/05/2022.
  I much prefer that you use the unambiguous YYYY-MM-DD format.

### Racket notes / Debrief from last lab

#### Zen of Booleans

* Aspect one: Avoid explicit `#t` and `#f`.
    * `(if TEST #t #f)` is a long way to write `TEST`
* Aspect two: Use `and` and `or` instead of `if` and `cond`

Example

```
(define non-integer-number?
  (lambda (x)
    (cond
      [(integer? x)
       #f]
      [(number? x)
       #t]
      [else
       #f])))

(define non-integer-number?
  (lambda (x)
    (and (number? x) 
         (not (integer? x)))))
```

#### Different ways of thinking

```
(define median-of-three
  (lambda (x y z)
    (cond
      [(or (<= x y z) (<= z y x))]
       y]
      [(or (<= x z y) (<= y z x))]
       z]
      [(or (<= y x z) (<= z x y))]
       x]
      [else
       (error "math makes no sense")])))

(define median-of-three
  (lambda (x y z)
    (if (<= x y)
        (if (<= y z)
            y
            (if (<= x z)
                z
                x))
        (if (<= x z)
            x
            (if (<= y z)
                z
                y)))))

(define median-of-three
  (lambda (x y z)
    (- (+ x y z) 
       (min x y z) 
       (max x y z))))

(define median-of-three
  (lambda (x y z)
    (min (max x y) (max x z))))
```

Sam's tests

```
(test-equal? "in order" (median-of-three 1 2 3) 2)
(test-equal? "in reverse order" (median-of-three 10 3 1) 3)
(test-equal? "median first, largest last" (median-of-three 4 2 5) 4)
(test-equal? "median first, largest second " (median-of-three 5 8 1) 5)
(test-equal? "median last, largest first" (median-of-three 11 5 6) 6)
(test-equal? "median last, largest second" (median-of-three 1 11 7) 7)
(test-equal? "all equal" (median-of-three 8 8 8) 8)
(test-equal? "first two equal, third larger" (median-of-three 9 9 10) 9)
(test-equal? "first two equal, third smaller" (median-of-three 0 0 40) 0)
(test-equal? "last two equal, first larger" (median-of-three 3 1 1) 1)
(test-equal? "last two equal, first smaller" (median-of-three 0 2 2) 2)
(test-equal? "outside equal, first larger" (median-of-three 3 5 3) 3)
(test-equal? "outside equal, first smaller" (median-of-three 4 2 4) 4)
(test-equal? "fractions" (median-of-three 1 2 3/2) 3/2)
(test-equal? "includes negatives" (median-of-three 3 -4 11) 3)
(test-equal? "all negative" (median-of-three -3 -5 -4) -4)
```

Which do you prefer?  Why? (TPS)

### Gradescope notes

* Gradescope doesn't let us give categorical grades, so you get numbers.
* For S/N, S is 1 and N is 0.
* For E/M/R/I, E is 3, M is 2, R is 1, N is 0.
* For everything, ignore the autograder computations (other than to see
  what you might have had problems with).
    * E.g., 1.9999 is a 1.
* We'll look at how you check grades on Gradescope.

### Upcoming work

* Quiz 3 Friday: Conditionals
* Readings for Friday due Thursday at 10:00 p.m.
    * DDag question
* Lab writeup from today due Thursday at 10:30 p.m.
    * Ideally, you'll finish that in class today.
    * If not, set up a time to meet with your partners.
    * If that's not possible, finish (and submit) separately, but cite
      your partner.
* Mini-Project 2 due Thursday at 10:30 p.m.
    * On Gradescope

### Sample Quiz Question

_Utilize boolean expressions and values in a program to produce conditional behavior._

As you know, we often associate words with students' standing in
college.  At Smileyville College, Those who have completed fewer
than four terms are "freshlings", those who have completed between
four and seven terms (inclusive) are "wise fools", those who have
completed between eight and eleven terms (inclusive) are "subordinates",
and those who have completed at least twelve terms are "elders".

Write a procedure, `(status terms)`, that, given the number of
terms a student has completed as input, produces a string that
describes the student using the terms above.

### Upcoming Token-Generating Activities

* Mentor sessions.
* Grinnell Lecture, Thursday, 11am
* Track & Field, Darren Young Invite, Saturday, 10am

### Other Upcoming Activities

Reading Questions
-----------------

_I've started putting answers to the reading questions in the readings.
These are ones that didn't naturally fit in a reading_

Other Questions
---------------

Lab
---

### Preparation 

### During Lab

### Wrapup
