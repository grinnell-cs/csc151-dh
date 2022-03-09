---
title: "EBoard 19 (Section 2): Randomness"
number: 19
section: eboards
held: 2022-03-09
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

* Thank you to those of you who posted corrections in your reading questions.
  I enjoy awarding tokens.
* I have sent out your current grade reports.
    * It appears that Gradescope misled me about the readings for class 15;
      I'll get the rest of those graded soon.
    * Our graders are trying hard to catch up on grading.
    * If you notice issues on LAs or readings, let me know.
    * You should get another grade report on Sunday or Monday, after
      I've finished grading the SoLA.
* The College required me to post midterm assessments yesterday.
    * Fewer than 7-8 LAs generally earned you an M or an R.
    * I will likely be sending out academic alerts for the same reason.
    * Unfortunately, midterm assessments don't match well with the mastery
      grading we use in this course, particularly since the graders have not
      graded redos and you have not had a chance to do SoLA 2.  Take your
      midterm assessments with a large grain of salt.

### Class mask policy

* Please bring your mask to class.  Wear it if you wish.
* If your partner is wearing a mask, please put on your mask.
* As a member of a high-risk group, I will be wearing a mask at least 
  through spring break.
* Note: Masks remain good for preventing transmission of cold and
  flu and other similar diseases.

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
    * We'll be talking about it more on Friday.
* SoLA 2 released today at 2:30 and due Thursday the 10th at 10:30 p.m.
* Quiz 7 due Sunday at 4pm: Use higher-order procedures.
* Week seven survey distributed Friday, due Sunday at 10:00 p.m.
* Reading for Monday's class, also due Sunday at 10:00 p.m.
* MP 5 due next Thursday at 10:30 p.m.  To be released Friday.

### Upcoming Token-Generating Activities

