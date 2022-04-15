---
title: "EBoard 29 (Section 2): Processing and Transforming XML"
number: 29
section: eboards
held: 2022-04-15
link: true
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [~10 min]
* Questions [~10 min]
* A bit of new stuff [~10 min]
* Lab [~45 min]
* Survey [~15 min]

Administrivia
-------------

### Introductory notes

* We may have admitted students.
* The SXpath library is not working perfectly, which affects the lab.
  I'll see what I can do to fix it.

### Class mask policy

* We will continue to wear masks until at least the next course survey
  (that is, through today).  I'll send out mail on Sunday about plans
  for Monday.

### Reminders

* Sam's computer remains broken.  Sorry.
* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* Evening tutors are available 7--10 p.m. Sunday through Thursday as
  well as 3--5 p.m. on Sunday.
* Mentor sessions are generally Sunday 4--5 p.m.  Monday 8--9 p.m.  
  Wednesday, 8--9 p.m.
    * This week: Ask questions about SoLA 3 and XML/SXML/etc.

### Upcoming work

* Sunday, 4:00 p.m.: Quiz 10
* Sunday, 10:00 p.m.: Monday's reading
* Sunday, 10:30 p.m.: Today's lab
    * Today is "Sam says stop here"
* Thursday, April 21, 10:30 p.m.: MP 6

### MP6

* Processing XML and more!

### Upcoming Token-Generating Activities

* ???, Notional Machines Interview, 
  <https://calendy.com/songjunt/map-interview>
* TODAY, 2pm: Baseball vs. Monmouth
* Saturday, April 16, ?:?? am, Dag Field Day on Mac Field
* Saturday, April 16, 9:00 am, Men's Tennis vs. Monmouth
* Saturday, April 16, 11:00 am, Baseball vs. Monmouth
* Saturday, April 16, 1:30 pm, Baseball vs. Monmouth
* Saturday, April 16, 3:00 pm, Men's Tennis vs. Beloit
* Thursday, April 21, Blood drive
* ISO MCO lots of things
    * You should have email.  All Sam heard was jump long rope while
      eating dessert made with ghost peppers.
    * Bollywood Gardner
* Saturday, April 23, 3:45 pm, Water Polo
* Saturday, April 23, 6:00 pm, Water Polo
* Sunday, April 24, 10:15 am, Water Polo (Conference Championship)

### Other Upcoming Activities

* Thursday, April 21, 3:00 pm, Softball vs. Simpson
* Thursday, April 21, 5:00 pm, Softball vs. Simpson
* Strike-out-cancer stuff next week

### Friday PSA

_And other ways to scare the admitted students._

* Please take care of yourselves.
* Be moderate.
* Consent is essential.

### Today's random detour

_TPS_

```
(define aphorisms
  '(ul (li "Time flies like an arrow")
       (li "Fruit flies like an apple")))
```

What does this reveal about the complexities of understanding the English 
language?

* We've changed the ends, but that changes the way we interpret the inside.
* In the first one "flies" is the verb and "like" is, like, being used in 
  a simile (as the start of an adverbial phrase).  In the second one, 
  "like" is the verb.
* In the first one "flies" is a verb; in the second, "flies" is a noun.

Lab Review
----------

_TPS_

What were your main takeaways from the "processing XML" lab (at least
the parts you did) and reading?

* There are multiple ways to represent XML computationally: As a string
  with tags or as a nested list.  That's cool.
* We can convert between those two representations.
* We can write programs that process XML (and HTML).
* We can write programs that generate HTML.

What do you see as the relative advantages of XML (with "<em>tags</em>") 
and SXML (as `'(em "lists")`.)

* Easier to read and understand what it's trying to do.  
* We should be used to lists right now, so they are easier to work with
  conceptually.

Questions
---------

### Racket questions

### Other questions

Can I get tokens for attending games/meets virtually?

> No.  The goal is to support your classmates.  They are unlikely to
  feel supported if you are not there in person.

Was this SoLA especially hard?

> That was not my intent.  But we are getting to harder stuff.  You
  will master it.

Did you give two names to "Using higher-order procedures"?

> Whoops.

A bit of new stuff
------------------

```
(define sample
  (string->xml "<div><p>This is <em>somewhat</em> boring.  This is <em>less</em> boring.</p><p>This is a <em>second</em> paragraph, with a <q>quotation that includes <em>emphasized</em> text</q></p></div>"))
> sample
'(div
  (p "This is " (em "somewhat") " boring.  This is " (em "less") " boring.")
  (p "This is a " (em "second") " paragraph, with a " (q "quotation that includes " (em "emphasized") " text")))
```

`(sxpath-replace pattern xml proc)`
  : Update any element matching the pattern by applying `proc`.

```
> (define make-strong
    (lambda (xml)
      (cons 'strong (cdr xml))))
> (make-strong '(q "Hello"))
'(strong "Hello")
> (sxpath-replace "//q//em" sample make-strong)
'((div
   (p "This is " (em "somewhat") " boring.  This is " (em "less") " boring.")
   (p
    "This is a "
    (em "second")
    " paragraph, with a "
    (q "quotation that includes " (strong "emphasized") " text"))))
```

`(sxpath-delete pattern xml)`
  : Delete any element matching the pattern.

```
> (sxpath-delete "//em" sample)
'((div
   (p "This is " " boring.  This is " " boring.")
   (p "This is a " " paragraph, with a " (q "quotation that includes " " text"))))
```

`(sxpath-remove pattern xml)`
  : Remove the tag in any element matching
    the pattern, moving any contents of the element up to the enclosing
    element.

```
> (sxpath-remove "//q//em" sample)
'((div
   (p "This is " (em "somewhat") " boring.  This is " (em "less") " boring.")
   (p "This is a " (em "second") " paragraph, with a " (q "quotation that includes " "emphasized" " text"))))
> (sxpath-remove "//q" sample)
'((div
   (p "This is " (em "somewhat") " boring.  This is " (em "less") " boring.")
   (p "This is a " (em "second") " paragraph, with a " "quotation that includes " (em "emphasized") " text")))
```

This only works with sxml format.

Lab
---

### Preparation

* Have the normal start-of-lab discussion.
* Add a bunch of packages if you haven't already.

### During Lab

* Lots of problems.  Sorry.

### Wrapup

* `; SAM SAID I CAN STOP HERE`

Surveys
-------

Peer educator survey: <https://grinnell.co1.qualtrics.com/jfe/form/SV_ekzWLjCG3g9ce46>

> 70% response rate for the three sections - a token

CSC151 survey: <https://bit.ly/csc151-2022Sp-week10>

> 70%+ response rate for the section - another token
