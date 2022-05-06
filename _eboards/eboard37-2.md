---
title: "EBoard 37 (Section 2): Algorithm Analysis and Searching"
number: 37
section: eboards
held: 2022-05-06
link: true
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [~20 min]
* Questions [~10 min]
* Lab [~50 min]

Administrivia
-------------

### Introductory notes

* Sam is slowly catching up.
* MP5 graded (except for one late submission)
* Any keyboard snobs want to try an alternate keyboard (cheapo mechanical)?

### Reminders

* We will continue to wear masks until the end of the semester.  Enough
  people requested that on the survey that it seems like the best policy.
* Please say your name when you ask or answer a question (even if I've
  just called you by name).  Say your partner's name, too!
* Evening tutors are available 7--10 p.m. Sunday through Thursday as
  well as 3--5 p.m. on Sunday.
* Mentor sessions are generally Sunday 4--5 p.m.  Monday 8--9 p.m.  

### Upcoming work

* Sunday, May 8, 4:00 p.m.: Quiz 13
    * Our last quiz.
    * Distributed Friday morning (after our class).
    * Topic: Tree recursion
    * Sample questions in Sample SoLA 4
* Sunday, May 8, 10:30 p.m.: Today's lab
    * Our last lab.
    * "Sam said we could stop here."
* Monday, May 9, 7:00 a.m.: Presentations
    * Our last presentations.
* Thursday, May 12, 10:30 p.m.: SoLA 4
    * Released 2:30 p.m. Wednesday
    * NOT our last SoLA
    * However, SoLA 5 is optional

### Upcoming Token-Generating Activities

* Mentor sessions (Sunday and Monday, not Wednesday)
* Weekend, Inauguration Activities
* Saturday, 10am, Met Opera (Turandot)
* Sunday, Noon, Baseball vs. Knox

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

How does it work?

* We might trace a short example.

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

Questions
---------

### Reading questions

What is the answer to the first self-check?

_TPS_

* `cdr`: 
* `cddr`: 
* `list-ref`: 
* `vector-ref`:  
* `map`: 
  of the list.
* `range`: 

I took `car` of a very long list and it took a long time.  Are you sure `car`
is constant time?

> Yes

> If you found that it took longer, it's probably because you were timing 
  the construction of the list, too.

This was really complicated.  Will we have a chance to ask more questions?

> Yes, but I'd like you to do lab first.

How does the length of the list/vector affect the expected cost?

> Linear search (on a list or a vector): If you're looking for something
  that's not there, it will take about twice as long, since you have to
  look at every value.  

> Linear search (if you're looking for something that *is* there), it's
  a bit harder to analyze, but we say "on average, twice as long"

> Binary search: You'll figure it out in the lab.

### Administrative questions

Will we get redos on MP5 and 6?

> Yes.  They will be graded moderately quickly, giving you a chance
  for a second redo.

> Please DM me when you are ready to have an MP redo graded.

Will we get second redos?

> Yes.

Lab
---

### Preparation

* You may find it helpful to keep the code up in a separate browser
  window.

### During lab

* Exercise 1: When binary-search says that "Heather" is at position 8, 
  how do you know that it's correct?
    * Mediocre answer: "zero, one, two, three, four, five, six, seven, eight".
    * Better answer: `(vector-ref simulated-students 8)`.

### Post lab

* `; SAM SAID WE COULD STOP HERE!`
