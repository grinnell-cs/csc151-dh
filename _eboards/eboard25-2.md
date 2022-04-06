---
title: "EBoard 25 (Section 2): Abstract Data Types"
number: 25
section: eboards
held: 2022-04-06
link: true
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [~5 min]
* Racket stuff [~5 min]
* Questions [~15 min]
* Lab [~55 min]

Administrivia
-------------

### Introductory notes

* Sorry that we did not have our Monday mentor session.  I think we're
  back on track now.
* If you have not yet done so, please sign up for an individual site
  on <https://sites.grinnell.edu>.

### Class mask policy

* We will continue to wear masks until at least the next course survey.

### Reminders

* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* Evening tutors are available 7--10 p.m. Sunday through Thursday as
  well as 3--5 p.m. on Sunday.
* Mentor sessions are Monday 8--9 p.m.  Wednesday, 8--9 p.m., Sunday 4--5 p.m.

### Upcoming work

* ASAP: Sign up for a site on <https://sites.grinnelledu>
* Thursday 10:00 p.m.: Reading for Friday (Structures)
    * Warning!  I may be updating the reading at lunchtime.
* Thursday 10:30 p.m.: Today's lab
    * Likely "Sam says stop here"
* Thursday 10:30 p.m.: MP 5
* Sunday 4:00 p.m.: Quiz 9: Vectors (Distributed Friday)
* Thursday, April 14, 10:30 p.m.: SoLA 3

### Sample Quiz

_Design and write functions (potentially recursive functions) that utilize vectors._

Write a procedure, `(vector-swap-neighbors! vec)` that takes an even-length vector as a parameter and swaps the neighboring elements (those at indices 0 and 1, those at indices 2 and 3, etc.).

```
> (define vec (vector 'a 'b 'c 'd 'e 'f))
> (vector-swap-neighbors! (vector 'a 'b 'c 'd 'e 'f))
> vec
'#(b a d c f e)
```

_Hint: You will find a let binding helpful._

### Other Sample Quiz Questions

Check out [Sample SoLA 3](../las/sample-sola-3).

### Upcoming Token-Generating Activities

* Thursday 11am, Convocation, Stephanie Jones, JRC 101
* Grinnell Singers Sunday at 2pm

### Other Upcoming Activities

* Saturday 1pm, Softball vs. University of Wisconsin Stevens Point
* Saturday 3pm, Softball vs. University of Wisconsin Stevens Point
* Reminder that there's a union election

Racket/Lab Stuff
----------------

### `add-word!`

How most of you defined `(add-word! counts word)`

```
(define add-word!
  (lambda (counts word)
    (if (hash-has-key? counts word)
        (hash-set! counts word (+ 1 (hash-ref counts word)))
        (hash-set! counts word 1))))
```

Another approach

```
(define add-word!
  (lambda (counts word)
    (hash-set! counts word (if (hash-has-key? counts word)
                               (+ 1 (hash-ref counts word))
                               1))))
```

Another approach: There is a three-parameter version of `hash-ref`.
`(hash-ref hash key default)`, returns the third parameter if the 
key is not in the table.  We could use that.

```
(define add-word!
  (lambda (counts word)
    (hash-set! counts word (+ 1 (hash-ref counts word 0)))))
```

I might even take it a step further and write a separate
`word-count` procedure.

```
;;; (word-count counts word) -> integer?
;;;   counts : hash? (string -> integer)
;;;   word : string?
;;; Determine how many times word has been added to counts.
(define word-count
  (lambda (counts word)
    (hash-ref counts word 0)))

(define add-word!
  (lambda (counts word)
    (hash-set! counts word (+ 1 (word-count counts word)))))
```

I suppose `count-word!` would have been better than `add-word!`.

### "Functional nature"

A quote from the official Racket documentation.

> A hash table is also either mutable or immutable. Immutable hash
tables support effectively constant-time access and update, just
like mutable hash tables; the constant on immutable operations is
usually larger, but **the functional nature of immutable hash tables
can pay off in certain algorithms**.
<https://docs.racket-lang.org/reference/hashtables.html> (emphasis
mine)

Note that "functional nature" refers to our pre-vectors experience
with values and procedures: Procedures do not change their parameters;
procedures return new values.

### Mutable and immutable hash tables

In case you didn't discover this, `hash-set` and `hash-remove` will not
work with mutable hash tables, only immutable hash tables.

Questions
---------

### MP5 Questions

How can I extract all of the one-syllable words from a list?

> ```
(define one-syllable?
  (lambda (word)
    (= 1 (syllables word))))

(define one-syllable-words
  (lambda (words)
    (filter one-syllable? words)))
```

> I assume that you will find a way to generalize that solution.

How do I find words for which my syllables procedure misbehaves?

> If you build the _Jane Eyre_ syllex, you'll likely see some examples.

But won't I just fix those issues?

> At some point, you can stop fixing issues.  Some will likely be
  beyond what it's worth your time to fix.

