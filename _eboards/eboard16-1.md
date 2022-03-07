---
title: "EBoard 16 (Section 1): Conditionals"
number: 16
section: eboards
held: 2022-03-02
link: true
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [~5 min]
* Racket stuff [~10 min]
* Questions [~5 min]
* Lab [~60 min]

Administrivia
-------------

### Introductory notes

* Sam misses you all.
* The mentors have taken over.
* It's good practice for the navigator to look at the screen or whiteboard
  once in a while to see if there are any notes on the exercise.

### Reminders

* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* Evening tutors are available 7--10 p.m. Sunday through Thursday as
  well as 3--5 p.m. on Sunday.
* Mentor sessions are Wednesday, 8--9 p.m., Sunday 4--5 p.m., Monday 8--9 p.m.

### Upcoming work

* Friday readings due Thursday at 10:00 p.m.
* Today's lab due Thursday at 10:30 p.m.
* MP3 due Thursday the 3rd at 10:30 p.m.
* MP4 due Thursday the 3rd at 10:30 p.m.
* Quiz 6 due Sunday at 4pm: List recursion
* Reading for Monday due Sunday at 10:30 p.m.
* SoLA 2 due Thursday the 10th at 10:30 p.m.

### Upcoming Token-Generating Activities

* WEDNESDAY: Mentor Session (8pm)
* THURSDAY 11 a.m.: Scholars' Convocation: Jennifer Ho.
  [From Public Libraries to American Girl Doll: My Story as a Public Humanities Intellectual](https://www.grinnell.edu/calendar?trumbaEmbed=view%3Devent%26eventid%3D524082345)
* COMING WEEKEND: Hack-a-thon for Social Good (see signs in classroom).
* NEXT THURSDAY 11 a.m., JRC 101: Scholars' Convocation: Greg Duncan.

### Other Upcoming Activities

Sample Quiz 6
-------------

_Design and write recursive functions over lists._

Write a *recursive* procedure, `(increasing-length? words)`, that takes
a list of strings as input and ensures that every string is at least as
long as the previous string. If so, it returns true.  If not, it returns
false.

Here's a partial test suite.

```drracket
(check-equal? (increasing-length '()) 
              #t
              "No strings: They are in increasing length")
(check-equal? (increasing-length? '("hello"))
              #t
              "A singleton")
(check-equal? (increasing-length? '("a" "b" "cd" "efg" "hij" "klmn"))
              #t
              "Some duplicate-length words")
(check-equal? (increasing-length? '("a" "bb" "ccc" "dddd" "eee"))
              #f
              "Okay until the end.")
```

Racket/Lab Stuff
----------------

### Common patterns of list recursion

You've seen a few common patterns of list recursion.

* How to find an extreme value in a list.
* How to tally kinds of values in a list.
* How to select kinds of values in a list.

It's probably helpful to have those patterns written down somewhere.
(Hint hint hint.)

### Testing

_Notes from Sam's observations on Monday_.

Start with straightforward tests.  Edge cases should be edgy primarily
in that they are at the "edges" of possible input (e.g., the value of
interest is at the front or end of the list).

* `(my-length '(      ))` is no different than `(my-length '())`
* `(my-length '("hello" (list 1 2)))` should be no different than 
  `(my-length '(me 2))` 
* It can be helpful to use other procedures in your tests.
  `(test-equal? "long list" (my-length (make-list 1000 'a)) 1000)`

### Writing `tally-odd`

So many options!

```
(define tally-odd-a
  (lambda (numbers)
    (cond
      [(null? numbers)
       0]
      [(odd? (car numbers))
       (+ 1 (tally-odd-a (cdr numbers)))]
      [else
       (tally-odd-a (cdr numbers))])))

(define tally-odd-b
  (lambda (numbers)
    (cond
      [(null? numbers)
       0]
      [(even? (car numbers))
       (tally-odd-b (cdr numbers))]
      [else
       (+ 1 (tally-odd-b (cdr numbers)))])))

(define tally-odd-c
  (lambda (numbers)
    (if (null? numbers)
        0
        (if (odd? (car numbers))
            (+ 1 (tally-odd-c (cdr numbers)))
            (tally-odd-c (cdr numbers))))))

(define tally-odd-d
  (lambda (numbers)
    (if (null? numbers)
        0
        (+ (if (odd? (car numbers)) 1 0)
           (tally-odd-d (cdr numbers))))))

(define tally-odd-e
  (lambda (numbers)
    (if (null? numbers)
        0
        (+ (abs (remainder (car numbers) 2))
           (tally-odd-e (cdr numbers))))))

(define tally-odd-f
  (lambda (numbers)
    (if (null? numbers)
        0
        (+ (modulo (car numbers) 2)
           (tally-odd-f (cdr numbers))))))
```

Questions
---------

### Reading questions

### Other issues

Lab
---

### Preparation

### During Lab

### Wrapup

