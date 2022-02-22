---
title: "EBoard 13 (Section 1): Recursion Lab"
number: 13
section: eboards
held: 2022-02-23
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
* SATURDAY: Men's Tennis at the Field House

### Other Upcoming Activities

Sample Quiz Question
--------------------

Racket/Lab Stuff
----------------

Questions
---------

### Reading questions

Can you go over tracing of recursive procedures?

> It should be the same as tracing of any other procedure.

> But what you'll often observe is that we build up a *lot* of delayed
  computations that only get done when we reach the base case.

> Example ...

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