How many issues is enough to fix?

> The rubric says something like "two additional rules beyond 'Count
  all of the vowel sequences'".

### Racket questions

How are hash tables implemented?

> That's beyond the scope of this course.  You'll learn about them in 
  CSC-207.  You could also check out 
  [Micah's 'blog post](https://www.micahcantor.com/blog/mutable-hash-racket/).

> It turns out the immutable hash tables are implemented as balanced
  binary search trees, rather than as traditional hash tables.  (Yup,
  also outside the scope of the course.)

### Reading questions

How would you solve self-check 1?

_Write a procedure, `(name->string name)`, that takes a name (in any representation) and converts it to the appropriate string._

> Here's a starting point.

> ```
(define name->string
  (lambda (name)
    (string-append (if (name-prefix name) 
                       (string-append (name-prefix name) " ")
                       "")
                   (name-given name)
                   (if (name-middle name) 
                       (string-append " " (name-middle name))
                       "")
                   (if (name-family name) 
                       (string-append " " (name-family name))
                       "")
                   (if (name-suffix name) 
                       (string-append " " (name-suffix name))
                       ""))))
```

> Since there's repeated code, I'd probably write a helper.

> ```
(define name->string
  (let ([optional-space (lambda (str) (if str (string-append " " str) ""))])
    (lambda (name)
      (string-append (if (name-prefix name) 
                         (string-append (name-prefix name) " ")
                         "")
                     (name-given name)
                     (optional-space (name-middle name))
                     (optional-space (name-family name))
                     (optional-space (name-suffix name))))))
```

> Big idea on data abstraction: If you rely only on the provided procedures,
  and don't make assumptions about the underlying representation, our code
  will continue to work even if we change the representation.

Can you explain the following code?

```
        [(not (string-or-false? prefix))
         (error "name: Invalid prefix:" prefix)]
```

> This ensures that if the prefix is invalid, we get a sensible error,
  and we get it as soon as we attempt to build a name.

How would you solve self-check 2?

_Suppose we were planning to represent names as strings with the components separated by vertical bars. For example, `"|Barack|Hussein|Obama|II"` or `"Queen|Elizabeth|||II"`. Sketch how you would extract the various parts of the name (e.g., using string-split or regular expressions)._

> You'll try this in lab.  Discuss ideas with your partner.

Could you explain the following code, which comes from the definition of one of the versions of `name`?

```
(cond
  [(and (not (string? prefix)) prefix)
   (error "name: Invalid prefix:" prefix)]
```

> Our goal is to issue an error if the prefix is invalid
  (neither a string nor false).

> Let's see what happens if `prefix` is a string.

> ```
    (and (not (string? "Queen")) "Queen")
--> (and (not #t) "Queen")
--> (and #f "Queen")
--> #f
```

> Since the guard is false, we do not issue the error message
  and skip on to the next cond block.

> Now let's see what happens if `prefix` is false.

> ```
    (and (not (string? #f)) #f)
--> (and (not #f) #f)
--> (and #t #f)
--> #f
```

> What if `prefix` is invalid? Let's try that with the symbol 'invalid.

```
    (and (not (string? 'invalid)) 'invalid)
--> (and (not #f) 'invalid)
--> (and #t 'invalid)
--> 'invalid
```

> Since the guard is truish, we report the error and stop.

> I've revised the reading to make it clearer, and you'll see clearer
  code in the lab today.

### Other issues

When is our final?

> Our final is optional; it is a chance to complete any learning assessments
  you have not completed.

> It will be much like every other SoLA.  Short problems, 60-minute time
  limits.

> I plan to release it at 8:00 a.m. on Tuesday of finals' week and have
  it due at 5:00 p.m. on Friday of finals' week.

How many things must I do for an A?

> See the syllabus.

Lab
---

### Preparation

* Have the normal start-of-lab discussion.
* Read over the code.
* Save the file as `data-abstraction.rkt`
* Four other files, too!

### During Lab

To switch implementations, comment out `(require (file "names-as-lists.rkt"))`
and uncomment another implementation.

`names-as-bar-strings.rkt` is an incomplete implementation.  You will finish
it later (Exercise 4, I believe).

Exercise 3: There is a standard for sort order.  The lab contains a link
for more info.

Exercise 3: There seems to be ambiguity on "Queen Elizabeth II".  My take
is that since "Queen Elizabeth" is sorted as "Queen Elizabeth" and we
would want "Queen Elizabeth" and "Queen Elizabeth II" to be neighbors in
sort order, "Queen Elizabeth II" is sorted as "Queen Elizabeth II", not
"Elizabeth Queen II".

### Wrapup

`; SAM SAID I CAN STOP HERE`

Turning it in ...

* Make sure that you require `names-as-lists.rkt` and not the rest.
* Turn in `data-abstraction.rkt`, `names-as-lists.rkt`, and
 `names-as-bar-strings.rkt`.

