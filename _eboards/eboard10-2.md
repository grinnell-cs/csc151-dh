---
title: "EBoard 10 (Section 2): Files (and Regular Expressions)"
number: 10
section: eboards
held: 2022-02-16
link: true
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [~5 min]
* Racket stuff [~15 min]
* Questions [~5 min]
* Lab [~55 min]

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

### Other Upcoming Activities

* Neuroscience Journal Club, Thursday, February 17, Noon, Noyce 2517.

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

* Why do some strings appear in a different color?  DrRacket is spell
  checking.
* The `or` might be in the wrong place.  We should be comparing `mentor`
  to "Cassandra", comparing `mentor` to "Quang"`, and *then* using `or`.
    * "We did this differently"
* `or` returns the first truish value, so `(or "Cassandra" "Quang")` gives
  us "Cassandra"
* Humans understand the intent.  Computers do not.
* The computer is applying our mental tracing model: It does the `or`
  before the comparison.

### Tick marks

* The tick mark (quote) does not mean "symbol" or "list".  It means
  "take the following thing verbatim, without evaluating it".
    * With symbols, it distinguishes the symbol from the variable.
    * With lists, it distinguishes the lists from expressions.
* Example
    * (+ 2 3)
    * '(+ 2 3)
* It is a "syntax shorthand" for `(quote THING)`.
* What do you expect for
    * `(list (list 'a 'b) (list 'c 'd) 'e)`?
* Quote applies to *all* of a list; we take the whole thing verbatim.
    * Please don't nest quotes
* Examples
    * `'('stuff 'more stuff)` is short for 
      `(quote ((quote stuff) (quote more) stuff))`
* Questions
    * `(list? (list (list 'a 'b) (list 'c 'd) 'e))` => `#t`
    * `(map list? (list (list 'a 'b) (list 'c 'd) 'e))` => `'(#t #t #f)`
    * `(map list? '((a b) (c d) e))` => `#t` vs `'(#t #t #f)`
    * `(list? '((quote stuff) (quote more) stuff))` => `#t`
    * `(map list? '((quote stuff) (quote more) stuff))` => `'(#t #t #f)`
    * `(map list? '('stuff 'more stuff))` => `'(#t #t #f)`
* Conclusions
    * Tick marks ("quotes") are weird.
    * Don't nest them.

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

Do we have to do the SoLA in one sitting?

> No.  There are seven questions.  You can do each one at any time.
  Each question does have a one-hour time limit.

Lab
---

### Preliminaries

* The autograder is currently borken.  I will be spending the first bit
  of lab time trying to repair it.
* Yes, I intentionally misspelled "broken".

### During Lab

* `(char-alphabetic? char)` determines whether or not `char` is a letter.
* `(length lst)` tells you how many values are in a list
* `(tally-value lst val)` tells you how many times `val` appears in `lst`.
* `(tally pred? lst)` tells you how many things in the list meet the 
  predicate.
* Please number lines as Racket would: The first line is line 0.

### Wrapup

* I think the autograder is fixed.
* If you don't submit the text file(s) with your Racket file, you will
  likely get a "This does not run" message.

