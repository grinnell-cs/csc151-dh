---
title: "EBoard 31 (Section 3): Tail recursion"
number: 31
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

* We may have admitted students (those are mostly on Friday).
* SoLA 3 and grades should have been returned.

### Reminders

* Sam's computer remains broken.
* We will continue to wear masks until the end of the semester.  Enough
  people requested that on the survey that it seems like the best policy.
* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* Evening tutors are available 7--10 p.m. Sunday through Thursday as
  well as 3--5 p.m. on Sunday.
* Mentor sessions are generally Sunday 4--5 p.m.  Monday 8--9 p.m.  
  Wednesday, 8--9 p.m.
    * This week: Ask questions about SoLA 3 and XML/SXML/etc.

### Upcoming work

* Thursday, 10:00 p.m.: Friday's reading (Projects)
* Thursday, 10:30 p.m.: Today's lab
    * Today is "Sam says stop here"
* Thursday, April 21, 10:30 p.m.: MP 6
* Sunday, April 24, 4:00 p.m.: Quiz 11

### Upcoming Token-Generating Activities

* Thursday, April 21, 11am, Convocation
* Thursday, April 21, 3:00 pm, Softball vs. Simpson
* Thursday, April 21, 5:00 pm, Softball vs. Simpson
* Thursday, April 21, Blood drive
* Saturday, April 23, 10 am, Dick Young Classic
* Saturday, April 23, Noon, Baseball vs. Illinois College
* Saturday, April 23, 1pm, Softball vs. Lawrence
* Saturday, April 23, 2:30 , Baseball vs. Illinois College
* Saturday, April 23, 3pm, Softball vs. Lawrence
* Saturday, April 23, 3:45 pm, Water Polo
* Saturday, April 23, 6:00 pm, Water Polo
* Sunday, April 24, 10:15 am, Water Polo (Conference Championship)
* Strike-out-cancer stuff 

### Other Upcoming Activities

Sample quiz question
--------------------

Notes from SoLA 3
-----------------

### Data abstraction

Many people were a bit confused about the `register!` procedure.  The idea
was that you have one extra field in the structure (vector, hash table,
struct) that you increment each time people register.  

Questions
---------

### MP6 questions

### Hop questions

Could you go over `right-section`?

> `right-section` is supposed to take a two-parameter procedure (`binproc`)
  and a single value (`right`) as parameters and return _a new procedure_
  that takes one value (`left`) as a parameter and applies `binproc`
  to `left` and `right`.

> Here's how I usually write it.

> ```
(define right-section
  (lambda (binproc right)
    (lambda (left)
      (binproc left right))))
```

> That inner `lambda` suggests that we're returning a procedure.

> If you think about something like `(define sub2 (right-section - 2))`,
  we substitute `-` for `binproc` and `2` for `right`, giving us ...

> ```
(define sub2
  (lambda (left)
    (- left 2)))
```

> You might also find this easier to understand.

```
(define right-section
  (lambda (binproc right)
    (let ([newproc (lambda (left)
                     (binproc left right))])
      newproc)))
```

Could you go over `reduce-right`?

> Base case: Singleton.  Return the value.

> Recursive case: Let's suppose we successfully reduce the right.  What's
  left to do?

> For example, consider `(reduce-right + '(1 2 3 4 5))`

> Our recursive call is `(reduce-right + '(2 3 4 5))`.  If that succeds,
  it returns 14.

> We still have to add 1.

> So `(reduce-right + '(1 2 3 4 5))` -> `(+ 1 (reduce-right + '(2 3 4 5)))`

> Generalizing, we want `(op (car lst) (reduce-right op (cdr lst)))`.

> Putting it all together ...

How do I define `map` in terms of `fold`?

> It's easiest to use `foldr`.

How do I define `filter` in terms of `fold`?

> Once again, it's easier to use `foldr`.

### Racket questions

### Reading questions

### Other questions

Lab
---

### Preparation

* Have the normal start-of-lab discussion.

### During Lab

### Wrapup

* `; SAM SAID I CAN STOP HERE`

