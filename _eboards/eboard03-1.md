---
title: "EBoard 03 (Section 1): Images and Decomposition"
number: 3
section: eboards
held: 2022-01-28
link: true
---
# {{ page.title }}

_Getting started_

* Grab a card.  The card will have a computer name and a location.
* Remember the name and location.
* Drop the card back in the jar.
* Navigate to the computer.
* If you arrive first
    * Clean up your work area with a wipe.
    * Start the lab.
* When both partners arrive, introduce yourselves.

_Approximate overview_

* Administrative stuff; still no attendance [10 min]
* Bonus administrative stuff [10 min]
* Questions [?? min]
* A quick note from yesterday's lab [?? min]
* Lab

Administrivia
-------------

### Introductory notes

* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* Don't forget that we have evening tutors available 7--10 p.m.
  Sunday through Thursday, as well as 3--5 p.m. on Sunday.
* Our mentors will be sending out a survey on times to hold review
  sessions.
* I'm missing a hearing aid today; I will ask for more repetition than
  normal.
* Just so you know, there is a Keurig and some pods in the CS commons.
  Feel free to make yourself coffee, but please wash your mug when you
  are done.

### Racket notes

* Remember: Open paren, procedure, space, parameters separated
  by spaces, close paren.
    * Parameters can also take the same form.
* As some of you have discovered, Racket allows you to use parens
  `()`, brackets `[]`, or braces `{}`.  We prefer that you generally
  use parens, with brackets added in a few specific situations.

### Upcoming work

* Readings for Monday due Sunday at 8:00 p.m.
* Lab writeup from today due Sunday at 10:30 p.m.
    * Ideally, you'll finish that in class today.
* Mini-Project 1 due Thursday at 10:30 p.m.
    * We'll look at it.

More introductory stuff
-----------------------

### What's "What's Sauce ..."?

* An old aphorism: "What's sauce for the goose is sauce for the gander."
* Meaning: We treat people the same.  
* For this particular problem: I asked you questions, so it's only fair 
  that you ask me questions.
* Broader note: I give questions strange titles.  Feel free to ignore
  them, to try to figure them out, or to ask me (or someone else).
* Aphorism: Maxim, old saying, etc.

### Our first quiz

* Quizzes cover one of the learning goals of the class.  
* Today's quiz is on image decomposition.  After this week, I'll let 
  you know in advance which learning goal the quiz will test.
* Quizzes appear on Gradescope.  I'll make them available at 8 a.m. on
  Fridays and they will be due at 10:30 p.m.  I would recommend that you
  do them after class.
* Once you start a quiz, you have an hour to complete it.  You should
  only need ten minutes.
* Quizzes are limited open book: You can refer to the course Web site,
  the Racket documentation, and your own notes.  You may also use
  DrRacket (and I'd encourage you to use DrRacket).  You may not
  do broader Web searches and you may not talk to other people.
* There is no penalty for getting a quiz wrong.
* If you get a quiz right, you now have credit for the associated
  learning goal/learning assessment.
* I've also posted a sample quiz so that you can see what it's like
  and check times and such.

### Gradescope Demo

* How to see your grade and comments on something.
* How to submit token reflections.
* Our sample quiz.
* Today's real quiz.
* _Apologies that Gradescope quickly gets filled with stuff._

### Friday PSA

I've taught here for twenty-five years.  I've had too many bad things
happen to people I care about that I make it a practice to give a
public service announcement in Friday's classes.

Trigger warning: I will mention sexual assault.  If you would prefer
not to hear comments on sexual assault, for any reason, you can
step out into the hall.  The mentors will call you back in when I'm
done.

*
*
*

Fun With Math
-------------

How did you check whether or not the square-root (`sqrt`) computation
was correct?

*
*
*

Let's try a slightly different experiment.  (See demo in DrRacket.)

Morals

*
*
*

Reading Questions
-----------------

When we're working on projects, should we stick to what we've already covered in class? As one possible example, I notice that Racket's image library has specific options like `pulled-regular-polygon` but I'm not sure if they would be alright to use.

> You may certainly use the additional procedures you discover.  Try not to use new "techniques", though.  (For example, don't use conditionals until we've covered conditionals.)

Could you show how we could change the code, so it is identical to the original output?

> Probably not; sometimes there's only one way to decompose.

Could you show how we could change the code, so it is identical to the original output?

> The easiest way is to put a transparent shape of the appropriate size in-between things.

What is the difference between typing `"red"` and `'red` when dictating the color for an image?

> In the image procedures, there is no difference.

How do I know what to put the tick mark in front of?

> The tick mark means "take this verbatim".  You'll learn about when to use it as we go.  For now, you can put it in front of color names, `'solid`, and `'outline`.

What do the round bevel and miter do, i tried them but it didn't visually seem to make any difference.

> You may need bigger rectangles to see the effects.  But I'll try to play with it to see.

How do I make a smile?

> The hack: Overlay a rectangle of the same color as the background on a circle.

> The better solution: Read the 2hdtp/image documentation for curves and partial circles (`wedge`).

Other Questions
---------------

Lab
---
