---
title: "EBoard 40 (Section 3): Wrapup"
number: 40
section: eboards
held: 2022-05-13
link: true
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [~10 min]
* Peer Feedback [~15 min]
* "The Subject Matter(s) of the Course" [~20 min]
* Peer Feedback, Continued [~15 min]
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

And everything else?

> My goal is to grade that by the end of Monday.  You'll then get a
  grade report with a prospective grade on it.

Peer Feedback
------------

_15 min_

Format: Write the name on the blank side of the card and something positive
about the person on the other.  

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

Your names are on the board.  Provide feedback to each of the five names
that come after you.

If one of your names has an asterisk, please go a bit further because
they won't be writing cards (and we'd like the next few people to have
at least five cards).  You should still provide feedback to the person
with the asterisk.

If you don't know someone in your list, you can skip over them.

If you have extra time, you can write on more cards (choose whoever you want).  

You can also write cards about the mentors, if you wish.

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
* We learn better in groups than alone.  Having people around you to
  help solve problems is good.
* We should test our solutions to make sure that they work well/correctly.
* Adapt things you know to solve problems.
* You won't be able to do everything.  Ask for help!
* (We all need to fail sometime.)

### The core of CS: Algorithms and data structures

_CS is the study of algorithms and data structures; ways to manipulate
data and ways to organize data._

* E.g., We've learned about the "List" data structure, which organizes
  information in sequential order and which you can visit element by
  element using `car` and `cdr`.  We can also process lists as a whole
  using `reduce` or `map`.
* E.g., We've learned the Dale-Chall algorithm for assessing the readability
  of text.
* Multiple data structures: Hash tables, vectors, trees, files, etc.
    * Each has advantages and disadvantages
* Design strategy: Decompose/use helper functions.
* We should analyze the efficiency of algorithms.

### Functional programming

_CSC 151 uses an approach that we term "functional programming" and that
is somewhat distinct from other approaches._

* E.g., "Functions are first-class values": They can be parameters to
  other functions, they can be returned by other functions.  For
  example, `o` is a function that takes two unary functions as
  parameters and returns a new function that applies the two in sequence.
* Recursion as a primary form of repetition!
* Structures should be immutable.  Values don't change.
* Name things locally to prevent global effects.
* Functions can be anonymous: Use `lambda` or `section` or `o` to build
  one-time-use functions (e.g., for use map).

### Program and software design

_We've also learned a bit about how you build software (or at least how
you might build software)._

* E.g., Document your procedures so that others can understand them.
  Document before you write so that you can remember what you are
  supposed to be writing.
* Write tests.  (Write tests first?)
* Make your code readable.
    * Clear formatting helps you read code (and find errors).
    * Clear naming helps.  (`helper1` is not very helpful.)
* Include comments within the function.
* Decompose!
* Pair programming.
* Check preconditions with husk and kernel design.

### Scheme and Racket

_We've grounded most of that learning in the Scheme/Racket programming
language.  Along the way, we've learned a bit about Scheme._

* E.g., Scheme's evaluation strategy: Evaluate the arguments, then
  apply the procedure.
    * Some exceptions: `if`, `and`, `or`, `quote`, `cond`, ...
* E.g., You've learned a bunch of procedures for making simple images,
  such as `square` and `overlay`.
* Lots of parens and brackets!  But where you put them matters.
* Regular expressions
* Structs
* `map`, `apply`, and `reduce`
* 584 procedures!
* How to write procedures, including basic ones like `map`.
* Primitive data types: strings, characters, numbers, symbols, images,
* The benefits of an interactive IDE.  

### Digital humanities

_We've seen a bit of how computers can serve as a tool in humanistic
inquiry._

* E.g., sentiment analysis
* Regular expressions as a technique for searching texts
* Web sites
* You can have fun building digital-humanities-adjacent projects.
* Decomposition fits everywhere!
* Markup languages like XML (ways to structure textual data).
* Various mechanisms for analyzing textual data (e.g., counting things)
* Ways to generate text

### General skills

_I would hope that most Grinnell classes teach you things beyond the
basic disciplinary subject matter._

* E.g., Practice thinking on your feet.
* It's okay to say "I don't know" or "I'm not sure"
* Cite.  In many cases, it's more important that you cite than that you
  get the particular form correct.
* Tracing: Think through the steps in how something is done.
* Teamwork.
* Think logically and unambiguously.
* Time management.  What to do when you have more work than you can
  physically do.  When it's okay to say "I need to stop now."  
    * Give up when you have to.
* Be prepared and accountable.  (E.g., do the readings.)
* Organize your references.  (Use flash cards for notes.)
* Mastery learning: It's important what you learn, not when.
    * You will improve!

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
* Have fun.  It's important to enjoy yourself.
* It's okay to make fun of your professor.  (You should be more careful
  when making fun of your students.)

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

Peer Feedback, Continued
------------------------

_15 min_

EOCEs
-----

_15 min_

<https://grinnell.smartevals.com>

Final comments
--------------

_5 min_ (can Sam really say anything that quickly?)

* Uniqueness
* Relationships
* Bye

_Please bring blank white cards to the back of the room._

_Please bring filled out white cards to the recycle bin._
