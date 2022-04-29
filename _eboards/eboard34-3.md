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

* Happy Friday!
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

### Fun with Admitted Students

* Welcome!

### Upcoming work

* Sunday, May 1, 4:00 p.m.: Quiz (Tail Recursion)
* Sunday, May 1, 10:30 p.m.: Lab writeup from today
    * "Sam said I can stop here."
* Tuesday, May 3, 10:00 p.m.: Reading for Wednesday (Tree recursion)
* Thursday, May 5, 10:30 p.m.: MP 7
    * There will be a presentation the following week (May 9 and 11).

### Upcoming Token-Generating Activities

* Saturday @ 2pm: GSO (Sebring-Lewis)
* Women's Golf this weekend
* ISO Cultural Harris, Saturday evening, 7 pm 
* Fetish Gardner, 10pm tonight, next to Bob's

### Other Upcoming Activities

* Sunday @ 1pm: Softball (Diamond)
* Sunday @ 3pm: Softball (Diamond)
* Sunday at 4pm, JRC 101, Last General Union meeting of the year

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

> Note: We could also use `append` in the recursive case.  But we
  should not, because `append` is an expensive operation and we try
  to avoid expensive operations the middle of a recursive procedure.
  We'll return to that next class.

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

> ```
(define binary-tree
  (lambda (value left right)
    (cond
      [(not (binary-tree? left))
       (error "...")]
      [(not (binary-tree? right))
       (error "...")]
      [else
       (binary-tree-node value left right)])))

(define binary-tree?
  (lambda (thing)
    (and (binary-tree-node? thing)
         (binary-tree? (binary-tree-left thing))
         (binary-tree? (binary-tree-right thing)))))
```

> If we can be sure that our client never creates binary-tree-nodes
  separately, we know that every binary-tree-node is a binary tree.

Are there mechanisms for processing binary trees other than binary tree
recursion?

> No, not really.  It's a recursive structure.

> We process lists recursively (or by using procedures that process
  lists recursively)

Binary trees seem limiting.  Are there n-ary trees?

> Yes.  But we're sticking with binary trees for now.

How would you implement trees with multiple branches?

> We no longer can use `binary-tree-left` and `binary-tree-right`, becuase
  they don't have a natural meaning.  So we likely have `(tree-subtree tree n)`.

> Our internal representation might change

> `(struct binary-tree (top left right))` won't work any more.

> `(struct tree (top children))` may be our solution, making children
  a list or vector.

### Other questions

Why is the second redo for MP3 up?

> Because someone knows they didn't get full credit on the first redo and
  wanted to be able to run the autograder.

Lab
---

### Preparation

* Note: Carriage return is your friend.  Don't try to put too much on
  one line.

### During lab

* Ex1: Some of you have discovered why it's important to check our
  preconditions.  The current `binary-tree` procedure doesn't even
  verify that it has a value, left, and right.
* Ex1: Indentation helps you to check manually.
* Ex2: There is a `binary-tree-node?` predicate.
* Ex2: There is an `empty-tree?` predicate.
* Ex3: You can use `(substring path 1)` to drop the first letter in `path`
  (assuming `path` is nonempty).
* Ex4: Yes, you can put the definition of `sample` in your code.

### Post lab

* `; SAM SAYS WE CAN STOP HERE!`
