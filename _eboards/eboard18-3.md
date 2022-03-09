---
title: "EBoard 18 (Section 3): Numeric Recursion"
number: 18
section: eboards
held: 2022-03-07
link: true
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [~5 min]
* Racket stuff [~0 min]
* Questions [~10 min]
* Lab [~60 min]

Administrivia
-------------

### Introductory notes

* I'm back.  THANK YOU to our amazing class mentors for taking over.
    * There's a chance I've forgotten everyone's name.
    * I brought you Gradescope stickers.
* I lost one of my hearing aids, so may be even less responsive than normal.
* I hope you were safe during the tornado.
* I'd forgotten how busy conferences are.  I am even further behind than
  when I left.  (Most of my days ran from 8am to 9pm or later.)
    * I still expect to have quizzes and grade summaries to you Tuesday 
      night.
* Reminder: It's good practice for the navigator to look at the screen 
  or whiteboard once in a while to see if there are any notes on
  the exercise.
* I've rearranged the schedule slightly.  We'll be doing randomness on
  Wednesday and more recursion on Friday.

### Class mask policy

* Please bring your mask to class.  Wear it if you wish.
* If your partner is wearing a mask, please put on your mask.
* As a member of a high-risk group, I will be wearing a mask at least 
  through spring break.

### Reminders

* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* Evening tutors are available 7--10 p.m. Sunday through Thursday as
  well as 3--5 p.m. on Sunday.
* Mentor sessions are Monday 8--9 p.m.  Wednesday, 8--9 p.m., Sunday 4--5 p.m.

### Upcoming work

* Reading for Wednesday: Randomness (due Tuesday at 10:00 pm)
* Today's lab due Tuesday at 10:30 p.m.
    * Today is a "SAM SAID I COULD STOP HERE" day
* Quiz 7 due Sunday at 4pm: Use higher-order procedures
* SoLA 2 due Thursday the 10th at 10:30 p.m.

### Upcoming Token-Generating Activities

* TONIGHT: Mentor Session (8pm)
* THURSDAY 11 a.m., JRC 101: Scholars' Convocation: Greg Duncan '70.
  [_America's Long Struggle to Reduce Child Poverty_](https://grinnellcollege.webex.com/grinnellcollege/onstage/g.php?MTID=e6593d17f299f27465981e67fd39a6580)

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

Questions
---------

### Reading questions

### Other issues

When do we get our redos back?

> Soon, I hope.  I'll talk to the graders on Thursday.

How do we know which LAs to complete?

> Use the list I send you Tuesday night.  You should do the ones that
  are (a) not checked and (b) on this SoLA.

Lab
---

### Preparation

* Don't forget to wear your mask if your partner is wearing a mask.
* Have the normal 'start-of-lab' discussion.

### During Lab

**WRITE TESTS!**  Writing tests helps you ...

* Check whether your procedure works correctly.  (And shouldn't be much
  slower than just typing in the expression and reading the result.)
* Think through what the procedure should do in various situations.
* Consider potential problems.

When writing tests, only use valid inputs!

On Exercise 3, you do not need to fix `bad-range`.  You just need to
propose a way that you might fix it.

On Exercise 4, there's a reason we have the hint.

On Exercises 5 and 6, please write the tests first!

On Exercise 8, some of the tests may be wrong.  It was to see if you
were reading closely.  

### Wrapup

* It's a "SAM SAID STOP HERE" day.
