---
title: "EBoard 12 (Section 1): Recursion"
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
    * Review algorithm design
    * Recursion
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

* MONDAY: Mentor Session
* WEDNESDAY: Mentor Session
* THURSDAY, 11am, JRC 101, "Physics Is More Than Problem-solving: Building 
  Inclusivity and Belonging by Practicing Professionalism".  Prof Marty Baylor 
  of Carleton College.
* ANYTIME: Visit the current exhibit in the Grinnell Art Museum.
  (At least 15 min.)
* SATURDAY: Tennis match in the Field House in the Bear

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
```

Example

```
> (rex-matches? (rex-repeat letter) "cAmEL")
#t
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

Why do we need `(require csc151/rex)`?

> The normal regular expression syntax is difficult for human beings
  (and does not discourage composition).

> `(regexp-match? #px"[a-zA-Z]*" "cAMeL")`

What's going on with the second lambda in the second `rex-match-strings`?

> We need a procedure to use with `filter`.  There isn't a built-in
  "match this particlar regular expression", so we write one.
  (We build procedures with `o`, `section`, or `lambda`.

Can we use that technique elsewhere, such as on MP3?

> Yes, you will often need to build an extra procedure when using `map`
  or `filter` or `tally` or `reduce` or `apply`.

Can I make a named helper function instead?

> Yes, but that's sometimes hard.

Algorithms, Revisited
---------------------

TPS:

_What are the core building blocks of algorithms?_

_How do we achieve them in Scheme?_

### Core building blocks

* Basic values (and their types) and the operations on those values
* Subroutines (procedures, etc.), often used for decomposition
* Conditionals, which spit out Boolean values and which let you 
  choose among different options (e.g., subroutine) to use.
    * Predicates are the things that spit out true and false.
* Repetition.
* Naming (variables, parameters)
* Sequencing (we want to do operations in a particular order)

Other cool building blocks

* Comments: A way to add information for the human reader
* Pair programming: A way to build algorithms better.

### Comments

* Start a line with a semicolon.
* You can also comment a whole block with `#|` and `|#`

### Basic values and the operations on those values

* Numbers (exact and inexact, complex, real, rational, integer):  Standard 
  mathematical operations (`+`, `-`, `*`, `/`).  predicates (e.g., 
  `integer?`), conversion (e.g., `exact->inexact`, `floor`), etc.
* Strings: `string-length`, `string->list`
* Characters: `integer->char`, `char->integer`, 
* Lists: `length`
* There are also libraries that help provide these things.
* Images: combine images (`above`, `beside`)
* Booleans: #t #f (truish), operations are `and`, `or`
* Regular expressions: `rex-char-range`
* Symbols: `equal?` (but we use them in other situations)

### Subroutines

* We build them with `(define NAME (lambda (PARMS) BODY))`
* `section`
* `o` or `compose`

### Naming

* `(define NAME VALUE)`
* Parameters also provide a kind of naming

### Sequencing

* Nesting: Most expressions are evaluated inside-out
* `reduce-left` and `reduce-right` sequence things in reduction.
* Compose creates a procedure that applies a sequence of operations
  in order.
* When we type expressions in the interactions pane, Racket evalauates
  them in order.

### Conditionals

* `if`, usually used for a choice between two things
  `(if TEST CONSEQUENT ALTERNATE)`
* `cond`, which is used for cases in which you want to do a sequence
  of tests and stop when the first one holds.
* `when`, which takes the form `(when TEST EXP1 ... EXPN)`, evaluates
  the test.  If it's truish, evaluates all of the expressions, in order
  and returns the value of the last one.

### Repetition

* `reduce`, which repeatedly applies a procedure to pairs from a list
* `rex-repeat`
* Other ways to work with all of the elements in a list, like `tally`
  or `map` or `filter`.
* Recursion! (which we're officially learning today)
    * The most general form of repetition available in Scheme/Racket

About Recursion
---------------

* We know that solve a complex problem, we should decompose the problem
  into smaller problems.
* Recursion says "To solve a complex problem, solve a smaller version of
  the same problem, and then use that to solve the bigger problem."
* To write a recursive procedure, we need to
    * Determine how to "simplify" an input (for lists, remove the first
      value)
    * Determine how to use the solution to the smaller problem to solve
      the bigger problem
    * Identify when the problem is simple enough we can solve it directly.
* The weird part of recursion is that we are solving the "smaller" problem
  with exactly the same solution as the smaller problem; we have to assume
  we've written something we haven't written yet.
    * The magic recursion fairy makes it work.

Some Examples
-------------

_We will design these in English and perhaps then convert them to Scheme._

_These examples will use volunteers (or voluntolds)._

Congratulations, you are employees of MicroGoogazonBook.  We have some
tasks for you.  Fortunately, you can delegate most of the task.  We'll
explore how to solve problems with delegation.

### Counting a stack of cards.

* If I receive zero or one cards, I can count them.
* Otherwise, I hand all but the first to your assistant, make them count
  them, and then add 1 to the number they give me.

### Alphabetically first

* If I receive zero cards something went wrong
* If I receive one card return that card
* Otherwise hand all but one of those cards to your neighbor
     * Ask for the alphabetically first
     * Compare to the card you have
     * Return the alphabetically first of those two

Recursive algorithms require

* Determine if the input is simple enough
    * For counting: Zero or one, return zero or one
    * For alphabetically: When there's only one card, return that card
* Simplify the input
    * For counting: Remove one card
    * For alphabetically first: Remove one card
* Use the solved smaller problem to solve the bigger problem
    * For counting: Add 1
    * For alphabetically first: Compare two cards

```
(define count-cards
  (lambda (cards)
    (if (null? cards)
        0
        (+ (count-cards (cdr cards)) 1))))
```

### Ordering 

_No, not with GrubHub or Uber Eats; that's unethical._

* Simple enough: If we have only one card, it's already in order
* Simplify: Pass all but one card to your assistant
* Combine: Given a set of cards in alphabetical order and the one
  card you kept, compare to see where it belongs.

```
(define sort-cards
  (lambda (cards)
    (if (null? (cdr cards))
        cards
        (insert-card (car cards) (sort-cards (cdr cards))))))
```

Whoops!  We need to write `(insert-card card sorted-cards)`

```
(define insert-card
  (lambda (card sorted-cards)
    (if ???
        ???
        ???)))
```
