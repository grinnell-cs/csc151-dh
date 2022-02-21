---
title: "EBoard 12 (Section 2): Recursion"
number: 12
section: eboards
held: 2022-02-21
link: true
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [~5 min]
* Racket stuff [~5 min]
* Questions [~5 min]
* Discussion [~60 min]
    * Review: Algorithm components
    * Short intro to recursion
    * Examples

Administrivia
-------------

### Introductory notes

* Today is a lecture/discussion day.  No computers necessary.
* It's great that many of you are using whiteboards to solve problems.
  But please make sure to erase the board after you are done in a room.
* I have not gotten quizzes graded yet, but will soon.
* You may also get broader "grade status" reports this evening.
* Please enter token activities on the Tokens "assignment" on Gradescope.

### Reminders

* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* Evening tutors are available 7--10 p.m. Sunday through Thursday as
  well as 3--5 p.m. on Sunday.
* Mentor sessions are Wednesday, 8--9 p.m., Sunday 4--5 p.m., Monday 8--9 p.m.

### Upcoming work

* No reading for Wednesday!  We'll be doing a recursion lab.
* No reading for Friday!  We have a "compute differently" day.
* No lab writeup for today.
* MP3 due Thursday at 10:30 p.m.
* Quiz 5 due Sunday: Regular expressions
* Mini-Project 2 redo due Sunday the 27th at 10:30 p.m. (sooner is better)

### Upcoming Token-Generating Activities

* TODAY: Mentor Session
* WEDNESDAY: Mentor Session
* THURSDAY, 11am, JRC 101, "Physics Is More Than Problem-solving: Building 
  Inclusivity and Belonging by Practicing Professionalism".  Prof Marty Baylor 
  of Carleton College.
* ANYTIME: Visit the current exhibit in the Grinnell Art Museum.
  (At least 15 min.)
* SATURDAY: Tennis in the Field House

### Other Upcoming Activities

Sample Quiz Question
--------------------

_Forthcoming._

Racket/Lab Stuff
----------------

### Order matters (in rexes and elsewhere)

```
; v1
(rex-any-of (rex-repeat (rex-string " "))
            (rex-repeat (rex-string "\n"))
            (rex-repeat (rex-string "\t")))

; v2
(rex-repeat (rex-any-of (rex-string " ")
                        (rex-string "\n"))
                        (rex-string "\t"))

; v3
(rex-repeat (rex-char-set " \n\t"))
```

### Multiple approaches

```
; V1
(define letter (rex-char-set "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"))
; V2
(define letter (rex-any-of (rex-char-range #\a #\z)
                           (rex-char-range #\A #\Z)))

; NOT THE FOLLOWING; they are two separate ranges
; Also: Capitals come before lowercase, so this is an empty range.
(define letter (rex-char-range #\a #\Z))
```

### Exercise 3

```
; The basic solution
(define rex-match-strings
  (lambda (rex strings)
    (filter (section rex-matches? rex <>) strings)))

(define rex-match-strings
  (lambda (rex strings)
    (filter (lambda (str) (rex-matches? rex str))
            strings)))
```

Questions
---------

How would we write `rex-match-strings` if we wanted a single string
rather than a list of strings?

> `rex-find-matches` is supposed to do that.

```
> (rex-find-matches (rex-repeat letter) "Now is the time for all3231432 good people to come to the aid of their college.")
'("Now"
  "is"
  "the"
  "time"
  "for"
  "all"
  "good"
  "people"
  "to"
  "come"
  "to"
  "the"
  "aid"
  "of"
  "their"
  "college")
```

> If `rex-find-matches` didn't exist, we could write something like

```
(define rex-match-words
  (lambda (rex str)
    (filter (lambda (s) (rex-matches? rex s))
            (string-split str))))
```

Can section have multiple diamonds?

> Yes.  For example, here's "join with a space":
  `(section string-append <> " " <>)`

What happens if you give it two diamonds and then apply it to one input?

> Boom.

Can diamonds appear in subexpressions, as in `(section + (- 2 <>) 3)`?

> No.

Algorithms, Revisited
---------------------

TPS:

_What are the core building blocks of algorithms?_

_How do we achieve them in Scheme?_

### Core building blocks

* Basic values and the operations on those values
* Input and output
* User-defined subroutines (also known as procedures, function, operations)
* Sequencing: The order in which we do computations is (sometimes) important;
  we should be able to tell the computer that order.
* Conditional: Allow to you to make choices (if you can't do this, do
  this instead)
    * Example, using guards
