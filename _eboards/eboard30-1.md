---
title: "EBoard 30 (Section 1): Higher-order recursion"
number: 30
section: eboards
held: 2022-04-18
link: true
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [~30 min]
* Questions [~10 min]
* Lab [~40 min]

Administrivia
-------------

### Introductory notes

* We may have admitted students.
* We will continue to wear masks until the end of the semester.  Enough
  people requested that on the survey that it seems like the best policy.
* Sam's computer remains broken.  Sorry.  
    * No recordings.  (No one requested them.)
    * Traveling all weekend without my laptop is hard!
    * It definitely made grading even more of a chore.
* I did not finish grading SoLA 3 over the weekend.  I should finish 
  today or tomorrow.
* Section 3 is losing the "fill out surveys" competition.

### Reminders

* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* Evening tutors are available 7--10 p.m. Sunday through Thursday as
  well as 3--5 p.m. on Sunday.
* Mentor sessions are generally Sunday 4--5 p.m.  Monday 8--9 p.m.  
  Wednesday, 8--9 p.m.
    * This week: Ask questions about SoLA 3 and XML/SXML/etc.

### Upcoming work

* Tuesday, 10:00 p.m.: Wednesday's reading (Tail recursion)
* Tuesday, 10:30 p.m.: Today's lab
    * Today is "Sam says stop here"
* Tuesday, 10:30 p.m.: Makeup LA local bindings
    * Handles issue with local bindings LA.
* Thursday, April 21, 10:30 p.m.: MP 6
* Quiz Friday: Writing higher-order procedures

### Upcoming Token-Generating Activities

* ???, Notional Machines Interview, 
  <https://calendy.com/songjunt/map-interview>
* TODAY, 2pm: Baseball vs. Monmouth
* Thursday, April 21, 11am, Convocation
* Thursday, April 21, Blood drive
* Thursday, April 21, 3:00 pm, Softball vs. Simpson
* Thursday, April 21, 5:00 pm, Softball vs. Simpson
* Strike-out-cancer stuff 

### Other Upcoming Activities

* Saturday, April 23, 3:45 pm, Water Polo
* Saturday, April 23, 6:00 pm, Water Polo
* Sunday, April 24, 10:15 am, Water Polo (Conference Championship)

### Today's random detour

The wonders of the English language, continued.

Notes from SoLA 3
-----------------

### Style and program design

We are at the point that I will not give you credit for a list recursion
problem if you use `(= (length lst) 1)` to check for a list of length 1.

* Use `(null? (cdr lst))` or `(and (not (null? lst)) (null? (cdr lst)))`

On the next SoLA, I will not give you credit for a problem in which you
put the first cond block on the same line as the `cond` or the guard and
consequent on the same line.

`(section proc <>)` is just a long way to write `proc`.

`(section car <>)` is just a long way to write `car`

Please do not use `display` to return a value.  It doesn't.

```
(define even-exact-integer?
  (lambda (val)
    (if (and (integer? val) (exact? val) (even? val))
        (display #t)
        (display #f))))
(define munge
  (lambda (val)
    (if (even-exact-integer? val)
        (/ val 2)
        (list val))))
```

```
> (even-exact-integer? 2)
#t
> (even-exact-integer? 'a)
#f
> (munge 8)
#t4
> (munge 'a)
#f. . /: contract violation
  expected: number?
  given: 'a
```

Notes:

* That was a bad way to write `even-exact-integer?`.  It violates ZoB.
* The value of `display` is `#<void>`
* The procedure above returns a truish value no matter what the input is.

### Precondition testing

What's wrong with the following?

```
(cond
  [(not (and (>= start 0) (integer? start)))
   (error "start must be a non-negative integer, given" start)]
  ...)
```

> We need to verify that it's an integer before we compare to 0.

```
> (func0 5)
"Time to do the work"
> (func0 3.2)
. . start must be a non-negative integer, given 3.2
> (func0 "a")
. . >=: contract violation
  expected: real?
  given: "a"
```

Something similar is wrong with this.  How would we fix it?

```
(cond
  [(< start 0)
   (error "start must be non-negative, given" start)]
  [(not (integer? start))
   (error "start must be an integer, given" start)]
  ...)
```

> Fix this by checking whether `start` is an integer before we use 
  `start`

What's wrong with this?

```
(define fun-with-csv
  (lambda (str)
    (let* ([parts (string-split str ",")]
           [second-part (cadr parts)])
      (cond
        [(not string? str)
         (error "not a string:" str)]
        [(< (length parts) 2)
         (error "we need at least two values:" str)]
        ...]
```

