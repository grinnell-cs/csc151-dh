---
title: "EBoard 27 (Section 3): Marking Text"
number: 27
section: eboards
held: 2022-04-11
link: true
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [~5 min]
* Questions [~35 min]
* Lab [~40 min]

Administrivia
-------------

### Introductory notes

* My computer broke on Friday night.  My productivity is significantly
  decreased and is likely to remain that way for the near future.
    * I will, however, do my best to get grade reports out tonight.
    * We will not have class recordings until my laptop returns.
* Don't forget that we will have admitted students over the next 
  few weeks.  Be prepared to ask them questions and to answer their 
  questions.
* Note that we will not have a Wednesday mentor session since SoLA 3
  will be live.
    * Monday's mentor sessions will be reviews for the SoLA.
* I've changed the SoLA topics slightly.  Markup has been moved to
  the next SoLA (and Friday's quiz).  Precondition checking is now
  on SoLA 3.

### Class mask policy

* We will continue to wear masks until at least the next course survey
  (that is, through Friday the 15th).

### Reminders

* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* Evening tutors are available 7--10 p.m. Sunday through Thursday as
  well as 3--5 p.m. on Sunday.
* Mentor sessions are generally Monday 8--9 p.m.  Wednesday, 8--9 p.m., 
  Sunday 4--5 p.m.

### Upcoming work

* Tuesday 10:00 p.m.: Readings for Wednesday
    * To be rewritten this afternoon; don't start until I tell you to.
    * Feedback appreciated!
* Tuesday 10:30 p.m.: Today's lab
    * Definitely "Sam says stop here"
* Thursday, April 14, 10:30 p.m.: SoLA 3
    * Distributed Wednesday at 2:30 pm
    * Don't forget that there are sample questions on the LAs page.
   
### Upcoming Token-Generating Activities

* Tuesday, April 12, 1pm: Baseball vs. Cornell
* Tuesday, April 12, 3:30pm: Baseball vs. Cornell
* Wednesday, April 13, all day: Scarlett and Give Back Day
    * Token for donating.  (Equity: On Wednesday, you can grab $5 from me 
      to donate.)
        * Recommend: Food Pantry, Student Mental Health, Accessibility
    * Token for participating in an activity.
* Wednesday, April 13, 8pm, Writers@Grinnell: Jerald Walker, 
  <https://grinnellcollege.zoom.us/j/85126108306>
* Thursday, April 14, 11am, Convocation: Kaushik Basu
* Friday, April 15, 2pm: Baseball vs. Monmouth
* Friday talk.
* Saturday, April 16, 11:00 am, Baseball vs. Monmouth
* Saturday, April 16, 1:30 pm, Baseball vs. Monmouth

### Other Upcoming Activities

* Thursday April 21, 3:00 pm, Softball vs. Simpson
* Thursday April 21, 5:00 pm, Softball vs. Simpson
* Saturday, April 16, 9:00 am, Men's Tennis vs. Monmouth
* Saturday, April 16, 3:00 pm, Men's Tennis vs. Beloit

### Strange Grinnell Tech History

Since I had the "Cheeps" example ...

Before there was Facebook, we had a Grinnell-only social media site
called "Plans".  (It still lives on at <https://grinnellplans.com>.)
Before there was a Web, Plans even existed on our mainframe.  You
could refer to other people with `[username]` (called "planlove")
and you could find out who had referred to you.

A Grinnellian worked with the people who invented Twitter during
the time that they were developing Twitter.  He suggested that they
include something like planlove.  So they added `@username`.

Racket/Lab Stuff
----------------

### Lab notes: `string->clock`

```
(define string->clock
  (lambda (str)
    (apply clock (map string->number (string-split str ":")))))
```

or

```
(define string->clock
  (lambda (str)
    (when (not string? str)
      (error "string->clock: expects a string, recieved" str))
    (let ([parts (string-split str ":")])
      (when (not (= 3 (length parts)))
        (error "string->clock: string must have two colons" str))
      (let ([hours (string->number (car parts))]
            [minutes (string->number (cadr parts))]
            [seconds (string->number (caddr parts))])
        (cond
          [(not hours)
           (error "string->clock: hours must be a number")]
          [(not (exact-integer? hours))
           (error "string->clock: hours must be an exact integer")]
          [(not (<= 0 hours 23))
           (error "string->clock: hours must be between 0 and 23")]
          [(not minutes)
           (error "string->clock: minutes must be a number")]
          [(not (exact-integer? minutes))
           (error "string->clock: minutes must be an exact integer")]
          [(not (<= 0 minutes 59))
           (error "string->clock: minutes must be between 0 and 59")]
          [(not seconds)
           (error "string->clock: seconds must be a number")]
          [(not (exact-integer? seconds))
           (error "string->clock: seconds must be an exact integer")]
          [(not (<= 0 seconds 59))
           (error "string->clock: seconds must be between 0 and 59")]
          [else
           (clock hours minutes seconds)])))))
```

or

```
(define string->clock
  (let ([clock-pattern 
         (rex-concat (rex-repeat (rex-char-range #\0 #\9))
                     (rex-string ":")
                     (rex-repeat (rex-char-range #\0 #\9))
                     (rex-string ":")
                     (rex-repeat (rex-char-range #\0 #\9)))])
    (lambda (str)
      (when (or (not-string? str)
                (not (rex-matches? clock-pattern str)))
        (error "invalid parameter"))
      (apply clock (map string->number (string-split str ":"))))))
```

Morals?

> There's a tradeoff between elegance and robustness.

> We should automate precondition testing (-:

### Processing vectors 

_TPS_

Suppose we want to write a procedure, `(vector-increment! vec)`,
that steps through `vec`, adding 1 to every number and adding an
"x" to the front of every string.

```
> (define sample (vector 1 2 "three" "four"))
> sample
'#(1 2 "three" "four")
> (vector-increment! sample)
> sample
'#(2 3 "xthree" "xfour")
> (vector-increment! sample)
> sample
'#(3 4 "xxthree" "xxfour")
```

What's wrong with each of these solutions?

```
; V1
(define vector-increment!
  (lambda (vec)
    (vector-increment!/kernel vec 0)))

(define vector-increment!/kernel
  (lambda (vec pos)
    (when (< pos (vector-length vec))
      (let ([val (vector-ref vec pos)])
        (cond
          [(number? val)
           (vector-increment!/kernel (vector-set! vec pos (+ 1 val)) 
                                     (+ pos 1))]
          [(string? val)
           (vector-increment!/kernel (vector-set! vec pos (string-append "x" val))
                                     (+ pos 1))]
          [else
           (vector-increment!/kernel (vector-set! vec pos val)
                                     (+ pos 1))])))))
```

Question: Could we use `if` instead of `when`?

> Probably not.  `when` allows multiple consequents, `if` usually
  allows only one.

Problem: The vector-set! returns nothing (or void), so that when we
do the recursive call, the program will report an error, because
we are passing void, rather than the vector, to the procedure.

Not a problem: This procedure doesn't return anything.  That's okay,
this is an `!` procedure.  The `when` is one way to do that.  YOu
can also return nothing with `(void)`.

```
; V2
(define vector-increment!
  (lambda (vec)
    (vector-increment!/kernel vec 0)))

(define vector-increment!/kernel
  (lambda (vec pos)
    (let ([val (vector-ref vec pos)])
      (when (< pos (vector-length vec))
        (cond
          [(number? val)
           (vector-set! vec pos (+ 1 val))]
          [(string? val) 
           (vector-set! vec pos (string-append "x" val))])
        (vector-increment!/kernel vec (+ pos 1))))))
```

Problem: Eventually, `pos` will equal or exceed the length of the vector,
so we will get an out of bounds error.

Fix:

```
(define vector-increment!/kernel
  (lambda (vec pos)
    (when (< pos (vector-length vec))
      (let ([val (vector-ref vec pos)])
        (cond
          [(number? val)
           (vector-set! vec pos (+ 1 val))]
          [(string? val) 
           (vector-set! vec pos (string-append "x" val))])
        (vector-increment!/kernel vec (+ pos 1))))))
```

Moral: Test preconditions before executing code.

```
; V3
(define vector-increment!
  (lambda (vec)
    (vector-increment!/kernel vec 0)))

(define vector-increment!/kernel
  (lambda (vec pos)
    (when (< pos (vector-length vec))
      (let* ([current-val (vector-ref vec pos)]
             [number-case (vector-set! vec pos (+ 1 current-val))]
             [string-case (vector-set! vec pos (string-append "x" current-val))])
        (cond
          [(number? current-val)
           number-case]
          [(string? current-val)
           string-case])
        (vector-increment!/kernel vec (+ pos 1))))))
```

Problem: This evaluates the code in the let *immediately*, not within
the cond.  That means that the code is guaranteed to crash.

### Seeing structures

I don't like seeing things like `#<name>`.  Is there a way that we can
see what's inside a structure, just as we can for vectors and lists?

> Add `#:transparent` to the struct definition.

### Mutable structs

I want to make my structures mutable.  Is that possible?

> As we've seen, there are some disadvantages to mutable types.  But yes,
  you can make structures mutable.

> Option 1: Add `#:mutable` to the struct definition.  That provides
  procedures of the form `set-struct-field!`, e.g., `set-clock-hours!`.

> Option 2: Write fields as `[field #:mutable]`.

### Racket questions

### Reading questions

What did you expect for the self-check?

> _We discussed four possible kinds of markup. Summarize those four types.)

> Something like, "Content, Formatting, Structure, Metadata" 
  (plus a sentence or two describing each).

How do structure and formatting differ?

> Structure indicates *why* we are writing text: "This is the header
  of a section"

> Formatting indicates *how* the text should appear: "This should appear
  in a bold face, larger than the normal text"

How do the readings relate to what we've been doing?

> We've been looking at different ways to represent data.  Markup
  languages are a way to represent data as text.

> The course has a digital humanities focus (of sorts).  Markup is a
  key part of the digital humanities.

> We'll be writing programs that process XML (or HTML).

When would we mark up "nothing"?

> When we want to insert metadata (e.g., the book metadata).

> Some formatting issues, like page breaks and horizontal rules.

I don't fully understand the purpose of tagging—do they serve as
functions or are they there to provide information to a reader?

> They are to provide information for either the program displaying the
  text or the reader/analyst who wants to process the text computationally.

Do we need a special program for creating markup?

> Nope.  You can use any program that lets you edit text files, inluding
  DrRacket.

> You can also write Racket programs that create markup files.

Is there software that makes it easier to write markup?

> Certainly.

> But I'm old, I use plain text editors.

### Other issues

Another question
----------------

_TPS_

What would you do if you saw these ...?

* 23-25
* 27-28 (30?)
* 44-45

Comments

* When things are hard, we try to do it with someone else.  (Perhaps
  they forgot that it was not allowed.)
* Ignore it!  or Just let them redo it.
* Note that something is going wrong if people need to share.
* Send a warning!  This involves trust.
* Sometimes it's just coincidence.

Sam's solution

* Reminder: This involves trust.
* If you are one of the people whose code I showed, please talk to me.
    * You can say "Let's pretend I didn't submit that"
    * You can say "It's a coincidence"

Followup question

* What should I do with the student who asked for a token for attending
  last Thursday's baseball game?

Lab
---

### Preparation

* Have the normal start-of-lab discussion.
* Today's lab will be very different.

### During Lab

* Make sure one of you has a site.  If not, rearrange.

### Wrapup

* To submit: Submit the URL of your site on Gradescope.