* Repetition: Doing the same operation again and again and again (multiple
  times).
* Naming: We want to be able to associate names with values for clarity.

Other great answers

* Documentation; Explain to humans what your code is supposed to do

### Basic values and the operations on those values

* Numbers (exact and inexact, complex, real, rational, integer):  Standard 
  mathematical operations (`+`, `-`, `*`, `/`).  predicates (e.g., 
  `integer?`), conversion (e.g., `exact->inexact`, `floor`), etc.
* Strings (which we put in quotation marks), `string->list`, `string-length`,
  `string-split`
* Lists: Use `map` to apply procedures to them; make them with `list` or
  `make-list`, `length`, `take`, `drop`, `list-ref`, `index-of`
* Symbols: `equal?` (and use them in certain specified situations, like
  building images)
* Images
* Characters

### Naming

* Custom: lowercase letters, separated with dashes
* Appropriate: Meaningful
* `(define NAME EXPRESSION)`
* We use strings to name files.
* Parameters serve as a name within each procedure.

### Procedures/Subroutines

* `(define NAME (lambda (PARAMS) BODY))`
    * Don't forget the parens
* We can also define procedures with `section` and `o` (composition)
* And that's about it right now.

### Conditionals (making choices)

* `(if TEST TRUE-PART FALSE-PART)`  (Sam uses "CONSEQUENT" and "ALTERNATE")
* `(cond [GUARD1 CONSEQUENT1] [GUARD2 CONSEQUENT2] ... [else ALTERNATE])`
    * If is "either or", whereas cond gives you more choices (the first
      one for which the guard holds)

### Sequencing

* We do a kind of sequencing in defining procedures before we use them.
* In Scheme, nesting is the most common form of sequencing: In most cases,
  we do the inner expressions before the outer expressions.  Parens help
  with the nesting.
* In `cond` statements, we evaluate the guards in order, stopping at the
  first one that holds.
* There are also a few other things that change the normal order, such 
  as `if`
* Racket evaluates the expressions you type in the interactions pane in order.
* Composition gives you an ordering of procedure application (right to left)
* `reduce-left` and `reduce-right` give an ordering for applying the
  reduction procedure.

### Repetition

* `reduce` repeatedly applies a two-parameter procedure until we're down
  to a single value.
* `map` applies the same function to each element of a list.
* Recursion is the most general form of repetition in Racket.

Maybe

* `apply` 
* `make-list` builds a list of a certain size, which we might think of
  as repetition.

About Recursion
---------------

* Perhaps the most general form of repetition
* Works with something we know already: Break problems down into smaller parts.
* In recursion, we break down things a bit differently; we look at a
  simpler/smaller input
* Basic techniques/steps
    * How do I make the input "smaller"?
    * When is an input small enough that I can solve the problem immediately?
    * Suppose I solve the smaller problem: How does that help me solve
      the bigger problem?
* The weird thing about recursion is that we solve the smaller problem with
  the same procedure.  (We expect that we've written a procedure successfully
  before we finish writing the procedure.)
    * The magic recursion fairy makes it all work.

Some Examples
-------------

_We will design these in English and perhaps then convert them to Scheme._

_These examples will use volunteers (or voluntolds)._

Congratulations, you are employees of MicroGoogazonBook.  We have some
tasks for you.  Fortunately, you can delegate most of the task.  We'll
explore how to solve problems with delegation.

### Counting

```
To count a stack of cards

* If you receive zero cards, say "zero"
* Otherwise
    * Remove one card
    * Ask your assistant to count the remaining cards
    * Add one to the number they gave you
```

### Alphabetically first

```
To find the alphabeticlly first letter in a nonempty list of letters

* If you receive zero cards, crash and burn; the algorithm requires a nonempty list
* If you receive one letter, give back that one letter
* Otherwise
    * Remove one card
    * Ask you assistant to find the alphabetically first letter
    * And then compare them and return the alphabetically firstof the two
```

```
(define first-of-two
  (lambda (ch1 ch2)
    (if (char<=? ch1 ch2)
        ch1
        ch2)))

(define alphabetically-first
  (lambda (chars)
    (if (null? (cdr chars))
        (car chars)
        (first-of-two (car chars)
                      (alphabetically-first (cdr chars))))))
```

### Ordering 

_No, not with GrubHub or Uber Eats; that's unethical._

Given a list of cards, put them in alphabetical order.

* If you have a list of one card, return that one card
* Otherwise
    * Remove one card
    * Ask your assistant to put the remaining cards in alphabetical order
    * And then ...
