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
    * No Mentor Session tonight.

### Introductory notes

* Quiz 3 was returned last night.
* Mini-project 2 was returned today.  There was some grading confusion,
  so let me know if you need more feedback.
* I've now entered tokens for everyone (at least I think I have).

### Racket Stuff

#### Conditionals

What's wrong with the following?

```
(define mentor->section
  (lambda (mentor)
    (cond
      [(string=? mentor (or "Cassandra" "Quang"))
       "Section 01"]
      [(string=? mentor (or "Hallie" "Nameera"))
       "Section 02"]
      [(string=? mentor (or "Micah" "Paul"))
       "Section 03"]
      [else
       "Not a mentor"])))
```

#### Tick marks

* The tick mark (quote) does not mean "symbol" or "list".  It means
  "take the following thing verbatim, without evaluating it".
    * With symbols, it distinguishes the symbol from the variable.
    * With lists, it distinguishes the lists from expressions.
* Quote applies to *all* of a list; we take the whole thing verbatim.
    * Please don't nest quotes
* Note: `'stuff` is short for `(quote stuff)`.

#### `apply` vs `reduce` vs `map`

* All three are `(THING proc lst)`.
* `reduce` is designed for two-parameter procedures.  It combines
  pairs repeatedly until it has a single value.
* `apply` works better for procedures that take an arbitrary number of
  parameters.  It applies the procedure _en masse_.  
* The procedure you give `map` needs to match the number of lists.  If there 
  is only one list, it needs to be a one-parameter procedure.  It
  applies the procedure to each element separately, creating a new list.
* To decide which to use, ask
    * What kind of procedure am I using?
    * What will my result look like?

### Upcoming work

* Readings for Friday due Thursday at 10:00 p.m.
    * No reading writeup!
* Lab writeup from today due Thursday at 10:30 p.m.
    * Let's plan to finish in class today.
* SoLA 1 due Thursday at 10:30 p.m.
    * The late due date is only for people who are ill and who have
      contacted me in advance.
* Quiz 4 Friday: Style
    * The readings should help prepare you.
* Mini-Project 1 redo due Sunday the 20th at 10:30 p.m. (sooner is better)
* Mini-Project 2 redo due Sunday the 27th at 10:30 p.m. (sooner is better)

### Upcoming Token-Generating Activities

_Note: You do not get credit if others are supporting you (e.g., if you're
playing at a tennis meet or hosting Lunar New Year).  You also don't get
credit for evening tutors._

* Mentor sessions.
* Visit the current exhibit in the Grinnell Art Museum.  (At least 15 min.)
* Conference swimming and diving this weekend.

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

