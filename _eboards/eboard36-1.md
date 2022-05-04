---
title: "EBoard 36 (Section 1): Tree Recursion and Binary Search Trees"
number: 36
section: eboards
held: 2022-05-02
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

* Sam remains behind.

### Reminders

* We will continue to wear masks until the end of the semester.  Enough
  people requested that on the survey that it seems like the best policy.
* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* Evening tutors are available 7--10 p.m. Sunday through Thursday as
  well as 3--5 p.m. on Sunday.
* Mentor sessions are generally Sunday 4--5 p.m.  Monday 8--9 p.m.  
  Wednesday, 8--9 p.m.

### Upcoming work

* Thursday, May 5, 10:00 p.m.: Readings for Friday (Alg. Analysis + Searching)
    * Our last set of readings.
* Thursday, May 5, 10:30 p.m.: MP 7
    * There will be a presentation next week.
* Thursday, May 5, 10:30 p.m.: Today's lab
    * "Sam said I could stop here."
* Sunday, May 8, 4:00 p.m.: Quiz 13
    * Our last quiz.
    * Distributed Friday morning.
    * Topic: Tree recursion
    * Sample questions in Sample SoLA 4
* Thursday, May 12, 10:30 p.m.: SoLA 4
    * NOT our last SoLA
    * However, SoLA 5 is optional

### Upcoming Token-Generating Activities

* Mentor sessions
* Today, 7:30pm-8:30pm, Meet with Trustees
* Thursday, 11 am, PBK Convo
* Weekend, Inauguration Activities
* Saturday, 10am, Met Opera (Turandot)
* Sunday, Noon, Baseball vs. Knox

### Other Upcoming Activities

* The Grinnellian, Saturday

Lab updates
-----------

_TPS_

What did you take from the trees lab?

* "I now know how to build and traverse trees using a binary tree library."
    * We have three aspects of a node in a tree: value, left subtree, and
      a right subtree.
* There are multiple representations of trees: Lists, Structs, (Vectors),
  (Hash Tables).  They have some similarities and some differences.
    * If we use library functions, things don't break if we change
      representation.  (Data abstraction - don't assume things about
      the underlying representation.)
* Although a leftmost tree and a rightmost tree print out the same using
  display-tree, they are different trees because the empty trees are
  on different sides.
* We can use/write recursive procedures over trees (e.g., `traverse`).

Questions
---------

### MP7 questions

Does time spent preparing the presentation count toward the six hours?

> If you spend time on the presentation before the due date, yes.

Does meeting time planning the project count?

> Yes.

When is the presentation due?

> 7:00 a.m. Monday morning.

How should we submit our presentation?

> PDF or local Powerpoint: Upload to Gradescope

> Online Powerpoint on GrinCo: Share with me, DM me on Teams

> Online Google Doc: Share with rebelsky@gmail.com, DM me on Teams

> Other: Share with me, DM me.

When will we decide on presentation order?

> Friday.  Talk to your team about when you'd like to go.

Will we get examples of previous presentations?

> No.  Shoot for 5-10 minutes, show off your code (running and details),
  be prepared to answer questions.  (be prepared to ask questions)$a

What if the code takes too long to run during class?

> Then don't run it, or find a way to pre-run the code.

Do we have to make a presentation?  Can we just use Racket?

> Sure.

### Reading questions

How do we find the largest value in a tree?

> See notes under lab below.

How do we search a leaf?

> We look at the value.  If it matches, we're done.  If not, we recurse
  on the left or right subtree.  Since those are empty, we don't find
  anything there.

When we recurse on both subtrees, does that happen simultaneously
or in sequence?

> In our version of Racket, in sequence.  There are languages that allow
  us to do it simultaneously.

Can we go over examples in class?

> We'll mostly go over examples in lab.

### Racket questions

### General questions

Lab
---

### How to find the largest value in a tree

_TPS_

What was the problem?

> If a node has one subtree, but not two, you get an error.

What tests would you write?

```
(test-equal? "left subtree empty, right subtree larger"
             (binary-tree-largest (bt 5
                                      (empty-tree)
                                      (leaf 6)))
             6)

(test-equal? "right subtree empty, largest value on right"
             (binary-tree-largest (bt 7
                                      (leaf 4)
                                      (bt 9
                                          (leaf 4)
                                          (empty-tree))))
             9)

(test-equal? "tree contains only negative numbers"
             (binary-tree-largest (bt -3
                                      (leaf -5)
                                      (leaf -2)))
             -2)

(test-equal? "tree contains only negative numbers, empty subtree"
             (binary-tree-largest (bt -3
                                      (leaf -5)
                                      (empty-tree)))
             -3)
```

How would you resolve the problem?

> Option 1: See if the tree is empty.  If so ... um ... there's no good
  answer.  You should not choose this option.

> Option 2: See if one subtree is empty.  If so, only recurse over the
  other side.

### Preparation

* The joy of skimming code.

### During Lab

### Post Lab

* `; SAM SAID WE COULD STOP HERE`

