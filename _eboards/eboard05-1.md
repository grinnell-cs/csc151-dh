---
title: "EBoard 05 (Section 1): Expressions and Types"
number: 5
section: eboards
held: 2022-02-02
link: false
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [10 min]
* Questions [?? min]
* Lab [Approximately 60 min]

Administrivia
-------------

### Introductory notes

* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* Don't forget that we have evening tutors available 7--10 p.m.
  Sunday through Thursday, as well as 3--5 p.m. on Sunday.

### Racket notes / Debrief from last lab

* Save early and often!  (insert obligatory joke)
* Use Ctrl-I to reindent.  Understanding indentation will help you
  find some problems, particularly with regard to number of parameters
  and parenthesization.
* Remember that "How do you know your answer is right?"  Many of you
  neglected to check whether `snowman-revisited` is the right height.
  (Or other procedures.)
* It would be nice if you decomposed in your procedures, which is
  why we had the `top-hat` procedure in the lab, but we understand
  that it will take a little time to get used to it.
    * `fancy-house` should probably call `painted-house` and
      `door` procedures, especially since you'd already written
      `painted-house`.
    * `snowman-with-hat` should probably call ...
* There are other ways to think about reusing your prior code.  Could 
  you define `(snowperson-revisited height)` in terms of `(snowperson size)`?

        (define snowperson
          (lambda (size)
            (above (circle (* 1/2 size) 'outline 'black)
                   (circle (* 2/3 size) 'outline 'black)
                   (circle (* 1 size) 'outline 'black))))

  If `size` is 60, we get circles of radius ?, ?, and ?.  The
  total height would then be ...

### Gradescope notes

* For S/N, S is 1 and N is 0.
* For E/M/R/I, E is 3, M is 2, R is 1, N is 0.
* For everything, ignore the autograder computations (other than to see
  what you might have had problems with).
* We'll look at how you check grades on Gradescope.

### Upcoming work

* Readings for Friday due Thursday at 10:00 p.m.
    * Double-dagger problems are
* Lab writeup from today due Thursday at 10:30 p.m.
    * Ideally, you'll finish that in class today.
    * If not, set up a time to meet with your partners.
    * If that's not possible, finish (and submit) separately, but cite
      your partner.
* Mini-Project 1 due Thursday at 10:30 p.m.
    * On gradescope (soonish).
* Friday's quiz will be on procedural abstraction.

### Sample quiz problem

_Forthcoming._

### Upcoming Token-Generating Activities

* CS Extras: The 4+1 (Undergrad to Grad) program in CS w/UIowa.
  4 p.m., Thursday, 3 February 2022, Noyce 3821.
* Men's Tennis 9am and 5pm Saturday in the Field House.  (30 min of watching
  is enough)
* Swim meet Saturday at 1pm.  (30 min of watching is enough)

### Other Upcoming Activities

* Men's Basketball Saturday at 1 p.m.
* Women's Basketball Saturday at 3 p.m.

Reading Questions
-----------------

_I've started putting answers to the reading questions in the readings.  These are ones that didn't naturally fit in a reading_

Other Questions
---------------

How do I do Ctrl-uparrow on a Mac?

> Esc-P ("previous").  You can also use Esc-N if you've gone back too far.
  We normally hit the escape and the letter in sequence.

Lab
---

Make sure to update the csc151 library.  (It's always good to check.)

Make sure to introduce yourself to your partner.

Problems are labeled A and B.

The partner closer to the front of the room is Partner A.  The partner
further from the front of the room is Partner B.  Partner A should be
at the keyboard for A problems.  Partner B should be at the keyboard
for B problems.

Make sure to grab the `???.rkt` file and put it into DrRacket.
All the instructions are in the file.

If you don't finish in time, either (a) set up a time to meet with your
partner or (b) send a copy to your partner and plan to finish separately.
