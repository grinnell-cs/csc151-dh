---
title: "EBoard 11 (Section 1): Regular Expressions"
number: 11
section: eboards
held: 2022-02-18
link: false
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

* Please don't discuss the SoLA problems until Monday's class.  Some people
  have extensions.

### Reminders

* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* Evening tutors are available 7--10 p.m. Sunday through Thursday as
  well as 3--5 p.m. on Sunday.
    * But not for SoLAs.
* Mentor sessions are Wednesday, 8--9 p.m., Sunday 4--5 p.m., Monday 8--9 p.m.
    * No Mentor Session tonight.

### Upcoming work

* Quiz 4 Today: Style
* Mini-Project 1 redo due Sunday the 20th at 10:30 p.m. (sooner is better)
* Readings for Monday due Sunday at 10:00 p.m.
* Lab writeup from today due Sunday at 10:30 p.m.
    * Our goal is to finish it in class.
* MP3 due Thursday at 10:30 p.m.
    * Yup, we'll discuss it..
* Mini-Project 2 redo due Sunday the 27th at 10:30 p.m. (sooner is better)

### Upcoming Token-Generating Activities

_Note: You do not get credit if others are supporting you (e.g., if you're
playing at a tennis meet or hosting Lunar New Year).  You also don't get
credit for evening tutors._

* Mentor sessions Sunday and Monday.
* Visit the current exhibit in the Grinnell Art Museum.  (At least 15 min.)
* Conference swimming and diving this weekend.

### Other Upcoming Activities

Racket Stuff
------------

Questions
---------

### From the readings (not discussing)

### From the readings (discussing)

What should the J-r-d code look like?

```
; Brute force
(define j-r-d/1
  (rex-any-of (rex-string "Jerod")
              (rex-string "Jared")
              (rex-string "Jered")
              (rex-string "Jarod")))

; A bit more elegant
(define j-r-d/2
  (rex-concat (rex-string "J")
              (rex-char-set "ea")
              (rex-string "r")
              (rex-char-set "eo")
              (rex-string "d")))
```

### Other questions

Lab
---

### Preliminaries

### During Lab

### Wrapup

