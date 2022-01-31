---
title: "EBoard 04 (Section 1): Defining procedures"
number: 4
section: eboards
held: 2022-01-31
link: true
---
# {{ page.title }}

_Getting started_

**This will likely be the last day that I write the getting started
instructions.  You should know them by now.**

* Grab a card.  The card will have a computer name and a location.
* Remember the name and location.
* Drop the card back in the jar.
* Navigate to the computer.
* If you arrive first
    * Clean up your work area with a wipe.
    * Log in, but don't start the lab.
* When both partners arrive, introduce yourselves.

_Approximate overview_

* Administrative stuff [10--15 min]
* Questions [?? min]
* Lab [Approximately 60 min]

Administrivia
-------------

### Introductory notes

* I expect you to show up to class unless you are ill  (or have an
  appropriate conflict).  If you miss class, please notify me as
  to why.
* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* Don't forget that we have evening tutors available 7--10 p.m.
  Sunday through Thursday, as well as 3--5 p.m. on Sunday.
* I've started to put reading questions in the readings themselves.
  (Some questions that can't be associated with a particular reading
  will still end up in the eboard.)
* DM on Teams is usually a better way to reach me than email.
* And yes, you can DM me questions when you have code that doesn't work.
  (I received a "I don't know why my code isn't working.")  
* Times on the readings ranged from 30 minutes to two hours.  The folks
  who are on the two-hour end might want to chat with me, a mentor, or
  academic advising about how to read more efficiently.  (I'm not sure 
  we'll have an answer, but we'll try.)
* Since enough of you are getting the readings done early, I'm moving
  the due times to 10:00 p.m.  (I'll start/finish reading them before
  then.)
* The autograder for today is brand new.  It may have bugs.
* Make sure that the autograder runs correctly!

Notes from the surveys

* Note: Everything correct on a mini-project will earn you an M, not
  an E.  E has to be exemplary/exceptional.  Correct is not exceptional.
* I had not appropriately anticipated the grading load of 80+ students.
  I have not responded to all of the questions on the two surveys, but
  I've done a bunch.  (Gradescope requires me to respond to them all
  for you to see the results.)
* Collaboration
    * No on quizzes and SoLAs.
    * Yes on everything else.  
    * But you should cite.
    * For MPs: Helping and discussing is fine, but don't strictly work
      together.
* Just so you know, you are generally welcome to get help from evening
  tutors, mentors from any of the three sections, peers, and, of course,
  me.  YouTube, on the other hand, is probably not the best recource.

### Racket notes

* As I said, we're learning a new language.
    * You've learned some vocabulary (`above`, `circle`, `*`)
    * You've learned some syntax (put quotation marks around strings,
      the form of expressions)
    * You've learned some semantics (the meanings associated with
      the vocabulary; what it means to put parentheses around things)
* It's good to take notes on languages!  The small cards are a nice
  way for you to permit yourself to rearrange knowledge.
* When tracing, show the current state of the expression at every
  step.  E.g.,

            (+ 3 (* 5 (/ 2 (- 10 5))))
        --> (+ 3 (* 5 (/ 2 5)))
        --> (+ 3 (* 5 2/5))
        --> (+ 3 2)
        --> 5

  or

        --> (add-3 (+1 2) 4 5)
        --> (add-3 3 4 5)
        --> (+ (+ 3 4) 5)
        --> (+ 7 5)
        --> 12

Note: We evaluate the parameters to procedures before we apply the
procedure.  And that's for both built-in procedures and user-defined
procedures.

### Upcoming work

* Readings for Wednesday due Tuesday at 10:00 p.m.
    * Double-dagger problems are Numbers, Check 1; Collating Sequences,
      Check 2; Symbols, Check 1.
* Lab writeup from today due Tuesday at 10:30 p.m.
    * Ideally, you'll finish that in class today.
    * If not, set up a time to meet with your partners.
    * If that's not possible, finish (and submit) separately, but cite
      your partner.
* Mini-Project 1 due Thursday at 10:30 p.m.
    * On gradescope (soonish).
* Friday's quiz will be on procedural abstraction.

### Sample Quiz

