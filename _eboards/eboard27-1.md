---
title: "EBoard 27 (Section 1): Marking Text"
number: 27
section: eboards
held: 2022-04-11
link: true
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [~5 min]
* Questions [~25 min]
* Lab [~50 min]

Administrivia
-------------

### Introductory notes

* My computer broke on Friday night.  My productivity is significantly
  decreased and is likely to remain that way for the near future.
* Don't forget that we will have admitted students this week.  Be
  prepared to ask them questions and to answer their questions.
* Note that we will not have a Wednesday mentor session since SoLA 3
  will be live.
    * Monday's mentor sessions will be reviews for the SoLA.

### Class mask policy

* We will continue to wear masks until at least the next course survey
  (that is, through Friday the 15th).

### Reminders

* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* Evening tutors are available 7--10 p.m. Sunday through Thursday as
  well as 3--5 p.m. on Sunday.
* Mentor sessions are Monday 8--9 p.m.  Wednesday, 8--9 p.m., Sunday 4--5 p.m.

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

### Upcoming work

* Tuesday 10:00 p.m.: Reading for Wednesday
    * Just rewritten.  Feedback appreciated!
* Tuesday 10:30 p.m.: Today's lab
    * Likely "Sam says stop here"
* Thursday, April 14, 10:30 p.m.: SoLA 3
    * Distributed Wednesday at 2:30 pm
    * Don't forget that there are sample questions on the LAs page.
   
### Upcoming Token-Generating Activities

* Wednesday, April 13, all day: Scarlett and Give Back Day
    * Token for donating.  (Equity: On Wednesday, you can grab $5 from me 
      to donate.)
        * Recommend: Food Pantry, Student Mental Health, Accessibility
    * Token for participating in an activity.
* Wednesday, April 13, 8pm, Writers@Grinnell: Jerald Walker, 
  <https://grinnellcollege.zoom.us/j/85126108306>

### Other Upcoming Activities

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

### Processing vectors (failed)

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
'#(1 2 "three" "four")
'#(2 3 "xthree" "xfour")
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
           (vector-increment/kernel! (vector-set! vec pos (+ 1 val)) 
                                     (+ pos 1))]
          [(string? val)
           (vector-increment/kernel! (vector-set! vec pos (cons "x" val))
                                     (+ pos 1))]
          [else
           (vector-increment/kernel! (vector-set! vec pos val)
                                     (+ pos 1))])))))
```

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
           (vector-set! vec pos (cons "x" val))])
        (vector-increment!/kernel vec (+ pos 1))))))
```

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
             [string-case (vector-set! vec pos (string-append "x" (current-val)))])
        (cond
          [(number? current-val)
           number-case]
          [(string? current-val)
           string-case])
        (vector-increment!/kernel vec (+ pos 1))))))
```

### Better precondition testing

Having to write all of those `(define foo-x foo-kernel-x)` is a PITA.
Is there a better way?

> Yeah, I think so.

### Mutable structs

I want to make my structures mutable.  Is that possible?

> As we've seen, there are some disadvantages to mutable types.  But yes,
  you can make structures mutable.

> Option 1: Add `#:mutable` to the struct definition.  That provides
  procedures of the form `set-struct-field!`, e.g., `set-clock-hours!`.

> Option 2: Write fields as `[field #:mutable]`.

### Racket questions

### Reading questions

### Other issues

Lab
---

### Preparation

* Have the normal start-of-lab discussion.
* Today's lab will be very different.

### During Lab

### Wrapup


