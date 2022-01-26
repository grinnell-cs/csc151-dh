---
title: "EBoard 02 (Section 2): The Lab Equipment (aka MathLAN and DrRacket)"
number: 2
section: eboards
held: 2022-01-26
link: true
---
# {{ page.title }}

_This class will be recorded unless there are objections._

_Getting started_

* Grab a card.  The card will have a computer name and a location.
* Remember the name and location.
* Drop the card back in the jar.
* Navigate to the computer.
* If you arrive first, use a wipe to clean the keyboard and mouse.
  Then start the lab.
* When both partners arrive, introduce yourselves.

_Approximate overview_

* Administrative stuff; no attendance [10--15 min]
* Debrief on Monday's activity [5--10 min]
* Set up for MathLAN, partner one [10 min]
* Set up for MathLAN, partner two [5 min]
* Lab [45 min]

Administrivia
-------------

### Introductory notes

* I'm still Sam (or SamR).  Our class mentors are still Nameera and Hallie.
* Yes, you will get regular "Spam from Sam" (or whatever you want to
  call the approximately daily email messages).
* I've released "grades" for the first few folks who turned in the reading.
* Please say your name when you ask or answer a question (even if I've
  just called you by name).

### On concerns

Here's the approximate distribution of concerns as of 5:00 p.m. yesterday.

* Time and workload [x18]
* Falling behind / learning curve [x10]
* Knowing less than my peers [x8]
* The class is rumored to be challenging [x6]
* How much will I retain/be able to use? [x3]
* The class has a bad reputation [x2]
* A new topic [x2]
* That I will end up hating CS [x2]
* Obscure language [x1]
* Need to recover from bad coding habits [x1]
* I'm bad at math [x1]
* Motivation [x1]

These are not unreasonable concerns.  But I'd like to address some
of them, particularly time and workload.

* CS is different than most disciplines in that you know when you're
  wrong.  That makes it harder and more frustrating.
* Most Grinnell students are not good at "I'm not getting this; I should 
  give up for now" or even "I'm not getting this; I should ask for help."
  But it's the right approach.  Trying again and again and again is 
  not helpful.
* As you saw in the syllabus, there's a huge range in time required.
  There's no way around that.
* The course is designed to take about twelve hours per week, which
  is what Grinnell says a four-credit course should be.
    * I have cut back on what is in the assignments.
    * Please tell me if you find that you are exceeding this.
* Use resources!  Work in 3813 and 3815 and ask the folks around
  you for help.

My least favorite comment, and one I thought I should respond to:

> I have heard many negative opinions on CSC-151 such as the choice
  of language and the way it's being taught.

* The language: It's not practical in the traditional sense (i.e.,
  that lots of people use it).  But there's evidence that people
  program "better" in Scheme and Scheme-like languages.
    * One of the core designers of Java says that it's his goal
      to get Java to incorporate all of the features of Scheme.
    * As one of our alums who used to be on tht side says, "JavaScript 
      is just Scheme with a worse syntax."
    * Our goal is to get you to think well computationally. 
* Nonetheless, I accept that criticism that it's not a popular language,
  and that means that there are issues.
* The approaches: Active learning (learn by doing), in pairs, with
  mastery grading.
    * Grounded in learning sciences.  Evidence of benefits for all
      three main approaches.
    * I watched lots of students struggle early on (e.g., 3/7 on the
      first SoLA) and then master material by the end of the semester.
      In redoing work, many said "Wow, this was hard then; it's easy
      now."
* I acknowledge that lecture feels more comfortable.  But "read and
  apply with people around to help" is a much better way to learn.
* A hidden issue: "I thought I understood CS, but this class was hard,
  so it must be the class that's the problem."
* In short: _Not all opinions are appropriately informed opinions._  If 
  you've observed America for the past five years or so, you should know 
  that.

### A note on academic alerts

