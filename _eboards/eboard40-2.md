---
title: "EBoard 40 (Section 2): Wrapup"
number: 40
section: eboards
held: 2022-05-13
link: true
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [~10 min]
* Peer Reviews [~15 min]
* "The Subject Matter(s) of the Course" [~20 min]
* Peer Reviews, Continued [~15 min]
* End of Course Evaluations [~15 min]
* Final comments [~5 min]

Administrivia
-------------

### Introductory notes

* Beware!  Friday the 13th falls on Friday this month.
* Happy (sad) last day of classes!
* I appreciate the Grinnell Parents Facebook Group's discussion of CS.

### Friday PSA

* People care about you.  Take care of yourself.
* Make the choices that are right for you, not the choices you think others
  want you to make (or are making for themselves)
* Moderation!  (Perhaps even in sleep.)
* Consent is essential.
    * Alternately, consent is necessary, but not sufficient.
    * "You don't climb a mountain without first making plans."

### Upcoming work

* SoLA 5 (optional)
    * Released Tuesday, 17 May 2022 at 8:00 a.m.
    * Due Friday, 20 May 2022 at 5:00 p.m.
    * Review session 8pm Monday of Finals week
* MP redos Friday, 20 May 2022 at 5:00 p.m.
* Other outstanding work (see notes below)

Questions
---------

I've overspent my tokens.  What happens?

> Traditionally, you lose a reading, lab, or LA for each two tokens you've
  overspent.  (I try to pick the one that is least harmful.)

> This semester: I'm wiping the slate clean (as long as you showed up
  to class today).  

> Note: I have not reviewed recent tokens.  Let me know if you still need
  me to do so.

I took an extension on SoLA 4.  When is it due?

> Saturday at 10:30 p.m.

Can I meet with you during finals' week?

> Certainly.  Propose a time using the Outlook/Teams scheduler or DM me.

When will SoLA 4 be graded?

> My goal is by Monday morning so that you know whether you need to study
  for/take SoLA 5.

What about everything else?

> My goal is to grade anything remaining on Monday.  By Monday, you
  should know whether or not you want to be done with the class.

> You will get the same report, along with a likely letter grade.

Peer Reviews
------------

_15 min_

Your names are on the board.  For each of the five names that come after
you, write the name on the blank side of the card and something positive
about the person on the other.  

If one of your names has an asterisk, please go a bit further because
they won't be writing cards (and we'd like the next few people to have
at least five cards).

If you don't know someone in your list, you can skip over them.

If you have extra time, you can write on more cards (choose whoever you want).  

You can also write cards about the mentors, if you wish.

```
+--------------+    +--------------+
|              |    |I appreciate  |
|              |    +--------------+
|              |    |that you never|
|              |    +--------------+
|     SamR     |    |tried to be   |
|              |    +--------------+
|              |    |funny in class|
|              |    +--------------+
|              |    |Learning is   |
|              |    +--------------+
|              |    |serious bsns. |
+--------------+    +--------------+
```

"The subject matter(s) of the course"
-------------------------------------

_20 min_

The end-of-course evaluations have five questions that read "_blah
blah blah_ helped me understand the subject matter of the course".
When we first started using College-wide EOCEs, I asked "How will
students know what the subject matter of the class is?  After all,
students call CSC 151 'The Scheme Course', even though our primary
focus is functional problem solving, and CSC 152 'The Java Course',
even though its focus is algorithms and data structures."  The
response "You can tell them."  But that's not my style.

So we're going to collaboratively develop a list of things you may
have learned in CSC 151 this semester.  I tend to group them into
categories.  

* I'll describe the categories and give an example for each.
* I'll give you some time to come up with suggestions.  
* We'll talk through them for a bit.

### Problem Solving 

_General strategies for approaching problems, computational and otherwise._

* E.g., We've learned to *decompose* a complex problem into smaller
  problems (subroutines) and then combine those solutions back into
  the broader solution.  For example, in learning how to make some
  kinds of sandwiches, we might also solve the problem of "spread
  stuff on bread".
* Don't assume you can solve everything at once; take a break and
  come back to it.  Ask for help.
