---
title: "EBoard 10 (Section 3): Files (and Regular Expressions)"
number: 10
section: eboards
held: 2022-02-16
link: true
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [~5 min]
* Racket stuff [~20 min]
* Questions [~5 min]
* Lab [~50 min]

Administrivia
-------------

### Introductory notes

* Quiz 3 was returned last night.
* Mini-project 2 was returned today.  There was some grading confusion,
  so let me know if you need more feedback.
* I've now entered tokens for everyone (at least I think I have).  Soon
  you'll start seeing tokens charged for late work.  (Some of you have
  already seen them charged for absences.)
* Since someone asked: Yes, I like to hear about spelling, grammar, and
  code errors in the readings.
* Happy post-Valentine's day.  There's chocolate.

### Reminders

* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* Evening tutors are available 7--10 p.m. Sunday through Thursday as
  well as 3--5 p.m. on Sunday.
    * But not for SoLAs.
* Mentor sessions are Wednesday, 8--9 p.m., Sunday 4--5 p.m., Monday 8--9 p.m.
    * No Mentor Session tonight.

### Upcoming work

* Readings for Friday due Thursday at 10:00 p.m.
    * No reading writeup!
    * These are about style and the Zen of Booleans, trying to make the
      implicit more explicit.
* Lab writeup from today due Thursday at 10:30 p.m.
    * Let's plan to finish in class today.
* SoLA 1 due Thursday at 10:30 p.m.
    * The late due date is only for people who are ill and who have
      contacted me in advance.
* Quiz 4 Friday: Style
    * The readings should help prepare you.
* Mini-Project 1 redo due Sunday the 20th at 10:30 p.m. (sooner is better)
* Mini-Project 2 redo due Sunday the 27th at 10:30 p.m. (sooner is better)

### Upcoming Token-Generating Activities

_Note: You do not get credit if others are supporting you (e.g., if you're
playing at a tennis meet or hosting Lunar New Year).  You also don't get
credit for evening tutors._

* Mentor sessions.
* Visit the current exhibit in the Grinnell Art Museum.  (At least 15 min.)
* Conference swimming and diving this weekend.
* Neuroscience Journal Club, Thursday, February 17, Noon, Noyce 2517.

### Other Upcoming Activities

Racket Stuff
------------

### Conditionals

What's wrong with the following? (TPS)

```
(define mentor->section
  (lambda (mentor)
    (cond
      [(string=? mentor (or "Cassandra" "Quang"))
       "Section 01"]
      [(string=? mentor (or "Hallie" "Nameera"))
       "Section 02"]
      [(string=? mentor (or "Micah" "Paul"))
       "Section 03"]
      [else
       "Not a mentor"])))
```

* It worked for Micah, Hallie, and SamR.
* It did not work for Paul.
* Why not?
* The `or` statement is in "the wrong place".  It would be better
  to do `(or (string=? mentor "Cassandra") (string=? mentor "Quang")).
* But we're not sure why it's only the first thing that gets checked.
* The way Racket evaluates or is "check if the first thing is not false"
  If so, it just gives us back the first thing.
* And Racket evaluates expressions inside-out.
* Lessons learned
    * Computers follow strict processes and don't guess.
    * You should remember the mental/tracing model of evaluation. 
    * DrRacket tends to show words whose spelling it knows in green
      and those it does not know in black.

### Tick marks

* The tick mark (quote) does not mean "symbol" or "list".  It means
  "take the following thing verbatim, without evaluating it".
    * With symbols, it distinguishes the symbol from the variable.
    * With lists, it distinguishes the lists from expressions.
* `(+ 2 3)` `'(+ 2 3)`
* It is a "syntax shorthand" for `(quote THING)`.
* What do you expect for
    * `(list (list 'a 'b) (list 'c 'd) 'e)`?
    * `'((a b) (c d) e)`
* Quote applies to *all* of a list; we take the whole thing verbatim.
    * Please don't nest quotes
* Examples
    * `'('stuff 'more stuff)` is short for 
      `(quote ((quote stuff) (quote more) stuff))`
* Questions
    * `(list? (list (list 'a 'b) (list 'c 'd) 'e))` => `#t`
    * `(map list? (list (list 'a 'b) (list 'c 'd) 'e))` => `'(#t #t #f)`
    * `(map list? '((a b) (c d) e))` => `'(#f #f #f #f #f)` vs `#f` vs `'(#f #f #f)` vs.  `'(#t #t #f)`.  The last is the answer, because it's the same as the prior bullet.
    * `(list? '((quote stuff) (quote more) stuff))` => `#t`
    * `(map list? '((quote stuff) (quote more) stuff))` => `'(#f #f #f)` vs `'(#t #t #f)`  It's the second.  `(quote more)` within a tick is a list of two elements.
    * `(map list? '('stuff 'more stuff))` => `'(#t #t #f)` because it's the same as the prior example
* Lessons
    * The tick mark is weird!
    * Don't nest tick marks!  Things will misbehave.

### `apply` vs `reduce` vs `map`

* All three are `(THING proc lst)`.
* `reduce` is designed for two-parameter procedures.  It combines
  pairs repeatedly until it has a single value.
* `apply` works better for procedures that take an arbitrary number of
  parameters.  It applies the procedure _en masse_.  
* The procedure you give `map` needs to match the number of lists.  If there 
  is only one list, it needs to be a one-parameter procedure.  It
  applies the procedure to each element separately, creating a new list.
* To decide which to use, ask
    * What kind of procedure am I using?
    * What will my result look like?

### Exercise 4 from Monday

* The big point: `reduce` does not behave predictably in terms of which
  pairs it combines.  Hence, the procedure you use with it should work
  the same no matter what order things are combined.
* You can also use `reduce-left` or `reduce-right`, but you give up
  the opportunity for parallelization.

Questions
---------

### From the readings (not discussing)

What does "match" mean in the regular expression context?

> We have a pattern given by the regular expression.  We use "match"
  to mean "corresponds to the pattern" (or vice versa).

What do you mean when you say Kleene was your great grand advisor?

> When you do a Ph.D., you have an academic advisor who guides you
through the Ph.D.  O'Donnell was my advisor.  Constable was O'Donnell's
advisor (and therefore my grand-advisor).  Kleene was Constable's
advisor (and my great grand advisor).  (I use grandparent-like terminology
here.)  Church was Kleene's advisor.  Church invented "lambda" as a
way of writing procedures.

Can we go over regular expressions a bit?

> Yes, on Friday, as long as you bring questions.

### From the readings (discussing)

### Other questions

I have an eight-hour lab tomorrow.  Can I have an extension on the SoLA?

> Yes.  DM me to let me know.

Lab
---

### Preliminaries

### During Lab

* `(char-alphabetic? char)` determines whether or not `char` is a letter.
* `(drop lst num)` removes the first `num` elements, returning the new list.
* `(take lst num)` grabs the first `num` elements, return the new list.
* `(length lst)` tells you how many values are in a list
* `(tally-value lst val)` tells you how many times `val` appears in `lst`.
* `(tally pred? lst)` tells you how many things in the list meet the 
  predicate.
* Please number lines as Racket would: The first line is line 0.

### Wrapup

* Since you have a SoLA today, this qualifies as a "stop at 2:20" lab.
  Write "SAM SAID TO STOP" or something similar. 
* The autograder was broken for the other two sections, but I think the 
  autograder is fixed.
* If you don't submit the text file(s) with your Racket file, you will
  likely get a "This does not run" message.

