---
title: "EBoard 32 (Section 2): Project kickoff"
number: 32
section: eboards
held: 2022-04-22
link: true
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [~10 min]
* Questions [~10 min]
* About the project [~10 min]
* Team characteristics [~10 min]
* Preliminary team formation [~10 min]
* Work time [whatever's left]

Administrivia
-------------

### Introductory notes

* Sorry about Wednesday.  I was going to try to teach from home, but I
  wasn't well enough.  (I think anyone who talked to me over the past
  few days could tell that.)  I'm doing better now, but still not 100%.
    * It appears that I am hoarse.  Let me know if you can't hear me.
* I forgot my hearing aids today.  Speak loudly.
* We may have admitted students today.
    * Why is the weather always worse on admitted students' day?
* I remain behind on grading.
    * I slept a lot.
* You may want to return to the keyboard wipes, if you haven't already
  been doing so.

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
    * Next week: Ask questions about quiz, XML, etc.

### Upcoming work

* Sunday, April 24, 4:00 p.m.: Quiz on writing higher-order procedures.
* Tuesday, April 26, 10:30 p.m.: MP 6
* No reading for Monday.

### Upcoming Token-Generating Activities

* Saturday, April 23, 10 am, Dick Young Classic
* Saturday, April 23, Noon, Baseball vs. Illinois College
* Saturday, April 23, 2:30 , Baseball vs. Illinois College
* Saturday, April 23, 2:30 pm, Water Polo
* Sunday, April 24, 10:15 am, Water Polo (Conference Championship)
* Sunday, April 24, ??:?? am, Baseball

### Other Upcoming Activities

* Saturday, April 23, 1pm, Softball vs. Lawrence
* Saturday, April 23, 3pm, Softball vs. Lawrence

### Prospective students

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

Some guidance
-------------

I've been helping a variety of folks.  Here are some tips that may help
others.

### Organize information!

We've covered a lot of material.  You need ways to quickly find that material.

* "What procedure does X?" / "Is there a procedure that does X?"
* "What does that procedure do?"
* "What available procedures work with strings?"
* "Where would you look if you needed more info?" 
* "What similar procedures have you written?"

Without some knowledge of what you have to help you, everything gets
harder.

### Document first!

I see a lot of procedures with no documentation.  In many cases, the
author is no longer sure what the procedure is supposed to do or what
type the parameters have.  We all forget.  Documenting first helps us
better use our helpers (or better check that they do what we want them
to do).

### Decompose!

Almost everyone I helped had a chunk of strange code.  For example, I
saw something like

```
(let ([thing (car (cdar (cdadr other-thing)))])
  ...)
```

It's hard to tell why you're doing that.  Better names would help.  But
it's also easier to check your code when you have separate helpers.

When I was writing `(get-attribute xml attribute)`, which seems
moderately straightforward, I quickly realized that I would probably
need a `has-attributes?` predicate.  Then I realized that it would
also help to have a `(get-attributes xml)` procedure to get the full
list of attributes.

Then I realized that `extract-attribute` came for free as part of one
of the libraries.  (Sometimes Sam needs to follow his own advice.)

```
> (extract-attribute 'id (string->xml "<element id='prof' field='nickname'/>"))
"prof"
> (extract-attribute 'field (string->xml "<element id='prof' field='nickname'/>"))
"nickname"
> (extract-attribute 'bazinga (string->xml "<element id='prof' field='nickname'/>"))
""
```

### Try as you go!

One of the lessons from the PB&J exercise should have been "Things will
go wrong.  You figure it out earlier by trying as you go."  Decomposing
also helps with that.

It's also useful to write procedures that just return something, even though
that's not what you finally return, so that you can try as you go.

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

`(if (string? csv) CODE #f)` -> `(and (string? csv) CODE)`

`(if TEST CODE #f)` -> `(and TEST CODE)`

`(if (not TEST) #f CODE)` -> `(and TEST CODE)`.

Questions
---------

### MP6 questions

Can you change the due date?

> Yes.

How do I get an attribute from a tag?

> `(extract-attribute attribute xml)` seems to work.  But you could
  write it yourself.