* Some of you wrote incorrect Racket code.
    * `(define name Sam)`
    * `(define name ("Sam"))`
    * `(define sam "Sam")`
    * `(define (name "Sam"))`
* Please check your code in DrRacket!
* You don't need to write `#lang racket` and the `(require ...)`.

### Quiz 1

* The points of decomposition:
    * Break things down as much as possible.
    * Name things to clarify.
    * Reuse to make changes easier.
* I was a bit harsher in grading than normal.  For example, if you
  decomposed into floors, but not also into windows, you did not
  get credit.
    * Redos on quizzes/SoLAs are "a different problem on the same topic"
    * And they happen on the next SoLA.
* You don't need to include the `#lang racket` and the `(require ...)`
  in quizzes.
* Please DO NOT put your name in quizzes and SoLAs.  I like to grade
  anonymously.
* There are lots of ways to decompose this image.  I'll discuss
  but won't post to the eboard.  (After all, I might give the
  quiz to another class.)
* Something to think about: If we decide to change the number of floors
  or the number of windows on a floor, how many parts of your code will
  we have to change?

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

What should I do when I come across an error in DrRacket that says
something like "expects 4 arguments, only 3 provided"?

> If DrRacket says "expects 4 arguments, only 3 provided", it means
that you're calling a procedure that expects four arguments (e.g.,
`rectangle`, which expects width, height, opacity, and color) and
only giving it three (e.g., you've forgotten the opacity and typed
`(rectangle 10 5 "blue")`).

When using overlay/align how do I know what order I should put the commands like "center" then "bottom" or "left" then "center". The different places of "center" confuse me as it works sometimes as the first one in the string and other times it doesn't work.

> The first parameter is the x (horizontal) alignment, the second the y (vertical).  Since can be aligned horizontally or vertically at the center, `"center"` is available for each.

> More generally, you can experiment or read [the documentation](https://docs.racket-lang.org/teachpack/2htdpimage.html#%28def._%28%28lib._2htdp%2Fimage..rkt%29._overlay%2Falign%29%29)

I don't understand the difference between function, procedure, and expression.

> functions and procedures are basically algorithms (a set of
instructions, with a name).

> An expression is an instruction to compute a value, often using a function.

Could you explain how to define add-3 a little more?

> Sure.  `add3` is a procedure that takes one input, which we'll call `x`, and adds 3 to `x`.

> To say "a procedure with one input, which we'll call `x`", we write `(lambda (x) …)`.

> To say "add three to `x`", we write `(+ 3 x)`.

> And we use `define` as we've used it in the past.

> Putting everything together, we get

        (define add-3
          (lambda (x)
            (+ 3 x)))

> Whoops, that's the wrong `add-3`.

> Let's try again.  `add3` is a procedure that takes three inputs, which we'll call `x`, `y`, and `z`.  If we pretend that addition only takes two parameters, we'll add `x` and `y`, and then add that result and `z`.

> We say that it's a procedure with `(lambda (x y z) …)`.

> We say "add `x` and `y`, and then add that result and `z`" with `(+ (+ x y) z)`.

> Putting it all together, we get

        (define add-3
          (lambda (x y z) 
            (+ (+ x y) z)))

> If we evaluate/trace, say `(add-3 2 3 4)`, we substitute `2` for `x`, `3` for `y`, and `4` for `z` in the body.  We then evaluate with the normal strategy.

            (add-3 2 3 4)
        --> (+ (+ 2 3) 4)
        --> (+ 5 4)
        --> 9

Other Questions
---------------

Where do I find the evening tutors?

> They should be in 3813 or 3815, with a flag by them to identify themselves.

Lab
---

Make sure to update the csc151 library.  (It's always good to check.)

Problems are labeled A and B.

The partner closer to the front of the room is Partner A.  The partner
further from the front of the room is Partner B.  Partner A should be
at the keyboard for A problems.  Partner B should be at the keyboard
for B problems.

Make sure to grab the `procedures.rkt` file and put it into DrRacket.
All the instructions are in the file.

If you don't finish in time, either (a) set up a time to meet with your
partner or (b) send a copy to your partner and plan to finish separately.
