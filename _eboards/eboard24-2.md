---
title: "EBoard 24 (Section 2): Dictionaries, Maps, and Hash Tables"
number: 24
section: eboards
held: 2022-04-04
link: true
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [~5 min]
* Racket stuff [~5 min]
* Questions [~5 min]
* Lab [~60 min]

Administrivia
-------------

### Introductory notes

* Welcome back from break!
* Our graders finished much of the MP stuff, but not all of it.
* As soon as the MP2 redo is graded, I'll distribute grades again.

### Class mask policy

* We will continue to wear masks until at least the next course survey.

### Reminders

* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* Evening tutors are available 7--10 p.m. Sunday through Thursday as
  well as 3--5 p.m. on Sunday.
* Mentor sessions are Monday 8--9 p.m.  Wednesday, 8--9 p.m., Sunday 4--5 p.m.

### Upcoming work

* Reading for today due ASAP.
* Wednesday's reading due Tuesday at 10:00 p.m.
* Today's lab due Tuesday at 10:30 p.m. 
* Quiz 9 distributed Friday at 8am: Vectors.
* MP 5 due Thursday at 10:30 p.m.  
    * Autograder and submission form should be live tonight.
* SoLA 3 next week.

### Upcoming Token-Generating Activities

* Thursday 11am, Convocation
* Thursday 1pm, Baseball vs. Cornell College
* Thursday 3:30pm, Baseball vs. Cornell College

### Other Upcoming Activities

* Saturday 1pm, Softball vs. University of Wisconsin Stevens Point
* Saturday 3pm, Softball vs. University of Wisconsin Stevens Point

Racket/Lab Stuff
----------------

As I reviewed the reading responses on vectors, I noted that there
was some confusion on `vector-set!`.  The `vector-set!` procedure,
like most procedures that end in an exclamation point, returns
nothing.  You call it only for the side effect of changing the vector.

You'll discover that `hash-set!` and `hash-remove!` also don't
return anything.

Note: In reality, these procedures return a special value, `#<void>`.
Racket generally doesn't display void values, unless they appear nested
in other values.

```
> (hash-set! sample 'a 'b)
> sample
'#hash((a . b))
> (list (hash-set! sample 'a 'c))
'(#<void>)
> sample
'#hash((a . c))
```

Questions
---------

### Reading questions

Can you explain the difference between immutable and mutable hash tables?

> You'll find that it's much like vectors: You can add and change
values in mutable hash tables, but you can't do so in immutable
hash tables.  We'll explore those differences in lab.

Can you have multiple authors for a single book?

> You could choose to associate a list of authors with a title,
rather than a single author.

> For example, 

  ```
  (hash-set! book-authors "Goodnight Moon" 
                          '("Margaret Wise Brown"
                            "Clement Hurd"))
  ```

What if there's one author for multiple books?

> In that case, you will just have different keys and the same value
  (at least in the title->author hash tables)

  ```
  (hash-set! book-authors "Experiments in Java" "Samuel A. Rebelsky")
  (hash-set! book-authors "FunDHum" "Samuel A. Rebelsky")
  ```

### Other issues

Are office hours still online?

> Yup.  The surge of the new Omicron variant suggests they should be.

Can I meet with you outside of office hours?

> Certainly.  Propose a time using the Outlook/Teams scheduler.

Will there be an opportunity for a second redo of MP1 and MP2?

> Yup.  It will cost two tokens to do so.

Have you updated tokens recently?

> I will tonight.  If all goes well, they'll also be part of the grade sheet.

Lab
---

### Preparatory notes

* Make sure to include your section number and the semester.
* If I say "Sam said I can stop here", please make that location
  clear in your code.
* Please use your full names.
* Please reindent before submitting.

### Preparation

* Have the normal start-of-lab discussion.
* Read over the code!
* Save the file as `hash-tables.rkt`.

### During lab

Note: `hash-set` and `hash-remove` (no exclamation points) do not modify
their parameters; rather, they return new hash tables.

Note: `'#((key1 . value1) (key2 . value2))` makes an *immutable* hash
table while `(make-hash ...)` makes a mutable hash table.

E6: You can use `(hash-has-key? hash key)` to determine if a hash table
has a particular key.

### Wrapup

* Finish the lab!  (E6 and E7 are important.)
