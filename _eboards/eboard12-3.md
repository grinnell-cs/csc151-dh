---
title: "EBoard 12 (Section 3): Recursion"
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

* TODAY: Mentor Session
* WEDNESDAY: Mentor Session
* THURSDAY, 11am, JRC 101, "Physics Is More Than Problem-solving: Building 
  Inclusivity and Belonging by Practicing Professionalism".  Prof Marty Baylor 
  of Carleton College.
* ANYTIME: Visit the current exhibit in the Grinnell Art Museum.
  (At least 15 min.)

### Other Upcoming Activities

* SATURDAY: Tennis in the Field House

Sample Quiz Question
--------------------

_Not written yet; forthcoming._

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
; V3 INCORRECT
; One issue: The two sequences are separate, so this will include some
;   things that are not letters.
; Another issue: Uppercase letters come before lowercase letters in
;   unicode, so this is the empty range
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

How much time should we be spending on the mini projects?

> My goal is four hours. 

> I assume you ask questions early.

> When you hit four hours, let me know how far you've gotten and, if
  possible, where you've spent the time.

> "I didn't know what procedures to use."

MP2 took me ten to twelve hours.

> I'll need to figure out what to cut.

> Ah, it's the bar chart.

Algorithms, Revisited
---------------------

TPS:

_What are the core building blocks of algorithms?_

_How do we achieve them in Scheme?_

### Core pieces of algorithms

* Basic values and the operations on those values
* Conditionals - How to make choices
* Naming - We need to name values
* Procedures / Subroutines / Functions - Named algorithms with parameters
* Repetition - We need to be able to do something again and again and again
* Sequencing - It's sometimes important to control what order you do things

Extra stuff

* Data structures; ways to organize data
* Input/Output

### Basic values and the operations on those values

* Numbers (exact and inexact, complex, real, rational, integer):  Standard 
  mathematical operations (`+`, `-`, `*`, `/`).  predicates (e.g., 
  `integer?`), conversion (e.g., `exact->inexact`, `floor`), etc.
* Booleans: `#t`, `#f`, operations include `not`
* Strings: `string->list`, `string-split`, `string-length`, `string-append`
* Lists: `list`, `make-list`, `list->string`, `map`, `list-ref`, 
  `take`, `drop`, `length`, `apply`, `reduce`
* Characters: `char->integer`, `integer->char`, `char?`
* Files: `file->string`, `file->lines`, `string->file`, ...
* Images: `rectangle`, `above`
* Regular expressions: `rex-char-range`
* Symbols: `equal?` (Or make them with quote)
* Libraries generally give us these things

### Conditionals in Racket

* `(cond [GUARD1 CONSEQUENT1] [GUARD2 CONSEQUENT2] ... [ELSE ALTERNATE])`
     * Evaluate each guard in sequence
     * When one holds, evaluate the corresponding consequent and return
       its value.
     * If no guards hold, evaluate and return the alternate.
* `(if TEST WHAT-TO-DO-IF-TEST-IS-TRUE WHAT-TO-DO-IF-TEST-IS-FALSE)`
    * `(if TEST CONSEQUENT ALTERNATE)`
    * Evaluate the test
    * If the test is truish, evaluate the consequent
    * If the test is false, evaluate the alternate
* `(when TEST CONSEQUENT1 CONSEQUENT2 ... CONSEQUENTn)`
    * Evaluate the test
    * If the test is truish, evaluate all the consequents in sequence
    * Return the value of the last one
    * If the test is #f, returns nothing
* `(and ...)`
* `(or ...)`

### Naming

* Custom: Choose names that indicate what role things serve (what
  procedures do)
* `(define NAME EXPRESSION)`
* `lambda` names the parameters
* Files act as names of a sort.

### Subroutines (procedures)

* `(define NAME (lambda (PARAMS) BODY))`
* Rename an existing procedure `(define add +)`
* `section`
* `o`

Sorry

* `um` - the universal maker

### Sequencing

* Conditionals in general involve this kind of sequencing.
    * `if` and `and` involve sequencing.  The `if` runs the test first,
      the `and` evaluates arguments in turn until it hits false.
* Standard Racket model: Usually evaluate expressions inside out.
  And the parentheses give us the nesting to help us understand
  what is inside something else.
    * Evaluate parameters before procedures
* Compose builds a procedure that applies procedures from right to left.
* `reduce` doesn't give you control over sequencing, but `reduce-left`
  and `reduce-right` do.
* Racket reads the file (and the interactions pane) from top to bottom.
* Anti-sequencing: Quote doesn't evaluate it

### Repetition

* map repeatedly applies a procedure to each element of a list
* make-list builds a list (a kind of repetition)
* filter goes through the list value by value, checking the predicate
  on each
* Recursion is one model of repetition
* We can repeat things by hand.
* We repeatedly try to annoy Sam.

About Recursion
---------------

* The most general form of repetition in Scheme (and in most languages)
* Builds on an idea we already know: Break a large problem down into
  smaller parts.
* In recursion, we break the input into smaller parts
* Traditionally, when we write a recursive procedure, we think about
  three things (not necessarily in this order).
    * How do I make a big problem smaller?
    * When is the problem small enough that I can solve it directly?
    * Suppose I solve the smaller problem, how does that help me solve
      the bigger problem?
* Key idea: You will use *the same process* to solve the smaller problem.
  This is weird because you're assuming you've successfully written
  your procedure (and that it works) before you finish writing your
  procedure.
    * The Magic Recursion Fairy ensures that it works.

Some Examples
-------------

_We will design these in English and perhaps then convert them to Scheme._

_These examples will use volunteers (or voluntolds)._

Congratulations, you are employees of MicroGoogazonBook.  We have some
tasks for you.  Fortunately, you can delegate most of the task.  We'll
explore how to solve problems with delegation.

### Counting

```
To count the number of cards
  If I have zero or one, just say the same number
Otherwise
  Remove one card
  Ask your assistant to count the remaining cards
  Add one to the number they give you
```

### Alphabetically first

```
To find the alphabetically first card

If I have zero cards there is no such card 
If I have one card return that card
If I have more than one card
  Remove one card
  Ask your assistant to find the alphabetically first of the remaining cards
  ...
```

```
(define first-of-two
  (lambda (x y)
    (if (char<=? x y)
        x
        y)))

(define alphabetically-first
  (lambda (lst)
    (if (null? (cdr lst))
        (car lst)
        (first-of-two (alphabetically-first (cdr lst)) (car lst)))))
```

### Ordering 

_No, not with GrubHub or Uber Eats; that's unethical._