> We're assuming that `str` is a string before checking it.

> So ... although it's kinda messy, we should put an `if` statement
  before the `let`.

```
(if (not (string? str))
    (error "I want a string!  Why did you give me this garbage?" str)
    (let* ([parts (string-split str ",")]
           [second-part (cadr parts)])
      (cond 
         [(< (length parts) 2)
          (error "we need at least two values:" str)]
         ...)))
``` 

Whoops: We should be sure that we can take the `cadr` before we take the
`cadr.

### Local bindings

There was some confusion on the local bindings LA.  Almost everyone assumed
the input was a string.  But it isn't necessarily.  There is now a nearly 
identical LA due tomorrow night, if you'd like another chance at it.

* Choose good names.
* Avoid repeated work.
* Make sure it doesn't crash (at least that it doesn't crash on anything
  that the original didn't crash on).

### Data abstraction

Many people were a bit confused about the `register!` procedure.  The idea
was that you have one extra field in the structure (vector, hash table,
struct) that you increment each time people register.  So the `register!`
procedure would look something like this.

This is for another day.

Pattern Matching
----------------

Can we do some pattern matching in class?

Basic concept: Like a cond, except our goal is to match the "match
value" against a bunch of patterns.

```
(match val
  [PATTERN1
   CONSEQUENT1]
  [PATTERN2
   CONSEQUENT2]
  ...)
```

* Variables in patterns match anything.
* Constants in patterns match themselves.
* We can build patterns with lists and vectors (and some other things).

_We can refer to the variables in a pattern in the consequent._

```
(define whatever
  (lambda (thing)
    (match thing
      [(cons 23 x)
       "A pair structure that starts with the value 23"]
      [x
       "everything else"])))
```

```
> (whatever '())
"everything else"
> (whatever '(23))
"A pair structure that starts with the value 23"
> (whatever '23)
"everything else"
```

```
(define whatever
  (lambda (thing)
    (match thing
      [(list 'a)
       "a list that starts with a"]
      [(list a)
       "a list with exactly one value"]
      [(list b b)
       "two copies of the same value"]
      [(cons 23 x)
       "A pair structure that starts with the value 23"]
      [x
       "everything else"])))
```

How to determine if a list has exactly one element using `match`

```
(define one-element-list?
  (lambda (val)
    (match val
      [(_)
       #t]
      [_
       #f])))
```

Common usage: Decompose lists for recursion.

```
(define recursive
  (lambda (lst)
    (match lst
      [(list)
       "base"]
      [(cons x xs)
       (cons "recursive" (recursive xs))]
      [_
       (error "Not a list" lst)])))
```

Questions
---------

### MP6 questions

Can you give us more information about XPATH patterns?

> Probably not.  The Web is a wonderful thing.

How do we edit the templates and data files?

> You can use Racket.  Just save as `.xml`.

> You can use TextEdit on the Mac (I think).

Will we get a starter file?

> I suppose.  It won't have much.

### Reading questions

Why `f` and `l` rather than `pred?` and `lst`?

> Different faculty opinions on parameter naming.

How sad does it make you when I write `(equal? (f (car lst)) #t)` rather
than `(f (car lst))`?

> Very.

What's the role of `_`?

> It's a symbol that matches anything, but we ignore it.

### Racket questions

### Other questions

I want to major in CS.  What should I do over the summer?

> You don't need to do anything over the summer related to CS.

> However, if you'd like to, here are some suggestions.

> * Write a piece of software that would be useful to you.  (We call that
    a "personal project".)

> * Find an interesting open-source project and see if you can help out.
    Almost every open-source project needs some translation (i18n) done.
    (I do not have recommendations for particular projects or how to find
    projects.)

> * Learn a new programming language.  I'd recommend Python, since it's
    powerful and we don't teach it.  (CS majors can generally teach themselves
    once they've gone through the first three courses.)
    (I do not have good recommendations on Python courses.)

When will we get the MP2 redo back?

> You should have gotten it back over the weekend?

When will get get other stuff back?

> It depends on the graders.  I'm also going to try to do some of the
  catch up on Tuesday.

When will we get SoLA 3 and the next grade report back?

> Monday night or Tuesday night, depending on how other things go.

Lab
---

### Preparation

* Have the normal start-of-lab discussion.

### During Lab

`index-of-by` -> `index-of-matching`

### Wrapup

* `; SAM SAID I CAN STOP HERE`














