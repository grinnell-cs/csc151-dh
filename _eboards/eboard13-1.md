---
title: "EBoard 13 (Section 1): Recursion Lab"
number: 13
section: eboards
held: 2022-02-23
link: true
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [~10 min]
* Racket stuff [~0 min]
* Questions [~10 min]
* Lab [~60 min]

Administrivia
-------------

### Introductory notes

* Reminder: Friday is a "no 151" day.  Please spend class time on something
  that makes your life better (sleep, getting ahead on work, time reading,
  etc.)
    * Also: Give yourself the Friday PSA!
* You should have received a grade sheet from me via email yesterday.
    * Let me know if there are ways I can improve the grade sheets.
* I have written to those of you who struggled on SoLA 1 to offer an
  individual tutor.
    * If you didn't get email from me, have been attending mentor sessions,
      and think you'd benefit from an individual tutor, let me know.
* We will have an observer in class today who wants to see how students
  first encounter recursion.
* I have split MP3 into MP3 (problems 1 and 2) and MP4 (everything else).
  Both are due a week from tomorrow.  If you can get MP3 in sooner,
  our graders would appreciate it.
    * I'll have the Gradescope entry up tonight.

### Reminders

* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* Evening tutors are available 7--10 p.m. Sunday through Thursday as
  well as 3--5 p.m. on Sunday.
* Mentor sessions are Wednesday, 8--9 p.m., Sunday 4--5 p.m., Monday 8--9 p.m.

### Upcoming work

* No reading for Friday!  We have a "compute differently" day.
* No reading for Monday!  We continue to explore list recursion on Monday.
* Today's lab writeup is due Sunday night.  
    * But we hope to finish in lab.
* Quiz 5 due Sunday: Regular expressions
* Mini-Project 2 redo due Sunday the 27th at 10:30 p.m. (sooner is better)
* MP3 due Thursday the 3rd at 10:30 p.m.
    * But if you have it done, submit it asap.
* MP4 due Thursday the 3rd at 10:30 p.m.
    * Yes, we'll talk about it today

### Upcoming Token-Generating Activities

* TONIGHT: Mentor Session
* THURSDAY, 11am, JRC 101, "Physics Is More Than Problem-solving: Building 
  Inclusivity and Belonging by Practicing Professionalism".  Prof Marty Baylor 
  of Carleton College.
* ANYTIME: Visit the current exhibit in the Grinnell Art Museum.
  (At least 15 min.)
* SATURDAY: Men's Tennis at the Field House
* SUNDAY: Mentor Session

### Other Upcoming Activities

Sample Quiz Questions
---------------------

### Reading Rex Patterns

_In your own words, explain what each kinds of strings each of the following regular expressions describes._

```
(define r1 
 (rex-concat (rex-string "\"") 
             (rex-char-antiset "\"")
             (rex-string "\"")))

(define r2
 (rex-any-of (rex-char-range #\a #\z)
             (rex-char-range #\A #\Z)
             (rex-char-set "'-")))

(define r3
 (rex-repeat r2))

(define r4
 (rex-concat (rex-char-range #\A #\Z)
             (rex-repeat (rex-concat r3 (rex-string " ")))
             (rex-string "love ")
             (rex-repeat (rex-concat r3 (rex-string " ")))
             (rex-char-set ".?!")))
```

### Using Rex Patterns

Write a procedure, `(rex-tally rex str)`, that counts how many times that
the pattern given by `rex` appears in string.

```
> (rex-tally (rex-string "a") "alphonse says albert and fatima are alphabetical")
10
> (rex-tally (rex-string "al") "alphonse says albert and fatima are alphabetical")
4
> (rex-tally (rex-char-set "aeiou") "alphonse says albert and fatima are alphabetical")
17
> (rex-tally (rex-append (rex-string "a")
                         (rex-char-antiset "a")
                         (rex-string "a"))
             "alphonse says albert and fatima are alphabetical")
. . rex-append: undefined;
 cannot reference an identifier before its definition
> (rex-tally (rex-concat (rex-string "a")
                         (rex-char-antiset "a")
                         (rex-string "a"))
             "alphonse says albert and fatima are alphabetical")
1
> (rex-find-matches (rex-concat (rex-string "a")
                         (rex-char-antiset "a")
                         (rex-string "a"))
             "alphonse says albert and fatima are alphabetical")
'("a a")
```

### Writing Rex Patterns

Write a regular expression that matches the common form of "words"
in English.  Words start with a lowercase or uppercase letter and
then have a sequence of lowercase letters, apostrophes, and dashes.

Racket/Lab Stuff
----------------

_None today._

Questions
---------

### Reading questions

Can you go over tracing of recursive procedures?

> It should be the same as tracing of any other procedure.

> But what you'll often observe is that we build up a *lot* of delayed
  computations that only get done when we reach the base case.

> And you'll get some practice in lab.

Why is `cdr` pronounced "could-er"?

> It's hard to pronounce things with no vowels.  I suppose "code-er" would
  be funnier.

Between the "big three" list functions and recursive list function,
which is more efficient/concise? Are there any special cases where
we should use one over the other?

> There are so many contextual issues that it's hard to answer your
  question.  It's nice to think in terms of the "big three" list
  functions.  But as we'll see, the "big three" are often implemented
  with recursion.  I tend to prefer that you use the big three, except
  when you're learning how to write recursive procedures.

> Note: You'll learn how to write the big three in class.  One of the
  outcomes of this class should be that you can write most of the procedures
  you use (except for some really basic ones, like `+` or `cons`).

What's going on with `(awesum (list 5 2))`?

```
    (awesum (list 5 2))
--> (+ 5 (awesum (list 5 2)))
--> (+ 5 (+ 5 (awesum (list 5 2))))
--> (+ 5 (+ 5 (+ 5 (awesum (list 5 2)))))
--> ...
```

> It keeps expanding forever because we never make the input "smaller".

What does `(awesum (list 5 2))` really result in?

> It runs forever, so there is no final result.

Can you use `car` and `cdr` outside of recursion? 

> Yup.  Anywhere you have a list you can use recursion.

Can you use procedures other than `car` and `cdr` in recursion?

> Yes, as long as they simplify the parameters.  `take` and `drop`
  are a nice pair.

Can two procedures each refer to each other?

> Yes.  We often call that "mutual recursion".

Lab
---

### Preparation

### During Lab

### Wrapup
