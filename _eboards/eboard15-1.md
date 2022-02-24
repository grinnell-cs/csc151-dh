---
title: "EBoard 15 (Section 1): Recursion, Continued"
number: 15
section: eboards
held: 2022-02-25
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

* I will be attending the SIGCSE Technical Symposium on Computer Science
  Education this week.  While I have written the labs, our mentors will be
  running classes.
    * Since it's "running", it's only proper that Micah run classes.
    * I will be available on Teams at unpredictable times.

### Reminders

* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* Evening tutors are available 7--10 p.m. Sunday through Thursday as
  well as 3--5 p.m. on Sunday.
* Mentor sessions are Wednesday, 8--9 p.m., Sunday 4--5 p.m., Monday 8--9 p.m.

### Upcoming work

* Wednesday readings forthcoming.  
    * We continue to explore list recursion on Monday.
* There is no lab writeup for today
* Quiz 6 due Sunday: TBD
* MP3 due Thursday the 3rd at 10:30 p.m.
* MP4 due Thursday the 3rd at 10:30 p.m.

### Upcoming Token-Generating Activities

* MONDAY: Mentor Session
* WEDNESDAY: Mentor Session

### Other Upcoming Activities

Racket/Lab Stuff
----------------

### Congratulations! 

You've learned how a few primary procedures are written.

* We did `list-append` (which is normally called `append`), which joins
  two lists together.
* We did a version of `list-remove`.
* You may even have gotten to `reverse`.

One important moral: The computer spends a decent amount of work on
each of these.  `list-append`, for example, has to step through every
element of the first list.

### "This file is not readable"

At times, DrRacket saves in what it calls "binary format".  Human beings
cannot read binary format.  Gradescope isn't good at reading it either.
If you get an error about binary format, please use 

> File -> Save Other -> Save Definitions As Text...

### Tracing, Part One

Copy/paste/change is often the best way to do a full trace.

```
(define fun
  (lambda (x xs)
    (if (null? xs) 
        (list x) 
        (cons (car xs) (fun x (cdr xs))))))
```

I'm putting the body on one line to make it easier.

```
(define fun
  (lambda (x xs)
    (if (null? xs) (list x) (cons (car xs) (fun x (cdr xs))))))
```

```
    (fun 'a '(c d b))
--> 
```

### Tracing, Part Two

If you feel like you've understood tracing well enough, it's okay to
skip steps (but not on the SoLA).

### Tracing with cons

Note that `cons` only builds a list when both parameters are complete.
You'll often end up with something like the following in your trace.

```
--> (cons 'a (cons 'b (func ...)))
```

We need to keep the "delayed cons" until we reach the base case, just
as we had the "delayed add" in sum.

Questions
---------

### Reading questions

### Other issues

Can I has an extra sticker?

> Sure.

Lab
---

### Preparation

### During Lab

### Wrapup