* THURSDAY 11 a.m., JRC 101: Scholars' Convocation: Greg Duncan '70.
  [_America's Long Struggle to Reduce Child Poverty_](https://grinnellcollege.webex.com/grinnellcollege/onstage/g.php?MTID=e6593d17f299f27465981e67fd39a6580)
* Grinnell Singers concert Sunday at 2pm (we think) in See, Bring, Lou, Us
* International dinner Saturday night.

### Other Upcoming Activities

Sample Quiz 7
-------------

_Use `section` and composition to simplify computations._

Consider the following procedures

```drracket
;;; (vowel? char) -> boolean
;;;   char : char?
;;; Determine if char is a vowel.
(define vowel?
  (let ([vowels (string->list "aeiou")])
    (lambda (ch)
      (integer? (index-of vowels (char-downcase ch))))))

;;; (count-vowels str) -> integer?
;;;   str : string?
;;; Count the number of vowels in str
(define count-vowels
  (lambda (str)
    (tally vowel? (string->list str))))

;;; (select-special-words words) -> list-of string?
;;;   words : list-of string?
;;; Selects all the special words in words using the ALTV criterion.
(define select-special-words
  (lambda (words)
    (filter (o (section > <> 2) count-vowels) words)))
```

a. What kinds of words does `select-special-words` select?

b. Explain how `(o (section > <> 2) count-vowels)` works as a
predicate for such words.

c. Rewrite `vowel?` using `section` and composition but no
`lambda`.

### Bonus hard question

_You are unlikely to receive a problem this hard._

Consider the following procedure.

```drracket
(define silly
  (lambda (lst)
    (map (lambda (x) (sqr (+ 1 x)))
         (filter odd? lst))))
```

Rewrite the procedure using `o` and `section` so that it has *no* lambdas.

Notes:

* Use `o` when you want to sequence actions. (Do *this* to the parameter,
  then *this* to the result, then *this* to the next result, and so on 
  and so forth.)
* Use `section` when you want to fill in one or more parameters to a 
  procedure, thereby creating a new procedure.
* This is a case in which the lambda-free version is likely much harder to
  read.

Racket/Lab Stuff
----------------

### The local bindings self check

Rewrite `v2c-ratio` so that we don't duplicate work.

#### Original

```
;;; (v2c-ratio str) -> rational?
;;;   str : string
;;; Determine the ratio of vowels to consonants in str
(define v2c-ratio
  (lambda (str)
    (/ (tally vowel? (string->list str))
       (tally consonant? (string->list str)))))
```

#### Rewritten (without `let`)

```
(define v2c-helper
  (lambda (lst)
    (/ (tally vowel? lst)
       (tally consonant? lst))))

(define v2c-ratio
  (lambda (str)
    (v2c-helper (string->list str))))
```

#### Rewritten (with a local helper)

```
(define v2c-ratio
  (let ([helper
         (lambda (lst)
           (/ (tally vowel? lst)
              (tally consonant? lst)))])
    (lambda (str)
      (helper (string->list str)))))
```

or

```
(define v2c-ratio
  (let ([helper
         (lambda (lst) (/ (tally vowel? lst) (tally consonant? lst)))])
    (lambda (str)
      (helper (string->list str)))))
```

#### Rewritten, substituting the local helper

_Sam will attempt this "live", perhaps with help._

```
(define v2c-ratio
  (lambda (str)
    ((lambda (lst) (/ (tally vowel? lst) (tally consonant? lst)))
     (string->list str))))
```

```
(define v2c-ratio
  (o (lambda (lst) (/ (tally vowel? lst) (tally consonant? lst)))
     string->list))
```

_No, I don't expect you to do this._

### Termial and natural numbers

```
> (natural? 0)
#t
> (natural? 1)
#t
> (natural? 4)
#t
> (natural? -1)
#f
> (natural? 1.0)
#f
```

Moral: If we say that something expects a natural number, we mean
"an exact non-negative integer".

### Quiz 6

While I won't put answers in the eboard, I will go over it in DrRacket.

### The bad range procedure

Here's the "bad" version of `range` from the lab

```
(define bad-range
  (lambda (n)
    (if (zero? n)
        null
        (cons n (bad-range (- n 1))))))
```

As you might have noted, this gives us the values in the wrong order.
Although it's inefficient, we might consider adding a `reverse` to
the mix to get them in the right order.

```
(define less-bad-range
  (lambda (n)
    (if (zero? n)
        null
        (reverse (cons n (less-bad-range (- n 1)))))))
```

Will this work? (Ignore the inefficiency.)

Here's another approach.  Since we're putting the values at the wrong
position, just swap the parameters to `cons`.

```
(define lesser-bad-range
  (lambda (n)
    (if (zero? n)
        null
        (cons (lesser-bad-range (- n 1)) n))))
```

Will this work?

Questions
---------

### Reading questions

Why do we include `(lambda () ...)` in the definitions of random
functions?

> The `lambda ()` makes it a function, which means that we execute
  the body each time it is called, giving ourselves the opportunity
  to get different results.  If we don't have the lambda, it's just
  a value, and it does not change (at least in one run of the program).

### Other issues

I'd like to build a library of procedures I have written that I can
then reuse.  How do I do so?

> At the top of the library (after `#lang racket`), write 
  `(provide (all-defined-out))`.

> In the file that you want to use the library, write
  `(require (file "my-library.rkt"))`.

Lab
---

### Preparation

* Don't forget to wear your mask if your partner is wearing a mask.
* Have the normal 'start-of-lab' discussion.

### During Lab

* Exercise 2: The odds of getting an average of 1 (or an average of 6)
  on ten dice rolls are 1/60466176.
* Exercise 4: In my analysis, we should win approximately 800 out of
  3600 games of seven-eleven.
* Exercise 4: Unfortunately, we don't.  Exercise 5 helps you think about why.

### Wrapup

* It's another "SAM SAYS STOP HERE" day.  We'll go over much of the lab
  next time.
