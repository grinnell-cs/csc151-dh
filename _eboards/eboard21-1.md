---
title: "EBoard 21 (Section 1): Pairs and Pair Structures"
number: 21
section: eboards
held: 2022-03-14
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

* Happy Monday!
* I hope that you are adjusting to daylight savings time.  (I'm not sure
  that I am yet.)
* SoLA 2 has been graded and returned.  
* I have 9am-4pm meetings on Tuesday/Thursday this week.  I'll try to
  be more available in the evening.
* Apologies for the error on part two of the starter code for MP5.

### Class mask policy

* We have students in this class with immunocompromised family members
  who they will see during break.  Hence, **Masks are required.**
* We will revisit this policy after spring break, but assume they are
  also required after spring break.

### Reminders

* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* Evening tutors are available 7--10 p.m. Sunday through Thursday as
  well as 3--5 p.m. on Sunday.
* Mentor sessions are Monday 8--9 p.m.  Wednesday, 8--9 p.m., Sunday 4--5 p.m.

### Notes from the survey

_I have not completely digested the week-seven survey, but I've learned
some things._

* Pair programming appears to be going much better.  Only three 
  were still at 'eh stage.
* You folks are generally enjoying meeting new people.
* More than half of you want quiz 8 this Friday.  Quiz 8 will be 
  on randomness.
    * Like all quizzes, it is effectively optional; it just may cut
      down the number of problems you have to do on SoLA 3.
    * Since some of you have to travel on Friday, I'm releasing the
      quiz on Thursday morning.
* Mentor-led days went fine, in part because Sam cut back on the labs.
  (Or maybe everything is easier after recursion.)
  (Or maybe because the mentors are better without Sam.)

A few negative partner comments

* Some of y’all are very annoying to work with, seriously
* Sometimes my partners will run through things and not explain them, so 
  please explain when you can and I will do my best to do the same. Also 
  it really helps to read the directions and problems out loud
* Sometimes I wish my partner would let me talk about my ideas instead of 
  going ahead with their own 
* My only issue was when someone told me that I need to type faster,
  and added pressure on top of the low-quality keyboards definitely
  helped.
* It's a bit of an abstract and/or un-actionable idea, but the timing of 
  when the course staff comes to help during labs sometimes feels like my 
  partner and I were about to break through on our own. It's a tiny complaint 
  in the long run, however.
* I would like them to know that my experiences have been positive
  so far but I have worked with some male partners that have tried
  to "mansplain" the readings and lab to me before.
* Some people are very annoying to work with, and I’d rather work by 
  myself than with those people even if I won’t get as far into the lab

A few positive partner comments

* I enjoy working with so many smart people
* That they should not hesitate to ask me questions
* I have had great experiences! Really appreciate the patience of my partners 
  when I have trouble understanding something and I have not had any problems. 
* I have not had a bad experience with anyone, but please yell at me if I'm 
  being annoying.
* That I appreciate how everyone is listening and there is a clear effort to 
  work collaboratively.
* I am enjoying working with you all. It is also nice to know that I am not 
  the only one struggling with certain concepts. 

Recommendations / General Issues

* Make mini-projects easier.
    * I've been trying.
    * I'm hoping that giving you starter code will help.
    * (Sorry for screwing up a some parts of the starter code.)
* Some folks are really struggling.  We should talk (perhaps after break).
* Frustration that you have to pass all of the tests.
    * You don't.  Some tests are only required for E.  Some are only
      required for M.
* Questions on redos/regrades.
    * First redo on MPs is free (unless you didn't turn it in).
    * Second redo on MPs costs a token.
    * You should only have to fix the things in the checklist the grader
      provides you.  (Fixing more is good.)
* Your average time per SoLA problem ranged from 5 minutes to 61 minutes
  (60 x hours-spent / number-of-problems).
    * It is difficult to give you work that is the appropriate amount
      of challenge for all students.

### Upcoming work

* Reading for Wednesday: Vectors, due Tuesday at 10:00 p.m.
* Today's lab due Tuesday at 10:30 p.m.
    * As usual, "SAM SAID I CAN STOP HERE"
* Quiz 8 distributed Thursday at 8am, due Sunday at 4pm: Randomness.
* MP 5 due Thursday at 10:30 p.m.  
* MP 6 NOT due Thursday after break.
  (Revisions to schedule and grading system coming soon.)
* Mini-competition NOW.

### Upcoming Token-Generating Activities

_Note: For mentor sessions, I'd like reflections and not just "this is what we did._

* Mentor session tonight at 8pm.
* Mentor session Wednesday at 8pm

### Other Upcoming Activities

* Follow baseball/softball/golf on their spring trip

Sample Quiz 8
-------------

_Write programs that produce unpredictable output._

Grinnell has suggested that we make up “random ids” for the students in our classes that we can use in online platforms.

Write a procedure, `(random-id)`, that creates a string consisting of a random six-letter identifier of the form consonant-vowel-consonant-vowel-consonant-vowel, with all letters uppercase.

```
> (random-id)
"PALEQO"
> (random-id)
"ZEDUMI"
```

Isn’t that fun?

Racket/Lab Stuff
----------------

### Section and one-parameter procedures

`(section string-length <>)` is the same as `string-length`.

Note that `section` is intended to fill in one or more parameters of a
procedure.  You generally won't use `section` with one-parameter
procedures.  One exception is for random procedures.

```
(define random-name
  (let ([names '("A" "B" "C")])
    (section random-list-element names)))
```

Questions
---------

### Reading questions

Can we go over the second half of the self check?

> Certainly.  I should have the board all set for that.

> To get `e`, we need `(cadddr thing)` or `(car (cdr (cdr (cdr thing))))`
  or `((o car cdr cdr cdr) thing)`

> To get to `d`, we need `(cadaddr thing)`.  Unfortunately, `cadaddr`
  doesn't exist, so ... `(cadr (caddr (thing)))`.

### Other issues

Am I spending enough time on the reading?  I only spent twenty minutes.

> If you feel confident in the material, then you likely spent enough.

> There's a huge variation in how much time students need to spend on the
  readings.  On the latest reading, one person took nearly two hours,
  a bunch spent an hour, and a bunch spent about thirty minutes.  A
  few spent about fifteen.

> I would generally suggest stopping at an hour or so.

Lab
---

### Preparation

* Have the normal start-of-lab discussion.
* Save as `pairs.rkt`

### During Lab

General

* A list of `n` elements will have `n` cons cells.
* Every non-empty list is a pair.  (So not every list is a pair.)
* Every pair whose cdr is a list is a list.  (So not every pair is a list.)
* Anything you create with `cons` is a pair.
* Because the "list printing algorithm" is optimistic (in that it
  assumes every cons cell is part of a list, unless there is good
  evidence to the contrary), we only see the dot (representing
  "not a list") right before the last element.

Exercise 4

* You cannot take the `cdr` of a non-pair.
* There is a `pair?` predicate with the expected behavior.

Exercise 5

* You needed a helper for 5b; you'll probably want a helper for 5c.

### Wrapup

* "Sam said I could stop here."

