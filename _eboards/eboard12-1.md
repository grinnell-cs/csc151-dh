---
title: "EBoard 12 (Section 1): Recursion"
number: 12
section: eboards
held: 2022-02-18
link: false
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

### Reminders

* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* Evening tutors are available 7--10 p.m. Sunday through Thursday as
  well as 3--5 p.m. on Sunday.
* Mentor sessions are Wednesday, 8--9 p.m., Sunday 4--5 p.m., Monday 8--9 p.m.

### Upcoming work

* No reading for Wednesday!  We'll be doing recursion.
* No reading for Friday!  We don't have class.
* No lab writeup for today!
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

### From the readings (not discussing)

### From the readings (discussing)

### Other questions


