---
title: "EBoard 05 (Section 2): Expressions and Types"
number: 5
section: eboards
held: 2022-02-02
link: true
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [20 min]
* Questions [?? min]
* Lab [Approximately 60 min]

Administrivia
-------------

### Introductory notes

* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* Don't forget that we have evening tutors available 7--10 p.m.
  Sunday through Thursday, as well as 3--5 p.m. on Sunday.
* The readings appear to have been a bit long.  I apologize.  We're
  down to two readings for Friday (and none for Monday).
* Thanks for the good questions.  And don't apologize for not 
  understanding!

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

        ;;; (snowball size) -> image?
        ;;;   size : positive-real?
        ;;; Make a snowball of the given size.
        (define snowball
          (lambda (size)
            (circle size 'outline 'black)))

        ;;; (snowperson size) -> image?
        ;;;   size : positive-real?
        ;;; Make a snowperson whose base is size.
        (define snowperson
          (lambda (size)
            (above (snowball (* 1/2 size))
                   (snowball (* 2/3 size))
                   (snowball size))))
                   (circle (* 1/2 size) 'outline 'black)
                   (circle (* 2/3 size) 'outline 'black)
                   (circle (* 1 size) 'outline 'black))))

  If `size` is 60, we get snowballs of radii ?, ?, and ? 
  (diameters ?, ?, and ?).  The total height would then be ?.  So we
  could define `snowperson-revisited` as

        (define snowperson-revisited
          (lambda (height)
            ???))

* This example illustrates part of the difference between correct (M)
  and exemplary (E).

### Notes on Numbers in Racket

Important issue: Exact numbers are stored precisely; inexact numbers
can be approximated.  For integers, you'll see problems when you get
to large numbers.  For smaller numbers with a fractional part, you'll
see a variety of issues.

Exact integers are stored exactly.  Inexact integers are approximated.  For large enough values, you'll see a difference.

        > (- (+ 1 (expt 10 50)) (expt 10 50))
        > (- (+ 1 (expt 10.0 50)) (expt 10.0 50))

We generally prefer exact numbers.  However, inexact numbers naturally
crop up in our calculations.  There are also some storage and speed
advantages to using inexact numbers.

### Notes on Strings in Racket

#### Syntax vs. Semantics

We're beginning to see the difference between the conceptual (semantics)
and how we express concepts (syntax).  Consider, for example, a string
that contains two quotation marks.

Strings must begin and end with quotation marks.  That is, the take
the form "...".  How do we signify a quotation mark within the string?
If we just write a quotation mark, it's indistinguishable from the
quotation mark that ends the string.  Hence, we must precede it with
a backslash.  `"\"\""`.

#### Collating Sequences

Behind the scenes, computers essentially store everything as numbers.
The collating sequence tells you what number corresponds to each letter
(or vice versa).  It's helpful to see that, say, the uppercase letters
precede the corresponding lowercase letters by exactly 32, or that the
digit characters appear in order.  We'll use them for those kinds of
reasons.

### Gradescope notes

* For S/N, S is 1 and N is 0.
* For E/M/R/I, E is 3, M is 2, R is 1, N is 0.
* For everything, ignore the autograder computations (other than to see
  what you might have had problems with).
* We'll look at how you check grades on Gradescope.

### Upcoming work

* Readings for Friday due Thursday at 10:00 p.m.
    * Double-dagger problems are Booleans Self-Check #2 and
      Conditionals Self-Check #1.
* Lab writeup from today due Thursday at 10:30 p.m.
    * Ideally, you'll finish that in class today.
    * If not, set up a time to meet with your partners.
    * If that's not possible, finish (and submit) separately, but cite
      your partner.
* Mini-Project 1 due Thursday at 10:30 p.m.
    * On gradescope (after lunch).
* Friday's quiz will be on procedural abstraction.

### Sample quiz problem

_Take a concrete implementation in Racket and create a new function that generalizes the behavior._

As you may recall in building snowmen, we found it useful to be able
to create hats for the snowmen.  A hat consists of three parts: a box,
a brim, and a ribbon.  The brim is at the bottom.  The ribbon appears
to be on the box, directly above the brim, although we will create it
by stacking a rectangle over the box.

We've decided on a 50x50 grey hat with a purple ribbon.  We've
decided that brims will always be 5 units high and that ribbons
will take 1/5 the height of the box.  Rather than doing the
calculations by hand, we'll make Racket do the computations.

```
(above (rectangle (* 50 1/2) (* (- 50 5) 4/5) "solid" "grey")
       (rectangle (* 50 1/2) (* (- 50 5) 1/5) 192 "purple")
       (rectangle 50 5 "solid" "grey"))
```

Write a procedure, `colorful-hat`, that generalizes this approach
by taking the width, height, hat color, and ribbon color as parameters
and producing an appropriate image as output.

### Upcoming Token-Generating Activities

* CS Extras: The 4+1 (Undergrad to Grad) program in CS w/UIowa.
  4 p.m., Thursday, 3 February 2022, Noyce 3821.
* Men's Tennis 9am and 5pm Saturday in the Field House.  (30 min of watching
  is enough)
* Swim meet Saturday at 1pm.  (30 min of watching is enough)
* Men's Basketball Saturday at 1 p.m.

### Other Upcoming Activities

* Women's Basketball Saturday at 3 p.m.

Reading Questions
-----------------

_I've started putting answers to the reading questions in the readings.
These are ones that didn't naturally fit in a reading_

Why do we sometimes use a symbol and sometimes use a string when defining something like a square? For instance, both   (square 40 'solid 'blue)` and `(square 40 "solid" "blue")` are valid and produce the same image.

> The designers of the `2htdp/image` library decided it was nicer
to support either symbols or strings.  I assume they are using
symbols as the primary mode, though.

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

Make sure to grab the `basic-types.rkt` file and put it into DrRacket.
All the instructions are in the file.

If you don't finish in time, either (a) set up a time to meet with your
partner or (b) send a copy to your partner and plan to finish separately.
