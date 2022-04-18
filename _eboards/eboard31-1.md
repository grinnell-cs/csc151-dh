---
title: "EBoard 31 (Section 3): Tail recursion"
number: 31
section: eboards
held: 2022-04-18
link: true
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [~30 min]
* Questions [~10 min]
* Lab [~40 min]

Administrivia
-------------

### Introductory notes

* We may have admitted students.
* We will continue to wear masks until the end of the semester.  Enough
  people requested that on the survey that it seems like the best policy.
* Sam's computer remains broken.  Sorry.  
    * No recordings.  (No one requested them.)
    * It definitely made grading even more of a chore.
    * Traveling all weekend without my laptop is hard!
* SoLA 3 and grades should have been returned.

### Reminders

* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* Evening tutors are available 7--10 p.m. Sunday through Thursday as
  well as 3--5 p.m. on Sunday.
* Mentor sessions are generally Sunday 4--5 p.m.  Monday 8--9 p.m.  
  Wednesday, 8--9 p.m.
    * This week: Ask questions about SoLA 3 and XML/SXML/etc.

### Upcoming work

* Thursday, 10:00 p.m.: Friday's reading (Projects)
* Thursday, 10:30 p.m.: Today's lab
    * Today is "Sam says stop here"
* Thursday, April 21, 10:30 p.m.: MP 6
* Sunday, April 24, 4:00 p.m.: Quiz 11

### Upcoming Token-Generating Activities

* Thursday, April 21, 11am, Convocation
* Thursday, April 21, 3:00 pm, Softball vs. Simpson
* Thursday, April 21, 5:00 pm, Softball vs. Simpson
* Thursday, April 21, Blood drive
* Saturday, April 23, 10 am, Dick Young Classic
* Saturday, April 23, Noon, Baseball vs. Illinois College
* Saturday, April 23, 1pm, Softball vs. Lawrence
* Saturday, April 23, 2:30 , Baseball vs. Illinois College
* Saturday, April 23, 3pm, Softball vs. Lawrence
* Saturday, April 23, 3:45 pm, Water Polo
* Saturday, April 23, 6:00 pm, Water Polo
* Sunday, April 24, 10:15 am, Water Polo (Conference Championship)
* Strike-out-cancer stuff 

### Other Upcoming Activities

Sample quiz question
--------------------

Notes from SoLA 3
-----------------

### Data abstraction

Many people were a bit confused about the `register!` procedure.  The idea
was that you have one extra field in the structure (vector, hash table,
struct) that you increment each time people register.  So the `register!`
procedure would look something like this.

Questions
---------

### MP6 questions

### Hop questions

Could you go over `right-section`?

> `right-section` is supposed to take a two-parameter procedure (`binproc`)
  and a single value (`right`) as parameters and return _a new procedure_
  that takes one value (`left`) as a parameter and applies `binproc`
  to `left` and `right`.

> Here's how I usually write it.

> ```
(define right-section
  (lambda (binproc right)
    (lambda (left)
      (binproc left right))))
```

> That inner `lambda` suggests that we're returning a procedure.

> You might find this easier to understand.

```
(define right-section
  (lambda (binproc right)
    (let ([newproc (lambda (left)
                     (binproc left right))])
      newproc)))
```

### Racket questions

### Reading questions

### Other questions

Lab
---

### Preparation

* Have the normal start-of-lab discussion.

### During Lab

### Wrapup

* `; SAM SAID I CAN STOP HERE`

