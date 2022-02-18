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
* MP3 due next Thursday at 10:30 p.m.
    * Yup, we'll discuss it.
* Quiz 5 next Friday: Regular expressions
* Mini-Project 2 redo due Sunday the 27th at 10:30 p.m. (sooner is better)

### Friday PSA

* Be kind to yourself.  Be kind to others.
* Moderation, even with post-Valentine's chocolate.
* Consent is essential.  (It is necessary, it may not be sufficient.)

### Upcoming Token-Generating Activities

* TODAY: AI Coffee Chat, 5:20-6:00 p.m., Prof. Eliott's lab.  
  "How does it feel to be a university student?"
* TODAY/WEEKEND: Fill out the week four survey, available at
  <https://bit.ly/csc-151-2020Sp-week04>.
  (Only counts if 50% or more of the section fills it out.)
* TODAY/WEEKEND: Conference swimming.  Natatorium.
* WEEKEND: Any self-care activity this weekend.
* SUNDAY/MONDAY: Mentor sessions Sunday and Monday.
* THURSDAY, 11am, JRC 101, "Physics Is More Than Problem-solving: Building 
  Inclusivity and Belonging by Practicing Professionalism".  Prof Marty Baylor 
  of Carleton College.
* ANYTIME: Visit the current exhibit in the Grinnell Art Museum.
  (At least 15 min.)

### Other Upcoming Activities

Sample Quiz Question
--------------------

_Write and structure program code in ways that makes it easier to understand._

Although it is early in the semester, you have already started to learn some bas
ic approaches to making your code more readable.  Here are a few.

* Put the first argument to a procedure on the same line as the procedure.
* Put all of the arguments to a procedure on the same line, or all
  on separate lines.
    * Similarly, when writing an if statement, put the test,
      consequent, and alternate all on the same line or all
      on separate lines.
* Use Ctrl-i to reindent the text.
* When defining a procedure, place the `lambda` and the parameters on 
  a separate line from the `define`, and start the body on a separate
  line from the from the lambda and the parameters.
* Follow "The Zen of Booleans": Avoid explicitly using #t and #f in
  expressions if you can write them more clearly with `and` or `or`.
* Avoid repeated code.
* Avoid unnecessary code.
* Choose descriptive names for variables and procedures.

a. Using those principles, as well as others you have learned, clean up
the following code.

```
(define rab (lambda
(int 
str)
(if (if (equal? #t (integer? (string->number (substring int str))))
#t #f) (string->number (substring int str))
(if (if (equal? (integer? 
(string->number (substring int 0 str))) #f) #f
#t
) (string->number (substring int 0 
str)) #f))))
```

b. In English, describe what `rab` does.

Here are some sample calls to help get you started.

```
> (rab "876xy12" 0)
#f
> (rab "876xy12" 1)
8
> (rab "876xy12" 2)
87
> (rab "876xy12" 3)
876
> (rab "876xy12" 4)
#f
> (rab "876xy12" 5)
12
> (rab "876xy12" 6)
2
> (rab "876xy12" 7)
#f
> (rab "876xy12" 8)
. . substring: starting index is out of range
  starting index: 8
    valid range: [0, 7]
      string: "876xy12"
```

Racket/Lab Stuff
----------------

### Tallying a's

```
(define count-of-as-1
  (tally-value book-characters #\a))
(define count-of-as-2
  (tally (section char=? <> #\a) book-characters))
(define count-of-as-3
  (length (filter (section char=? <> #\a) book-characters)))
```

### Grabbing lines 100 to 120

```
(define grab-lines-100-to-120
  (o (take <> 20) (drop <> 100)))
```

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

