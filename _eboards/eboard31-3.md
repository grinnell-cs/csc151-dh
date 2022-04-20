---
title: "EBoard 31 (Section 3): Tail recursion"
number: 31
section: eboards
held: 2022-04-20
link: true
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [~10 min]
* Questions [~30 min]
* Lab [~40 min]

Administrivia
-------------

### Introductory notes

* I have a bad cough and so I'm teaching from home today (or trying to
  teach from home).
    * I've been telling you to stay home when you seem sick, so I'm
      following the same advice.  Or at least sort of the same advice.
    * Since I may be less able to answer questions, I've moved the
      due date for MP6 to Tuesday.
* We may have admitted students (those are mostly on Friday).
* SoLA 3 has been mostly returned.  I'm still working on the data abstraction
  problem.
    * Other grading did not get done.  I spent a lot of time helping
      individuals yesterday.
* There were way too many questions for today!  I don't know how much time
  we'll have for lab.
* I've been helping a variety of folks; too many have not yet organized
  the information we have.  
    * "What procedure does X?"  
    * "What does that procedure do?"
    * "What available procedures work with strings?"  
    * "Where would you look if you needed more info?"  

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
* Sunday, April 24, 4:00 p.m.: Quiz 12
* Tuesday, April 26, 10:30 p.m.: MP 6

### Upcoming Token-Generating Activities

* Thursday, April 21, 11am, Convocation
* Thursday, April 21, Blood drive
* Saturday, April 23, 10 am, Dick Young Classic
* Saturday, April 23, Noon, Baseball vs. Illinois College
* Saturday, April 23, 1pm, Softball vs. Lawrence
* Saturday, April 23, 2:30 , Baseball vs. Illinois College
* Saturday, April 23, 3pm, Softball vs. Lawrence
* Saturday, April 23, 3:45 pm, Water Polo
* Saturday, April 23, 6:00 pm, Water Polo
* Sunday, April 24, 10:15 am, Water Polo (Conference Championship)
* Sunday, April 24, ??:?? am, Baseball
* Strike-out-cancer stuff 

### Other Upcoming Activities

* Thursday, April 21, 3:00 pm, Softball vs. Simpson
* Thursday, April 21, 5:00 pm, Softball vs. Simpson

Sample quiz questions
---------------------

## Write higher-order procedures

_Write procedures that take procedures as parameters and return procedures as results._

Write, but do not document, a *recursive* procedure `(split pred? lst)`,
that takes a predicate and a list as parameters and returns a two-element
list, the first of which is all the elements for which the predicate
holds, and the second of which is all the elements for which the
predicate does not hold.  You may assume that the predicate is
applicable to all elements of the list.

```
> (split odd? (list 5 1 5 4 2 3 8))
'((5 1 5 3) (4 2 8))
> (split string->number? (list "11" "fred" "one" "22.1" "two"))
'(("11" "22.1") ("fred" "one" "two"))
```

## Write higher-order procedures (Extra)

a. As you may recall, the `(left-section proc left)` procedure looks
like this.

```racket
(define left-section
  (lambda (proc left)
    (lambda (right)
      (proc left right))))
```

In your own words, explain why we have two `lambda` expressions                
in `left-section.

b. Consider the following alternate definition of `left-section`.              

b. Consider the following alternate definition of `left-section`.              

```racket
(define left-section
  (lambda (proc left)
    (let ([result
           (lambda (right)
             (proc left right))])
      result)))
```

Why might someone prefer this version of `left-section`?

c. Using the strategy of b, write a procedure, `(make-multiplier n)`,
that creates a procedure that takes one input and multiplies it by `n`.

```
;;; (make-multiplier n) -> procedure?
;;;   n : number?
;;; Create a procedure that multiplies its parameter by n
(define make-multiplier
  (lambda (n)
    ???))
```

```
> (define mul5 (make-multiplier 5))
> (mul5 10)
50
> mul5 1.2)
6.0
```

Local bindings comments
-----------------------

I found the local bindings problems useful, because they suggested that
some of you didn't realize or or both of two things.

* `let` bindings evaluate the expressions *immediately*, rather than waiting
  until the names are used.
* You can use `let` expressions *anywhere* an expression can go.  You can 
  even write something silly like `(+ 5 (let ([x (sqr 4)]) (+ x x)))`.
* Note: One thing that sets Scheme apart from many languages is that most
  expressions can go anywhere an expression can go.  We've already seen
  that you can use `lambda`s anywhere (e.g., as return values.

### The Zen of Booleans returns

`(if TEST CODE #f)` -> `(???)`

`(if (not TEST) #f CODE)` -> `(???)`.

SoLA 3 questions
----------------

Could you go over the data abstraction problem?

> Sure.  But not on the eboard.  You should take notes.

Quiz 11 comments
----------------

_These will not be on the eboard.  I'd recommend taking notes._

MP6 questions
-------------

Can you change the due date?

> Yes.

I'm having trouble decomposing.  Can you suggest some procedures?

* A lot of what we're doing is searching the data.  I'd write procedures
  that search the data.
    * `(extract-elements-by-tag tag data)`
    * `(extract-elements-by-class class data)`
    * `(extract-element-by-id id data)` ; note that this is singular
    * `(extract-field field xml)` ; Grab the first element with a particular
      tag.
* We also have to extract information from `element` and `random` tags.
    * `(extract-attribute attribute element)`
    * `(define extract-class (section extract-attribute 'class <>))`
    * `(define extract-tag (section extract-attribute 'tag <>))`
    * `(define extract-id (section extract-attribute 'id <>))`
    * `(define extract-fieldname (section extract-attribute 'field <>))`

Can you help me write `extract-element-by-id`?

> Sure.

> We'll use `sxpath-match`.  That returns a list of all matching things.
  The list should contain zero or one elements.  (Zero means no matches;
  One is the one match.)

> Our pattern should be something like `"//*[@id='ID']"`, where we fill
  in the appropriate id.

> So

> ```
;;; (id-pattern id) -> string?
;;;   id : string?
;;; Build the pattern to match a particular id.  E.g., `(id-pattern "prof")`
;;; should give `"//*[@id='prof']"`.
(define id-pattern
  (lambda (id)
    ???))

;;; (extract-element-by-id id data) -> xml? or false?
;;;   id : string?
;;;   data : xml
;;; Find the element in data with a given id.  If there is no such
;;; element, return false.
(define extract-element-by-id
  (lambda (id data)
    ???))
```

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
```

> Some people find this version easier to understand.

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

> ```
(define reduce-right
  (lambda (binproc lst)
    ???))
```

How do I define `map` in terms of `fold`?

> It's easiest to use `foldr`.

### Racket questions

You keep writing "Do not put right parens on a line by themselves".  Should
I pay attention to that?

> Yup.  From now on, you will get a zero if you put right parens on a line
  by themselves.

### Reading questions

### Other questions

I don't see the mentor sessions I attended on my grade report.  Why not?

> You only get credit for mentor sessions for which you write reports.

But the mentors take down our names.

> Yes.  That's for other purposes.  Tokens require a multi-senetence 
  reflective essay.

Can I go beyond the one-week deadline for token reports?

> Yes, if you were confused about the mentor report policies.

Can you tell me which mentor sessions I attended?

> I suppose so.  DM or email me.

I'm worried about the phase 3 problems.  Can we have an extra chance to
try those?

> We'll take a class vote.

Lab
---

### Preparation

* Have the normal start-of-lab discussion.

### During Lab

### Wrapup

* `; SAM SAID I CAN STOP HERE`