* Sometimes we don't succeed (we fail).  We can learn from failure.
  And it's not the end of the world.
* There are often multiple solutions.  We can compare them to see which
  is better.
* We generally solve better as a group (or pair) than as individuals.

### The core of CS: Algorithms and data structures

_CS is the study of algorithms and data structures; ways to manipulate
data and ways to organize data._

* E.g., We've learned about the "List" data structure, which organizes
  information in sequential order and which you can visit element by
  element using `car` and `cdr`.  It also permits you to process
  all the element using procedures like `map` and `reduce`.
* E.g., We've learned some algorithms, such as searching through an
  unordered vector.
* Vectors: Mutable, ordered collections that provide fast access.
* Hash tables
* Structs
* CSV files
* Trees
* Binary search
* A little bit about analyzing algorithms
* ...

### Functional programming

_CSC 151 uses an approach that we term "functional programming" and that
is somewhat distinct from other approaches._

* E.g., "Functions are first-class values": They can be parameters to
  other functions, they can be returned by other functions.  For
  example, `o` is a function that takes two unary functions as
  parameters and returns a new function that applies the two in sequence.
* Anonymous procedures: We can write and use functions without naming
  them (e.g., with `lambda`, `section`, and `o`).
* Um - Use math
* Generally, functional data is *immutable*; you don't get to change
  values along the way.
* Recursion

### Program and software design

_We've also learned a bit about how you build software (or at least how
you might build software)._

* E.g., Document your procedures so that others can understand them.
  Document first so that you can remember what you are trying to achieve.
* Test, particularly edge cases.
* Check preconditions using husk and kernel
* Pair programming

### Scheme and Racket

_We've grounded most of that learning in the Scheme/Racket programming
language.  Along the way, we've learned a bit about Scheme._

* E.g., Scheme's evaluation strategy: Evaluate the arguments, then
  apply the procedure.
    * Some exceptions: `if`, `and`, `or`, `quote`, `cond`, ...
* E.g., You've learned a bunch of procedures for making simple images,
  such as `square` and `overlay`.
* See the algorithms and data structures above; we learned how they
  work in Racket specifically.
* Functions like `map` and `apply` that work with compound data.
* The syntax: Lots and lots of parens (and then a few extra) + how
  to evaluate + ...
* About 583 different procedures.
* Lots of types: numbers, strings, characters, etc.

### Digital humanities

_We've seen a bit of how computers can serve as a tool in humanistic
inquiry._

* E.g., sentiment analysis
* Visualize data
* Word frequencies
* Exploration of details of the work.
* XML as a way of structuring data
* Regular expressions for searching textual data
* Randomized text generation

### General skills

_I would hope that most Grinnell classes teach you things beyond the
basic disciplinary subject matter._

* E.g., Practice thinking on your feet.
* Don't assume you can solve everything at once; take a break and
  come back to it.  Ask for help.
* Working with other people.
* Cite!
* It's okay to say "I don't know."
* Work and talk in groups.

### And beyond

_When I was about your age, my mother, who was a professor of Psychology,
told me that she planned to conduct a study on how faculty serve as moral
models for their students.  I was a snarky young man, so I said something
like "Mom, don't be silly.  While you serve as a moral model to your
students" (and she did), "most faculty are not moral models"._

_But after a few years of teaching, I started hearing from my students
that the way I approach the class does, in fact, provide some models for
how one might approach the world.  I'm still not sure that I'd call it
"moral modeling", but there are things I hope you take away from the
class that go beyond the subject matter and skills._

* E.g., Support those around you; they are amazing people.
* Get sleep.
* Don't do too much.
* Have fun and care about the people around you.

Pair and Share
--------------

_5 min_

Come up with two or three for each category.  (You don't necessarily
have to approach the categories in order.)

* Problem Solving 
* The core of CS: Algorithms and data structures
* Functional programming
* Program and software design
* Scheme and Racket
* Digital humanities
* General skills
* And beyond

Peer Reviews, Continued
-----------------------

_15 min_

EOCEs
-----

https://grinnell.smartevals.com

Final comments
--------------

_5 min_ (can Sam really say anything that quickly?)

* Uniqueness
* Relationships
* Bye
