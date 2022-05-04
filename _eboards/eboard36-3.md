---
title: "EBoard 36 (Section 3): Tree Recursion and Binary Search Trees"
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
* Sam needs to leave early today to observe a class.

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
    * SoLA 5 is optional

### Upcoming Token-Generating Activities

* Mentor sessions
* Today, 7:30pm-8:30pm, Meet with Trustees (Kington Plaza)
* Thursday, 11 am, PBK Convo
* Thursday, noon, Noyce 2517, Neuroscience Journal Club.  "I don't need
  a left frontal lobe."
* Weekend, Inauguration Activities
* Saturday, 10am, Met Opera (Turandot)
* The Grinnellian, Saturday
* Sunday, Noon, Baseball vs. Knox
* Sunday, 3pm, Synchronized Swimming Team, Natatorium
* Sunday, 6pm, Goal Student Athlete Ceremony

### Other Upcoming Activities


Lab updates
-----------

_TPS_

What did you take from the trees lab?

* "I'm still learning."
* "I now know how to build and traverse trees using a binary tree library."
    * Basic procedures to manipulate them: binary-tree-top, binary-tree-left,
      binary-tree-right, leaf, empty-tree?, binary-tree?, etc.
* We made diagrams of trees.  Diagrams are helpful to understand things.
  Or maybe they are confusing.
* We agree with Sam that the annoying shorthands, like `bt/tlrl`, are
  annoying.
* Multiple ways to represent trees: Lists, structs, (vectors), (hash tables)
    * Data abstraction: If you rely on the procedures, rather than underlying
      implementation, it's easier to switch implementation (and perhaps
      also easier to read)
* Sleep deprivation makes it hard to think about trees.
* Shorthand syntax
    * `bt` is short for `binary-tree`
    * `bt/t` is short for `binary-tree-top`
    * `bt/l` is short for `binary-tree-left`
    * `bt/r` is short for `binary-tree-right`
    * `bt/tlr` is short for `(binary-tree-top (binary-tree-left (binary-tree-right _)))`; that's ugly, so we use the `traverse` procedure we wrote instead.
* We can write and interpret procedures over binary trees.

Questions
---------

### MP7 questions

Does time spent preparing the presentation count toward the six hours?

> If you spend time on the presentation before the due date, yes.

Should we have just one time log?

> Yes.

Does meeting time planning the project count?

> Yes.

When is the presentation due?

> 7:00 a.m. Monday morning.

How should we submit our presentation?

> PDF or local Powerpoint: Upload to Gradescope

> Online Powerpoint on GrinCo: Share with me, DM me on Teams

> Online Google Doc: Share with rebelsky@gmail.com, DM me on Teams

> Other: Share with me or upload, DM me.

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

Do we have Airtame?

> Yes

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

> If the left subtree is empty and the right is not empty, there appears
  to be an error.

> Similarly, if the right subtree is empty and the left is not empty, 
  there appears to be an error.

What tests would you write?

```
(test-equal? "no left subtree, largest in right subtree"
             (binary-tree-largest (bt 5
                                      (empty-tree)
                                      (leaf 6)))
             6)

(test-equal? "no right subtree, largest in left subtree"
             (binary-tree-largest (bt 5
                                      (leaf 6)
                                      (empty-tree)))
             6)

(test-equal? "no left subtree, largest at root"
             (binary-tree-largest (bt 8
                                      (empty-tree)
                                      (leaf 6)))
             8)

(test-equal? "no right subtree, largest at root"
             (binary-tree-largest (bt 9
                                      (leaf 6)
                                      (empty-tree)))
             9)

(test-equal? "only negative values"
             (binary-tree-largest (bt -3
                                      (leaf -1)
                                      (empty-tree)))
             -1)
```

How would you resolve the problem?

> Option 1: Check whether it's an empty tree and, if so, return ???

> Option 2: Check whether the left is empty and the right is not.
  Return the max of the root and the largest in the left.
  Check whether the right is empty and the left is not.
  Return the max of the root and the largest in the right.

### Preparation

* See above.
* Save as `tree-recursion.rkt`.
* Acknowledge the class.

### During Lab


### Post Lab

* Sam left early.  Sorry!
* `; SAM SAID WE COULD STOP HERE`