* A colleague suggested that I mention my policy on academic alerts.
* I am fairly aggressive about submitting academic alerts.  
* I will generally submit an academic alert or a note of concern.
    * If you miss multiple classes (how many depends on whether
      you've been notifying me).
    * If you struggle on a SoLA, even though we have re-dos available.
    * If you miss deadlines.
* These are intended mostly to help appropriate people keep track of
  such things.  (Academic advising, your advisor, you, me.)
* I was taught that academic alerts are helpful, since it lets us catch
  issues early and provide appropriate support.
    * In fact, Academic Affairs sent out a message yesterday encouraging
      us to submit alerts.

### Upcoming activities

* Grinnell Quadrangular February 5 at 1pm.

No tokens

* Track and Field Saturday in the Field House.

### Upcoming work

* Read things in preparation for the third day of class and report on 
  those things on Gradescope.  (Due Thursday at 8pm.)
    * You'll find the list of readings in the course schedule.
    * Readings are due the night before class so that I can skim
      them to identify issues I might address in class.
    * I will not always find the time to review them before class.
* Finish the lab writeup for today's class and submit on Gradescope.
    * Ideally, you'll get lab writeups done in class.
    * Failing that, you should strive to get them done before the
      next class, since labs often build on each other.
    * Labs are generally due at 10:30 p.m. the night before the next 
      class.
    * If you don't finish today's lab, message me on teams and it will
      count as finishing.  (Today only offer.)

Observations from reading responses
-----------------------------------

* Just so you know, `+` and `*` can take more than two parameters.
* We'll talk about `string-split` in the Q&A section.

Questions on the readings
-------------------------

_Skim these for about five minutes.  See if you have follow-up questions._

What is that backwards apostrophe you keep typing?

> It's a "backtick".  When the eboard gets formatted, the text
  surrounded by backticks gets presented in a monospace font
  family, making it look more like computer code.

Will the readings always be this long?

> Generally, you'll only have one or two, rather than four or five.
  We ask for a bit more reading during the first week.

> The majority of you spent between one and two hours.  In some of
  the longer cases, it seems like you were also counting the
  syllabus reading and/or you attempted to write out answers to
  all of the sel checks.

> Keep me posted if you regularly spend more than an hour.  We can
  look at ways to make you more efficient.

Should we try things in Racket as we go?

> I wasn't expecting you to do so for the first readings, but it's
  generally a good idea.

Do we have to submit all of the self checks?

> Nope.  Only the ones with double daggers.  You should think through
  the rest, though.

What's the difference between an argument and a parameter?

> In most uses, nothing.

> To some computer scientists, parameters are for function *definitions*
  and arguments are for function *calls*.  E.g., "square is a function
  that takes one parameter, x".  "Square the argument 5."

What's the difference between an operator and a procedure?

> In some languages, where you write them.  For example,
  in C, you'd write `double(5)` and `5 + 5`.

> In Scheme; not much.  We write `(double 5)` and `(+ 5 5)`.

How are parameters related to variables?

> "parameter" is another way to say "argument".  Like variables,
  parameters and arguments name values.  However, parameters are
  "inputs" to a function, while variables are things we compute/name
  along the way.

What's the difference between a function and a procedure?

> In Racket, nothing.

> In some languages, functions return values and procedures do not.

What type is a circle?

> It's an image.  As you'll learn on Friday, we can do a variety
  of things with images.

In Racket, should 3/4 be written as (/ 3 4) or (/ 4 3)? 

> Either as `3/4` or as `(/ 3 4)`

And for subtraction, should 3-4 be written as (- 3 4) or (- 4 3)?

> `(- 3 4)`

What is the meaning of the 2 quotation marks in the rear of the
procedure `(string-split "string" "")`.

> `""` is "an empty string"; that is, a sequence of zero letters.

Why is the first value of the output list in blue?

> Because our text formatter is stupid.

What does `(string-split "Snicker snack" "ck")` mean?

> Split the string (sequence of characters) `"Snicker snack"` at every
  instance of the sequence `"ck"`.  So we should get two or strings
  out of it: `"Sni"`, `"er sna"`, and perhaps the empty string.

Is a sentence considered a list of strings?

> We can choose multiple ways to represent sentences.  We could
  use a list of strings.  We could also use a single string with
  lots of spaces (and a period, exclamation mark, or question
  mark).

Are there tricks for navigating DrRacket faster?

> Ctrl-R does "Run"

> Ctrl-uparrow or Esc-P brings back the prior command.

> Ctrl-downarrow or Esc-N goes forward a command again.

Could you give more examples of how we describe procedures?

> Not right now.  If things don't make sense after today's lab,
  ask again.

Could you explain "list of values" as a type?

> Some procedures return multiple values, which we say are
  grouped into a list.  For example, `string-split` returns
  a list of strings.

> Other procedures can take those lists as input.  For example,
  `length` takes a list as an input and gives you the number
  of elements in the list.

The `map` procedure seems cool.  Can we talk more about it?

> Sure.  Next week.  Maybe the week after.

What version of Racket should we use?

> 8.3, if possible.

What's the difference between `(string-length "a bb ccc dd e")` and
`(map string-length (string-split "a bb ccc dd e"))`?

> `string-length` takes a string as a parameter and counts the number
  of characters (things you would type, including the spaces).

> As you've seen, `string-split` gives you a list of strings.

> `map` with `string-length` works with each element of the list.

> I'll try to demo this in DrRacket.  (Or not.)

Can I nest parenthesized expressions?

> Yup.  As much as you want, as long as you follow the "open paren,
  function/operation, arguments, close paren" model for each
  parenthesized expression.

What's wrong with writing `(5)`?

> 5 isn't a function/operation.

### Q&A

Notes:

* I always reserve time for questions at the start of each class.  
* Questions can be on readings, homework assignments, class policies, 
  and such.
* I prefer focused questions, but I'll work with anything.  "I didn't
  understand X" is fine.
* I may not answer all questions.
* You can also ask questions on Teams.

Questions

What's the apostrophe we type in DrRacket, such as in `(circle 5 'solid 'black)`.?

> That apostrophe (tick mark) says "treat this verbatim, rather than as
  a variable"

Can you use quotation marks rather than ticks?  

> In some cases, yes.  Definitely for images.

Debrief on Prior Class
----------------------

_We're skipping this._

_Think/Pair/Share_

Getting students into card groups was chaos.  I intentionally don't
give an algorithm, and it shows.  What's a better algorithm?

Lab 1: Setting up Linux
-----------------------

It's in the schedule.  Each person will do this separately, with the
other person helping.

Lab 2: Learning Scheme
----------------------

You'll most of this lab collaboratively.

* If you finish early, do the "If you finish early" problems.
* If you finish those, start the reading for the next class.
* If you don't finish, DM me (on Teams) to tell me how far you got.
* We'll debrief a bit next class.
