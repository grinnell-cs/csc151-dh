---
title: "EBoard 36 (Section 2): Tree Recursion and Binary Search Trees"
number: 36
section: eboards
held: 2022-05-04
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
    * Sample questions in Sample LA 4
* Thursday, May 12, 10:30 p.m.: SoLA 4
    * NOT our last SoLA
    * SoLA 5 is optional

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
    * Trees have both left and right subtrees.
* Trees can be used to organize hierarchies.
* To build a larger tree, you need lots of empty trees (not just the
  one null that you have at the end of a list)
    * `leaf` is your friend.
* In processing trees, we may need to recurse on both the right and the
  left subtree.
* Trees require mental modeling and/or it helps to draw pictures.
* Reinforce data abstraction: If you focus on the procedures, and not
  the representation, it's easy to switch representations.  (Perhaps
  we prefer one over another in different situations.)
    * It should not matter whether we are using lists and triangles
      or structs or vectors or hash tables or ...

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
  be prepared to answer questions.  (be prepared to ask questions)

What if the code takes too long to run during class?

> Then don't run it, or find a way to pre-run the code.

Do we have to make a slide deck?  Can we just use Racket?

> Yes.

Can we use our own computer?

> As long as you check IN ADVANCE that your computer will work in this
  classrooom

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

> There's an error if the left subtree is empty or the right subtree
  is empty (but not both).

What tests would you write that reveal the problem?

```

(test-equal? "student's test"
             (binary-tree-largest (bt 9
                                      (empty-tree)
                                      (leaf 40)))
             40)

(test-equal? "the opposite of student"
             (binary-tree-largest (bt 6
                                      (leaf 20)
                                      (empty-tree)))
             20)

(test-equal? "tneduts"
             (binary-tree-largest (bt 60
                                      (leaf 20)
                                      (empty-tree)))
             60)

(test-equal? "extra"
             (binary-tree-largest (bt -4
                                      (leaf -3)
                                      (empty-tree)))
             -3)
```

How would you resolve the problem?

> Use `empty-tree?`, maybe `or`, maybe ...

> Option 1: Sequence of tests.  Is it a leaf? (Same as now).  Is the
  left subtree empty?  If so, larger of top and right.  Is the right
  subtree empty?  If so, larger of top and left?  Otherwise, use that
  existing max of ....

> No other options suggested

### Preparation

* Don't forget to save!

### During Lab

* Acknowledgements!
* Don't forget to save!

### Post Lab

* Don't forget your acknowledgements!
* `; SAM SAID WE COULD STOP HERE`

