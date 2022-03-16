---
title: "EBoard 23 (Section 1): Vectors, Continued"
number: 23
section: eboards
held: 2022-03-18
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

* Happy Friday!
* I hope that you are adjusting to daylight savings time.  (I'm not sure
  that I am yet.)
* Grade summaries distributed recently.
* If anyone wants a Kindle copy of _Weapons of Math Destruction: How 
  Big Data Increases Inequality and Threates Democracy_, DM me and
  I'll send you a copy.  (I bought a lot when it was on sale.)

### Class mask policy

* We have students in this class with immunocompromised family members
  who they will see during break.  Hence, **Masks are required.**
* We will revisit this policy after spring break, but assume they are
  also required after spring break.  (See the PSA for more details.)

### Reminders

* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* Evening tutors are available 7--10 p.m. Sunday through Thursday as
  well as 3--5 p.m. on Sunday.
* Mentor sessions are Monday 8--9 p.m.  Wednesday, 8--9 p.m., Sunday 4--5 p.m.

### Upcoming work

* Yes, there's a reading for the end of break.
* Today's lab due Sunday at 10:30 p.m. 
    * But please just submit it today.
* Quiz 8 distributed yesterday at 8am, due Sunday at 4pm: Randomness.
* MP 5 due Thursday after break at 10:30 p.m.  

### Upcoming Token-Generating Activities

_Note: For mentor sessions, I'd like reflections and not just "this is what we did._

* Mentor session tonight at 8pm

### Other Upcoming Activities

* Spring break

### Spring Break PSA

* Take care of yourselves.
* If at all possible, please take a break.  
    * Rest your brains (at least somewhat).
* Moderation!  (Perhaps not in sleep, but even in sun.)
* Consent is essential.
* Historically, students bring a host of disease variants back to campus
  after spring break.  Plan to mask (not just in my class) after spring
  break.

Racket/Lab Stuff
----------------

### Yesterday's lab, exercise 3

What you might have found

* For lists, if we double the number of rounds, we double the time.
    * Implication: More lookups take more time.  That seems reasonable.
* For lists, if we double the size of the list, we also double the time.
    * Implication: the time for `list-ref` scales with the position in 
      the list
* For vectors, if we double the number of rounds, we double the time.
    * Implication: More lookups take more time.  That seems reasonable.
* For vectors, if we double the size of the vector, we have almost no
  effect on time.
    * Implication: The time for `vector-ref` does not depend on the 
      size of the vector.

Broader idea: How do we test assertions about speed, particularly when
most individual operations  are lighting fast.

Question: Why does the time for `list-ref` scale with the position in 
the list?

Questions
---------

### Reading questions

### Other issues

Lab
---

### Preparation

* Have the normal start-of-lab discussion.
* Read over the code!
* Save the file as `vectors-continued.rkt`

### During Lab

### Wrapup

* "Sam said I could stop here."

