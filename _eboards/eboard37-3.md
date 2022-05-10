---
title: "EBoard 37 (Section 3): Algorithm Analysis and Searching"
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
* I brought an alternative keyboard for our keyboard snob.

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
* The Grinnellian, Saturday
* Sunday, Noon, Baseball vs. Knox
* Synchronized Swimming Sunday
* Waltz tonight

### Other Upcoming Activities

### Friday PSA

* Moderation in all!  Get sleep!
* Consent is essential.

Presentations Monday
--------------------

* You can use my computers.
* You can attempt to use Airtame.  (If the latter, stop by in advance
  and try.)
* GPA Terminators first
* Um, Sorry is last (and hopes to be moved to Wednesday)
* Sam will randomly assign the rest

Lab notes
---------

### `vector->tree`

Why did we include `vector->tree`?

* It makes it easier to build trees, particularly binary search trees.
* You've seen/written recursive procedures that process trees.  It's also
  useful to consider recursive procedures that build trees.
* It's nice to see slightly more complicated code.

How does it work?

* We will not trace a short example.  (Why did Sam bother setting up?)

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

Are these constant time (they don't depend on the input) or linear
time (scale with the input) or ...?

_TPS_

* `cdr`: constant time
* `cddr`: constant time
* `list-ref`: linear in the position; we need to do that many cdrs.
  Why that design?  Because it gives us other advantages.
* `vector-ref`:  constant time
    * Seems to be much faster, which make us assume it's constant time
    * An element can be found by the obscure formula
      start + cell-width x index, which is constant time.
* `map`: linear: it depends on the number of elements in the list because
  it has to process each element of the list
    * (it complains if you use two lists and they aren't the same length)
* `range`: linear; you have to build that many elements

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

Can you update tokens?

> Yes.  Over the weekend.

Will we get another grade report.

> Yes, by Wednesday evening.

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
* Exercise 3: Why do we get different answers for Amy and Otto?  Think
  about how binary search works.
* Exercise 5: Note that the list-reverse and list-append procedures are 
  already in the lab.

### Post lab

* `; SAM SAID WE COULD STOP HERE!`
