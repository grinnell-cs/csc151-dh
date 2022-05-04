---
title: "EBoard 37 (Section 1): Algorithm Analysis and Searching"
number: 37
section: eboards
held: 2022-05-06
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

* Sam is slowly catching up.

### Reminders

* We will continue to wear masks until the end of the semester.  Enough
  people requested that on the survey that it seems like the best policy.
* Please say your name when you ask or answer a question (even if I've
  just called you by name).  Say your partner's name, too!
* Evening tutors are available 7--10 p.m. Sunday through Thursday as
  well as 3--5 p.m. on Sunday.
* Mentor sessions are generally Sunday 4--5 p.m.  Monday 8--9 p.m.  
  Wednesday, 8--9 p.m.

### Upcoming work

* Sunday, May 8, 4:00 p.m.: Quiz 13
    * Our last quiz.
    * Distributed Friday morning.
    * Topic: Tree recursion
    * Sample questions in Sample SoLA 4
* Sunday, May 8, 10:30 p.m.: Today's lab
    * Our last lab.
    * "Sam said I could stop here."
* Monday, May 9, 7:00 a.m.: Presentations
* Thursday, May 12, 10:30 p.m.: SoLA 4
    * Released 2:30 p.m. Wednesday
    * NOT our last SoLA
    * However, SoLA 5 is optional

### Upcoming Token-Generating Activities

* Mentor sessions (Sunday and Monday, not Wednesday)

### Other Upcoming Activities

* The Grinnellian, Saturday

Lab notes
---------

### `vector->tree`

Why did we include `vector->tree`?

* It makes it easier to build trees, particularly binary search trees.
* You've seen/written recursive procedures that process trees.  It's also
  useful to consider recursive procedures that build trees.
* It's nice to see slightly more complicated code.

### Fun with counting

How many trees are there of size 5?  We'll answer in terms of the smaller
numbers of trees.

* 1 tree of size 1: 
    * `(leaf _)`
* 2 trees of size 2: 
    * `(bt _ (leaf _) (mt))` 
    * `(bt _ (mt) (leaf _))`
* 5 trees of size 3
    * `(bt _ (tree-of-size 2) (mt))` [2]
    * `(bt _ (mt) (tree-of-size 2))` [2]
    * `(bt _ (leaf _) (leaf _))` [1]
* 14 trees of size 4
    * `(bt _ (tree-of-size 3) (mt))` [5]
    * `(bt _ (mt) (tree-of-size 3))` [5]
    * `(bt _ (leaf _) (tree-of-size 2)) [2]
    * `(bt _ (tree-of-size 2) (leaf _)) [2]
* 42 trees of size 5

