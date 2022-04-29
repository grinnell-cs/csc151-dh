---
title: "EBoard 34 (Section 3): Trees"
number: 34
section: eboards
held: 2022-04-29
link: true
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [~10 min]
* Questions [~10 min]
* Lab [~60 min]

Administrivia
-------------

### Introductory notes

* I hope you had a great work differently day.
* We may have admitted students today.
* Sam's computer remains broken.  I'm told I may get it back late next
  week.
* Our graders are working hard on catching up.  We had a few overwhelmed
  graders; others are taking on their responsibilities.
* Slight rearrangement in schedule; Monday is a project work day; Wednesday
  is tree recursion.

### Reminders

* We will continue to wear masks until the end of the semester.  Enough
  people requested that on the survey that it seems like the best policy.
* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* Evening tutors are available 7--10 p.m. Sunday through Thursday as
  well as 3--5 p.m. on Sunday.
* Mentor sessions are generally Sunday 4--5 p.m.  Monday 8--9 p.m.  
  Wednesday, 8--9 p.m.

### Friday PSA


### Upcoming work

* Sunday, May 1, 4:00 p.m.: Quiz (Tail Recursion)
* Sunday, May 1, 10:30 p.m.: Lab writeup from today
    * "Sam said I can stop here."
* Tuesday, May 3, 10:00 p.m.: Reading for Monday (Tree recursion)
* Thursday, May 5, 10:30 p.m.: MP 7
    * There will be a presentation next week.

### Upcoming Token-Generating Activities

* Saturday @ 2pm: GSO (Sebring-Lewis)

### Other Upcoming Activities

* Sunday @ 1pm: Softball (Diamond)
* Sunday @ 3pm: Softball (Diamond)

Lab updates
-----------

What was wrong with `select-numbers`?

```
;;; (select-numbers values) -> listof number?
;;;   values : list?
;;; Selects all the numbers in values
(define select-numbers
  (lambda (values)
    (letrec ([helper
              (lambda (nums-so-far remaining)
                ; (displayln (list 'helper nums-so-far remaining))
                (cond
                 [(null? remaining)
                  nums-so-far]
                 [(not (number? (car remaining)))
                  (helper nums-so-far
                          (cdr remaining))]
                 [else
                  (helper (cons (car remaining) nums-so-far)
                          (cdr remaining))]))])
      (helper null values))))
```

> Although it selects numbers, it selects them in the wrong order.

How would you have liked us to rewrite `select-numbers`?

> Option 1: Base case in `select-numbers` becomes `(reverse nums-so-far)`.

> Option 2: Call is `(reverse (helper null values))`.

> Option 3: Call is `(helper null (reverse values))`.

Tail recursion seems cool. Why would we ever use direct recursion?

> There are some problems that are very difficult to solve using
  tail recursion, but moderately straightforward using direct recursion.

> The tree recursion problems we're doing on Wednesday will likely
  involve direct recursion.  (Helper recursion with trees is hard.)

What's the relationship between helper recursion and tail recursion?

> With helper recursion, we often write an extra procedure (perhaps
  with an extra parameter) to do the recursion.

> With tail recursion, we ensure that nothing is done after a recursive
  call.

> Tail recursion often involves helper recursion; that is, we often
  want to write a helper procedure that takes an extra parameter.

> Tail recursion does not always involve helper recursion.  For example,
  `last` is tail recursive.

> ```
(define last
  (lambda (lst)
    (if (null? (cdr lst))
        (car lst)
        (last (cdr lst)))))
```

> Helper recursion need not be tail recursive.  For example, we often
  do helper recursion with husk and kernel structures.

Questions
---------

### MP7 questions

### Racket questions

### Reading questions

Can sibling nodes in a tree share descendents?

> Not normally.  There are other structures (graphs, networks) that permit
  such sharing, but they are harder to handle.

Do trees work well for family trees?

> Not particularly.  It's hard to show things like remarriage and, as
  noted above, shared descendants are not typically representable
  in trees.

I worry about mutual references in `binary-tree?` and the `binary-tree`
constructor with a guard.  Can you talk about that?

> Sure.

### Other questions

Lab
---

### Preparation

### During lab

### Post lab

* `; SAM SAYS WE CAN STOP HERE!`