Suppose I have an id, how do I grab the corresponding thing from the data?

> Consider this situation (data then template)

> ```
<data>
  <name id="prof" class="professor"><first>Sam</first> <last>Rebel</last> <nickname>Evil</nickname></name>
  <topic id="recursion" class="difficult">Recursion</topic>
</data>
```

> ```
<p>Do you like Green Eggs and Ham, Professor <element id="prof" field="first">?</p>
```

> I want to grab the thing with id `prof` from the data.

> The normal path is `"//*[@id='prof']".

> Let's use it with `sxpath-match`

> ```
> (sxpath-match "//*[@id='prof']" data)
'((name (@ (id "prof") (class "professor")) (first "Sam") " " (last "Rebel") " " (nickname "Evil")))
> (sxpath-match "//*[@id='recursion']" data)
'((topic (@ (id "recursion") (class "difficult")) "Recursion"))
> (sxpath-match "//*[@id='bazinga']" data)
'()
```

> The star stands for "any tag".

> We could then turn this into a procedure.

How do I also extract the field?

> ```
> (sxpath-match "//nickname" '(name (@ (id "prof") (class "professor")) (first "Sam") " " (last "Rebel") " " (nickname "Evil")))
'((nickname "Evil"))
> (sxpath-match "//first" '(name (@ (id "prof") (class "professor")) (first "Sam") " " (last "Rebel") " " (nickname "Evil")))
'((first "Sam"))
> (sxpath-match "//middle" '(name (@ (id "prof") (class "professor")) (first "Sam") " " (last "Rebel") " " (nickname "Evil")))
'()
```

Can I combine those and make a pattern like `"//*[@id='prof']//first"`

> ```
> (sxpath-match "//*[@id='prof']//first" data)
'((first "Sam"))
> (sxpath-match "//*[@id='bazinga']//first" data)
'()
```

> Yes!

How do we now extract the data?

> List operations are always good.

Can you explain the E and M difference?

> For an E, you need to support the `random` and `element` tags in the data
file as well as the template file.  For an M, they only need appear in the
template file.

> For an E, you'd need to support something like this (generalized).

> ```
<data>
  <name id="prof" class="professor"><first>Sam</first> <last>Rebel</last> <nickname>Evil</nickname> <favetopic><element id="recursion"/></favetopic></name>
  <topic id="recursion" class="difficult">Recursion</topic>
</data>
```

What can be in an element tag?

> Only id and field.

What can be in a random tag?

> class, tag, field.

What's the result of `(build-page data template result)`?

> Probably nothing.  The goal is to build the file named result.

> The helper I wrote when I decomposed the problem returned the new
  XML.  

### Racket questions

You keep writing "Do not put right parens on a line by themselves".  Should
I pay attention to that?

> Yup.  From now on, you will get a zero if you put right parens on a line
  by themselves.

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

Project description
-------------------

Discussion of team formation
----------------------------

To be successful, teams need the members to bring different skills.

* You need a "leader": Someone who keeps the team on task, encourages
  people, divides tasks between people, etc.
    * Organizer: Sets meeting times, communicates, etc.
    * Communicator
* Topical skills: E.g., if we do a project involving XML, someone who
  is really good at XML.
* Presentation design
* Speaking
* Someone who can make abstract ideas concrete.
* Decomposer: Someone good at thinking about how to divide big projects
  into smaller parts.
* Tester - Someone who can write the tests to make sure things work
* Writer - Someone who can describe what we've done in clear text.
    * Documenter -
* "Devil's Advocate" - Someone who can ask the challenging questions
* Someone with good sense "This will take too long"

Color cards

* Red: Leader
* Yellow: Documenter
* Blue: Decomposer
* Green: Presentation designer
* Purple: Writer

Team formation and work begins
------------------------------

Brainstorm possible projects

* Personality quiz: Analyzes open-ended answers and determines
  personality.
* Interactive story generation about growing plants
* Something to do with text
* Political analysis
* Generate a poem plus an accompanying image
* Pie chart for whatever text it's given

You have until Sunday night to form a team.  Please send me team members
and probable project.

