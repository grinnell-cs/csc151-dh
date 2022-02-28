---
title: "EBoard 15 (Section 3): Recursion, Continued"
number: 15
section: eboards
held: 2022-02-28
link: true
---
# {{ page.title }}

_Approximate overview_

* CPUs announcement [~5 min]
* Administrative stuff [~5 min]
* Racket stuff [~10 min]
* Questions [~5 min]
* Lab [~60 min]

Administrivia
-------------

### CPUs

* A great program to partner students in intro CS classes with students
  in upper-level classes for advice.  (Extends the non-technical support
  you get from the mentors.)
* Meet as often as you want.

### Introductory notes

* I hope you had a great "compute differently" class period.
* I hope you have a great "work differently" / "learn differently" day
  tomorrow.
* I hope to get Quiz 5 returned this evening.
* I will be attending the SIGCSE Technical Symposium on Computer Science
  Education the rest of this week.  While I have written the labs and
  readings, our mentors will be running classes.
    * I will be available on Teams at unpredictable times.
* Congrats to Mens' Tennis for their victory this weekend.

### Reminders

* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* Evening tutors are available 7--10 p.m. Sunday through Thursday as
  well as 3--5 p.m. on Sunday.
* Mentor sessions are Wednesday, 8--9 p.m., Sunday 4--5 p.m., Monday 8--9 p.m.

### Upcoming work

* Wednesday readings due Tuesday at 10:00 p.m.
* Friday readings due Thursday at 10:00 p.m.
* MP3 due Thursday the 3rd at 10:30 p.m.
* MP4 due Thursday the 3rd at 10:30 p.m.
* Quiz 6 due Sunday: List recursion
* SoLA 2 due Thursday the 10th at 10:30 p.m.

### Upcoming Token-Generating Activities

* MONDAY: Mentor Session (8pm)
* TUESDAY: CS Study Break (8:30pm)
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

### Congratulations! 

You've learned how a few primary procedures are written.

* We did `list-append` (which is normally called `append`), which joins
  two lists together.
* We did a version of `list-remove`.
* You may even have gotten to `reverse`.

Animportant moral: The computer spends a decent amount of work on
each of these.  `list-append`, for example, has to step through
every element of the first list.

### "This file is not readable"

At times, DrRacket saves in what it calls "binary format".  Human beings
cannot read binary format.  Gradescope isn't good at reading it either.
If you get an error about binary format, please use 

> File -> Save Other -> Save Definitions As Text...

### Tracing, Part One

Copy/paste/change is often the best way to do a full trace.

```
(define fun
  (lambda (x xs)
    (if (null? xs) 
        (list x) 
        (cons (car xs) (fun x (cdr xs))))))
```

I'm putting the body on one line to make it easier.

```
(define fun
  (lambda (x xs)
    (if (null? xs) (list x) (cons (car xs) (fun x (cdr xs))))))
```

```
    (fun 'a '(c d b))
--> 
```

### Tracing, Part Two

If you feel like you've understood tracing well enough, it's okay to
skip steps (but not on the SoLA).

### Tracing with cons

Note that `cons` only builds a list when both parameters are complete.
You'll often end up with something like the following in your trace.

```
--> (cons 'a (cons 'b (func ...)))
```

We need to keep the "delayed cons" until we reach the base case, just
as we had the "delayed add" in sum.

Questions
---------

### Reading questions

What does the self check have to do with recursion?

> To write recursive procedures, we need to identify the base case.

Was the reading as simple as it seemed?

> I don't know.  If you can embrace "If the recursive call works ...",
  recursion will be straightforward.  But enough people had trouble with
  the "simple enough for a CS prof" base cases that I guess that it's not
  so simple.

How do we write `drop`?

> _The answer is forthcoming_.

How do we write `tally-value` (e and f on self-check 2)

> _There's something similar in the sample code on the lab.
  We'll also do something similar in exercise 4._

### The real reading questions

_Many of you didn't make things simple enough.  The base case is supposed to be the simplest possible input._

a. Suppose you want to count how many elements are in a list. What’s a list that’s so simple that even a cs prof can figure out how many elements are in the list?

> 

b. And how many elements are in that list?

> 

c. Suppose you want to find the last element of a list. What’s a list that’s so simple that even a cs prof can figure out the last element?

> 

d. How do they get that last element?

> 

e. Suppose we want to count how many times a value, val, appears in a list. What’s a list that’s so simple that even a CS prof can count the number of appearances of val?

> 

f. And how many times does val appear in the list?

> 

g. Suppose we want to take the drop the first `n` elements of a list. What’s a value of `n` that’s so simple that even a cs prof can figure out how to drop `n` elements?

> 

h. And how do they drop those `n` elements?

> 

### Other issues

Can I has extra stickers?

> Sure.

I forgot to do Quiz 5.  Can I make it up on the SoLA?

> Certainly.

Lab
---

### Preparation

* Save early and often!

### During Lab

* Yes, you should fix the code in problems 2 and 3.

### Wrapup

