---
title: "EBoard 13 (Section 1): Recursion Lab"
number: 13
section: eboards
held: 2022-02-20
link: true
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [~5 min]
* Racket stuff [~5 min]
* Questions [~5 min]
* Discussion [~60 min]

Administrivia
-------------

### Introductory notes

* Today is a lecture/discussion day.  No computers necessary.
* It's great that many of you are using whiteboards to solve problems.
  But please make sure to erase the board after you are done in a room.
* I have not gotten quizzes graded yet, but will soon.
* You may also get broader "grade status" reports this evening.
* Please enter token activities on the Tokens "assignment" on Gradescope.

### Reminders

* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* Evening tutors are available 7--10 p.m. Sunday through Thursday as
  well as 3--5 p.m. on Sunday.
* Mentor sessions are Wednesday, 8--9 p.m., Sunday 4--5 p.m., Monday 8--9 p.m.

### Upcoming work

* No reading for Wednesday!  We'll be doing a recursion lab.
* No reading for Friday!  We have a "compute differently" day.
* No lab writeup for today.
* MP3 due Thursday at 10:30 p.m.
* Quiz 5 due Sunday: Regular expressions
* Mini-Project 2 redo due Sunday the 27th at 10:30 p.m. (sooner is better)

### Upcoming Token-Generating Activities

* WEDNESDAY: Mentor Session
* THURSDAY, 11am, JRC 101, "Physics Is More Than Problem-solving: Building 
  Inclusivity and Belonging by Practicing Professionalism".  Prof Marty Baylor 
  of Carleton College.
* ANYTIME: Visit the current exhibit in the Grinnell Art Museum.
  (At least 15 min.)

### Other Upcoming Activities

Sample Quiz Question
--------------------

Racket/Lab Stuff
----------------

### Order matters (in rexes and elsewhere)

```
; v1
(rex-any-of (rex-repeat (rex-string " "))
            (rex-repeat (rex-string "\n"))
            (rex-repeat (rex-string "\t")))

; v2
(rex-repeat (rex-any-of (rex-string " ")
                        (rex-string "\n"))
                        (rex-string "\t"))
```

### Multiple approaches

```
; V1
(define letter (rex-char-set "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"))
; V2
(define letter (rex-any-of (rex-char-range #\a #\z)
                           (rex-char-range #\A #\Z)))
```

### Exercise 3

```
; The basic solution
(define rex-match-strings
  (lambda (rex strings)
    (filter (section rex-matches? rex <>) strings)))

(define rex-match-strings
  (lambda (rex strings)
    (filter (lambda (str) (rex-matches? rex str))
            strings)))
```

Questions
---------

Algorithms, Revisited
---------------------

TPS:

_What are the core building blocks of algorithms?_

_How do we achieve them in Scheme?_

### Core building blocks

* Basic values and the operations on those values

### Basic values and the operations on those values

* Numbers (exact and inexact, complex, real, rational, integer):  Standard 
  mathematical operations (`+`, `-`, `*`, `/`).  predicates (e.g., 
  `integer?`), conversion (e.g., `exact->inexact`, `floor`), etc.

About Recursion
---------------

Some Examples
-------------

_We will design these in English and perhaps then convert them to Scheme._

_These examples will use volunteers (or voluntolds)._

Congratulations, you are employees of MicroGoogazonBook.  We have some
tasks for you.  Fortunately, you can delegate most of the task.  We'll
explore how to solve problems with delegation.

### Counting

### Alphabetically first

### Ordering 

_No, not with GrubHub or Uber Eats; that's unethical._
