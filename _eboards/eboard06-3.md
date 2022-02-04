---
title: "EBoard 06 (Section 3): Conditionals"
number: 6
section: eboards
held: 2022-02-04
link: false
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [15 min]
* Questions [?? min]
* Lab [Approximately 60 min]

Administrivia
-------------

### Introductory notes

* I forgot my hearing aids today.  You may have to speak a bit louder.
  (Or those in the front may have to repeat.)
* Starting today, I'll use the "randomized calling cards" to call on
  you.  This is an opportunity for you to practice "thinking on your
  feet", as it were.  Please try, but also feel free to say, "I'm
  not sure."
* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* Don't forget that we have evening tutors available 7--10 p.m.
* Mentor sessions are now scheduled: Sunday 4--5 p.m., Monday 8--9 p.m.,
  and Wednesday 8--9 p.m.  All in the CS Commons.
    * This week's topics: Review quizzes 1 & 2; prep for Quiz 3.
* I've set up a semi-anonymous "check in" survey.  Please take
  the time to fill it out.  <https://bit.ly/csc-151-2022Sp-week02>
* We do not have class Monday.  It's a "work differently" day.
  (I'll be working remotely.)
* A reminder: Please keep your mask on when working in 3813 or 3815
  or any classroom.
* I realize that not everyone can make my office hours.
    * Feel free to ask questions on Teams (or via email) at almost any
      time.
    * You can also propose times via the Microsoft Scheduling Assistant.
      (Sam will demo.)
* While we remain at Code Blue, all office hours are via video chat
  on Teams.
    * Protocol: Sam texts "Are you ready?"  You say "Yes".  Sam opens
      a video chat.
    * Alternate Protocol: You text "Are you ready?"  I say "Yes".  One
      of us opens a video chat.

### Asking questions on Teams

* When submitting questions on Teams, please try to use the Q&A
  channel, rather than direct chat, unless you are asking questions
  about your code.
    * There are more people who might reply.
    * There are others who would benefit from your question.
* If possible, title your question.
    * Sam will demo.
* Sam often goes AFK after 8pm, sometimes earlier.
    * If Sam is not AFK, he will answer.
    * If Sam has insomnia, he might answer at strange times.
    * AFK = "Away from Keyboard"

### Racket notes / Debrief from last lab

#### Experimentation

* The `remainder` exercise was intended to suggest that one way
  we learn about procedures is to play/experiment with them.
  (We'd hope that the documentation is clear, but it isn't always.)
* The "four types of rounding" exercise was to encourage you to
  play/experiment.

#### Types of numbers

* Complex: May have an imaginary part; may have a fractional part
* Real: No imaginary part, may have a fractional part
* Rational: No imaginary part, may have a fractional part
* Integer: No imaginary part, may have a fractional part

Notes

* All of these can be exact or inexact.
* Reals and rationals are indistinguishable.
* We tend to assume rationals are exact.

#### Rounding

What are the values of the following?

* `(round 7/2)`
* `(round -7/2)`
* `(round 9/2)`
* `(round -9/2)`

Why?

#### Converting between exact and inexact

* `(inexact->exact (exact->inexact (expt 10 50)))`

### Upcoming work

* Quiz 2 due tonight at 10:30 p.m.
* Readings for Wednesday due Tuesday at 10:00 p.m.
    * DDag question: Two important points from the readings.
* Lab writeup from today due Tuesday at 10:30 p.m.
    * Ideally, you'll finish that in class today.
    * If not, set up a time to meet with your partners.
    * If that's not possible, finish (and submit) separately, but cite
      your partner.
* Mini-Project 2 due Thursday at 10:30 p.m.
    * On Gradescope

### Upcoming Token-Generating Activities

* Men's Tennis 9am and 5pm Saturday in the Field House.  (30 min of watching
  is enough)
* Swim meet Saturday at 1pm.  (30 min of watching is enough)

### Other Upcoming Activities

* Men's Basketball Saturday at 1 p.m.
* Women's Basketball Saturday at 3 p.m.

### Friday PSA

* People care about you.  Please take care of yourselves.
* Embrace moderation
* Don't feel peer pressure; decide what is right for you
* Consent is essential

Reading Questions
-----------------

_I've started putting answers to the reading questions in the readings.
These are ones that didn't naturally fit in a reading_

Last night, I did not have time to review reading questions.  You
can ask them, or other questions, now.

Other Questions
---------------

What happens if you did not get credit for the Decomposition quiz?
(Alternately, what happens if you do not get credit for the
Procedural Abstraction quiz?)

> Don't worry!

> There will be a decomposition problem on SoLA 1.  If you get it 
  right, you'll now have achieved that learning objective.  (Similar
  answer for any topic.)

> I'd recommend that you go to one of the mentor sessions before
  SoLA 1 so that you are better prepared for the problem.

What happens if you got the Decomposition quiz wrong and you also get it
wrong on SoLA 1?

> There will be a decomposition problem on SoLA 2.  If you get it 
  right, you'll now have achieved that learning objective.

> But you should probably chat with me or a mentor or an evening tutor
  before you take SoLA 2, so that we can be sure you understand the
  core concepts.  We can also assign you an individual tutor if that
  will help (and you're making use of other resources).

What happens if you got the Decomposition quiz wrong and you also get it
wrong on SoLA 1 and SoLA 2?

> There will be a decomposition problem on SoLA 3.  If you get it 
  right, you'll now have achieved that learning objective.

> Once again, you should get help before taking it again.

> You'll also have a chance on SolAs 4 and 5.  We hope that's not
  necessary.

Lab
---

### Preparation 

### During Lab

### Wrapup

