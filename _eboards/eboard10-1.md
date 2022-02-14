---
title: "EBoard 10 (Section 1): Files and Regular Expressions"
number: 10
section: eboards
held: 2022-02-16
link: true
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [~10 min]
* Questions [?? min]
* Lab [Approximately 60 min]

Administrivia
-------------

### Reminders

* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* Evening tutors are available 7--10 p.m. Sunday through Thursday as
  well as 3--5 p.m. on Sunday.
* Mentor sessions are Wednesday, 8--9 p.m., Sunday 4--5 p.m., Monday 8--9 p.m.
    * No Mentor Session next Wednesday (SoLA 1)

### Introductory notes

### Racket/Lab notes

Sam attempts to count the number of possible answers for exercise 4 
from the prior class using a semi-obtuse notation.  He thinks there 
should be 14.

* ((((A op B) op C) op D) op E)
* (((A op (B op C)) op D) op E)
* (((A op B) op (C op D)) op E)
* (((A op B) op C) op (D op E))
* ((A op ((B op C) op D)) op E)
* ((A op (B op (C op D))) op E)
* ((A op (B op C)) op (D op E))
* ((A op B) op ((C op D) op E))
* ((A op B) op (C op (D op E)))
* (A op (((B op C) op D) op E))
* (A op ((B op (C op D)) op E))
* (A op ((B op C) op (D op E)))
* (A op (B op ((C op D) op E)))
* (A op (B op (C op (D op E))))

Let's try four elements

* (((A op B) op C) op D)
* ((A op (B op C)) op D)
* ((A op B) op (C op D))
* (A op ((B op C) op D))
* (A op (B op (C op D)))

#### Tick marks

* The tick mark (quote) does not mean "symbol" or "list".  It means
  "take the following thing verbatim, without evaluating it".
    * With symbols, it distinguishes the symbol from the variable.
    * With lists, it distinguishes the lists from expressions.
* Quote applies to *all* of a list; we take the whole thing verbatim.
    * Please don't nest quotes
* Note: `'stuff` is short for `(quote stuff)`.

#### `apply` vs `reduce`

* `reduce` is designed for two-parameter procedures.
* `apply` works better for procedures that take an arbitrary number of
  parameters.

### Upcoming work

* Readings for Friday due Thursday at 10:00 p.m.
* Lab writeup from today due Thursday at 10:30 p.m.
    * Let's hope we can finish in class today.
  SoLA 1 due Thursday at 10:30 p.m.
* Quiz 4 Friday: Style
* Mini-Project 1 redo due Sunday the 20th at 10:30 p.m. (sooner is better)
* Mini-Project 2 redo due Sunday the 27th at 10:30 p.m. (sooner is better)

### Upcoming Token-Generating Activities

* Mentor sessions.
* Visit the current exhibit in the Grinnell Art Museum.  (At least 15 min.)

### Other Upcoming Activities

* Neuroscience Journal Club, Thursday, February 17, Noon, Noyce 2517.

Questions
---------

### From the readings (not discussing)

### From the readings (discussing)

### Other questions

Lab
---

### Preliminaries

* I do not anticipate dropping any problems from today's lab.

### During Lab

* "Three-parameter `map`".
  `(map + '(1 2 3) '(4 4 4))` -> `'(5 6 7)`
* When you get to `party-person`, just write it the way that you
  would have written it last week.

        (define party-person
          (lambda (scale)
            (above (triangle (* scale 20) 'solid 'green)
                   ...)))

* Note: `reduce` works better with two-parameter procedures, `apply`
  works better with procedures that take an arbitrary number of
  parameters.

### Wrapup

