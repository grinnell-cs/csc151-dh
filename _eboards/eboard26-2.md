---
title: "EBoard 26 (Section 2): Structured Types"
number: 26
section: eboards
held: 2022-04-08
link: true
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [~5 min]
* Racket stuff [~5 min]
* Questions [~10 min]
* Lab [~55 min]

Administrivia
-------------

### Introductory notes

* We may have admitted students today (and over the next few weeks).
    * It appears that someone/something wants to warn admitted students
      about Grinnell weather.
* Note that we will not have a Wednesday mentor session since SoLA 3
  will be live.
    * Sunday and Monday's mentor sessions will be reviews for the SoLA.
* If you have not yet done so, please sign up for an individual site
  on <https://sites.grinnell.edu>.
* If you want to notify me that you're missing class because you are ill,
  please use a DM on Teams.  (I don't tend to read email during the day.)
* If you must miss class for a rescheduled sporting event, please notify me.

### Class mask policy

* We will continue to wear masks until at least the next course survey
  (that is, through Friday the 15th).

### Reminders

* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* Evening tutors are available 7--10 p.m. Sunday through Thursday as
  well as 3--5 p.m. on Sunday.
* Mentor sessions are Monday 8--9 p.m.  Wednesday, 8--9 p.m., Sunday 4--5 p.m.

### Upcoming work

* ASAP: Sign up for a site on <https://sites.grinnelledu>
* Sunday 4:00 p.m.: Quiz 9: Vectors (Distributed this a.m.)
* Sunday 10:00 p.m.: Reading for Monday 
* Sunday 10:30 p.m.: Today's lab
    * Likely "Sam says stop here"
* Thursday, April 14, 10:30 p.m.: SoLA 3
    * Don't forget that there are sample questions on the LAs page.
    * We go over sample LAs in the mentor sessions
    * You can also ask evening tutors or Sam

### Upcoming Token-Generating Activities

* Saturday 2pm, 1010 High Street (or the HSSC), Holi celebration Saturday 
  (colors and music and more)
* Sunday 2pm, Grinnell Singers, Sebring Lewis
* Wednesday, April 13, all day: Scarlett and Give Back Day
    * Token for donating.
      (Equity: You can grab $5 from me next week to donate.)
        * Recommend: Food Pantry, Student Mental Health, Accessibility
    * Token for participating in an activity.
* Wednesday, April 13, 8pm, Writers@Grinnell: Jerald Walker, 
  <https://grinnellcollege.zoom.us/j/85126108306>
* Vote in the Union election, if you are an hourly student worker

### Other Upcoming Activities

* Saturday 1pm, Softball vs. University of Wisconsin Stevens Point
* Saturday 3pm, Softball vs. University of Wisconsin Stevens Point

Racket/Lab Stuff
----------------

### `name->sortable`

```
(define name->sortable
  (let ([space-before (lambda (str) (if str (string-append " " str) ""))]
        [space-after (lambda (str) (if str (string-append str " ") ""))])
    (lambda (name)
      (let ([prefix (name-prefix name)]
            [given (name-given name)]
            [middle (name-middle name)]
            [family (name-family name)]
            [suffix (name-suffix name)])
        (cond 
          ; Normal case: They have a family name.  It comes first.
          [family
           (string-append family
                          ", "
                          given
                          (space-before middle)
                          (space-before suffix)
                          (space-before prefix))]
          ; Special case: Royalty and Religious, generalized
          [(not middle)
           (string-append (space-after prefix)
                          given
                          (space-before suffix))]
          ; Special case: No family but middle
          [else
           (string-append given
                          (space-before middle)
                          (space-before suffix)
                          (space-before prefix))])))))
```

Why are there two `let` expressions?

> Things that don't depend on the input go outside the lambda.

> Things that do depend on the input go inside the lambda.

### Acknowledgements

```
;; Acknowledgements:
;;   List of space related words that helped me create my syllex
;;      https://relatedwords.io/space
;;
;;   Racket documentation for `member,` which was really useful for the maddish libs
;;      https://docs.racket-lang.org/reference/pairs.html
;;   Project Gutenburg record of Alice's Adventures in Wonderland by Lewis Caroll
;;      https://www.gutenberg.org/ebooks/11
;;
;;   PDF covering diphthongs and vowel combos that was helpful in counting syllables
;;      https://www.waikato.ac.nz/__data/assets/pdf_file/0005/314456/Word-lists-for-Vowels-Diphthongs.pdf
;;   PDF describing one particularly programatic syllable-counting method
;;      https://www.howmanysyllables.com/syllable_rules/howtocountsyllables
;;   Presentation showing how to identify silent E's
;;      https://ckla.amplify.com/skillsboost/wp-content/uploads/2020/08/G3_TeacherExtension_W1_D4.pdf
;;   Help figuring out recursion over lists
;;      Hallie, Nameera,
```

Questions
---------

### Racket questions

Could you explain `member` (or `member?`)?

> `(member? val lst)` takes a value and a list and determines whether or
  not the value appears in the list.

> ```
(define member? 
  (lambda (val lst)
    (cond
      [(null? lst)
       #f]
      [(equal? val (car lst))
       #t]
      [else
       (member? val (cdr lst))])))
```
> `(member val lst)` takes a value and a list and returns either (a)
  the portion of the list starting with val, if val appears in the list,
  or (b) false, if val does not appear in the list.
    
### Reading questions

When using struct do we ever have to use `define` or does `struct` 
serve as the definition?

> `struct` implicitly defines all the procedures (the constructor,
  the basic predicate, the extractors, mutators if we permit them,
  etc.)

Can you summarize the main idea in the precondition testing reading?

> Sometimes programmers provide incorrect parameters to the procedures
  we create.  We may want to issue an error when that happens.  We can
  use the `error` procedure to do that.

Why didn't you have us do preconditions earlier?

> Um ... I'm not sure.

Why would I create a new data type when I could just put data in a
pre-existing structure like lists, vectors or hash-tables?

> Data abstraction!  This takes us further along the path that "the 
  implementation doesn't/shouldn't matter".

> It's less work to write `(struct foo (a b c))` than to write the 
  five procedures that command generates.

> Data protection / program safety.  Client programmers can't do
  things with our structures other than what we permit.  (More or
  less.) If you use a hash table or a vector, clients might be able
  to mutate them when we don't want them to.

### Other issues

Do you plan to distribute grade reports soon?

> Yes; sometime this weekend.

I like CS.  What should I take next year.

> CSC-161, Imperative Problem Solving, is the next course in our 
  introductory sequence.  Cute robots!

> CSC-207, Objects, Data Structures, and Algorithms, follows 161.

> If you are considering a CS major, you might also look toward 
  MAT/CSC-208 or MAT-218, which provide the mathematical foundations 
  of CS.  (Taking one of the two is required for the major.)

Does SamR do summer MAPs?

> Sometimes, but not this summer.

Lab
---

### Preparation

* Have the normal start-of-lab discussion.
* There's an extra file to download.

### During Lab

Add `(define chirp-contents chirp-kernel-contents)` (and similar).

### Wrapup

`; SAM SAID I CAN STOP HERE`

Another token activity.
