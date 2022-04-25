---
title: "EBoard 33 (Section 1): Tail Recursion"
number: 33
section: eboards
held: 2022-04-25
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

* We may have admitted students today.
* You may want to return to using the keyboard wipes, if you haven't already
  been doing so.
* Don't forget that Wednesday is a "work differently" day.  No class!
  I will likely be available on Teams.
* I distributed current standing last night.
    * Tokens have not been updated.
    * The last few readings/labs have not been graded.
* I am still catching up on everything.  3-4 days of almost no work put
  me behind.

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

### Upcoming work

* Tuesday, April 26, 10:30 p.m.: MP 6 (Optional)
    * Unfortunately, the submission area won't be open until tomorrow.
* Thursday, April 28, 10:00 p.m.: Reading for Friday (Trees)
* Thursday, April 28, 10:30 p.m.: Lab writeup from today
    * "Sam said I can stop here."
* Sunday, May 1, 4:00 p.m.: Quiz (Tail Recursion)

### Upcoming Token-Generating Activities

* Tuesday @ 4:15pm: W@G Roundtable
* Tuesday @ 8:00pm: Mando Memorial W@G Reading (JRC 101)
* Thursday @ 11am: Convocation (Kernel)
* Thursday @ 3pm: Softball (Diamond)
* Thursday @ 4pm: Kasimov Talk (JRC 101)
* Thursday @ 4pm: McKibben Lecture (HSSC A2231 - Auditorium)
* Thursday @ 5pm: Softball (Diamond)
* Saturday @ 2pm: GSO (Sebring-Lewis)
* Sunday @ 1pm: Softball (Diamond)
* Sunday @ 3pm: Softball (Diamond)

### Other Upcoming Activities


Sample quiz questions
---------------------

## Tail recursion

_Transform recursive functions into tail-recursive functions._

At times, we may not be sure whether or not a random procedure we write will ever produce a value we expect.  Consider, for example, the following procedure.

```
;;; (random-color) -> string
;;; Generates an "unpredictable" color, with colors appearing in
;;; different frequences.
(define random-color
  (lambda ()
    (let ([val (random 100)])
      (cond
        [(< val 50)
         "red"]
        [(< val 75)
         "blue"]
        [(< val 99)
         "purple"]
        [else
         "lavender"]))))
```

It can be time-consuming and annoying to type the procedure name again and again and check for the answer.  For example, we might want to see if the procedure we wrote ever produces `"lavender"`.

```
> (random-color)
"purple"
> (random-color)
"blue"
> (random-color)
"red"
> (random-color)
"red"
> (random-color)
"red"
> (random-color)
"blue"
```

Exciting, isn't it?

What's the solution?  We can write a procedure that does lots and lots and lots of calls to `random-color` for us.  I've generalized it.

```
;;; (random-experiment rproc val n) -> integer?
;;;    rproc : zero-parameter-procedure?
;;;    val : any?
;;;    n : integer?
;;; Runs `rproc` n times and counts how many times it equals `val`
(define random-experiment
  (lambda (rproc val n)
    (cond
      [(zero? n)
       0]
      [(equal? (rproc) val)
       (+ 1 (random-experiment rproc val (- n 1)))]
      [else
       (random-experiment rproc val (- n 1))])))
```

Let's see how it works.

```
> (random-experiment random-color "lavender" 1000)
9
> (random-experiment random-color "lavender" 1000)
5
> (random-experiment random-color "red" 1000)
534
> (random-experiment random-color "violet" 1000)
0
```

Unfortunately, for the number of experiments we will typically do (in the thousands or more), this can build up a lot of delayed `+1` expressions, which can slow down our computation.  As you know, a typical solution to this problem is to use tail recursion.

Rewrite `random-experiment` using tail recursion.

Groups
------

Questions
---------

### MP6 questions

If I don't do MP6, how will it show up?

> It will show up as an I.  But there are only six total MPs expected
  on the rubric.

### Racket questions

How do I write an interactive program?

> See the email.

### Reading questions

Can you explain tail recursion a bit more?

> In direct recursion, we do the recursive call and then post-process
  the recursive result.  In fact, that's how we're taught to think about
  regular recursion: "Suppose the recursive call succeeds; what next?"

> `(do-something-to (car lst) (recursive-proc (cdr lst)))`

> In tail recursion, we keep track of an intermediate result (`so-far`) 
  and update the intermediate result before doing the recursive call.

> `(recursive-helper (do-something-to (car lst) so-far) (cdr lst))`

> As we've seen from tracing, in direct recursion, once we've reached the 
  base case, we have a lot of accummulated "post processing" to do.

> In tail recursion, once we've reached the base case, we can return
  the computed intermediate result immediately (or a slight variant
  thereof).

Which of these are tail recursive?

```
(define factorial-01
  (lambda (n)
    (letrec ([factorial-helper
             (lambda (n so-far)
               (if (zero? n)
                   so-far
                   (* (factorial-helper (- n 1) n) so-far)))])
        (factorial-helper n 1))))

(define factorial-02
  (lambda (n)
    (letrec ([go (lambda (n sofar)
                   (match n
                     [0 1]
                     [_ (* n (go (- n 1) sofar))]))])
      (go n 0))))

(define factorial-03
  (lambda (n)
    (letrec ([kernel (lambda (i result)
                        (if (> i n)
                            result
                            (kernel (+ i 1) (* result i))))])
      (kernel 1 1))))

(define factorial-04
  (lambda (n)
    (letrec ([go (lambda (n)
                   (* n (factorial-04 (- n 1))))])
      (if (zero? n)
          1
          (go n)))))

(define factorial-05
  (lambda (n)
    (letrec ([kernel (lambda (n)
                       (* n (kernel (- n 1))))])
      (if (zero? n)
          1
          (kernel n)))))

(define factorial-06
  (lambda (n)
    (letrec ([helper
              (lambda (so-far i)
                (match i
                  [0 1]
                  [n (helper (* so-far n) (- n 1))]))])
      (helper 1 n))))

(define factorial-07
  (lambda (n)
    (letrec ([factorial-helper
              (lambda (n so-far)
                (if (zero? n)
                    so-far
                    (factorial-helper (- n 1) (cons n so-far))))])
      (apply * (factorial-helper n '())))))

; factorial-07 is tail recursive, but it is not a good design, since
; it builds an unnecessary list.

(define factorial-08
  (lambda (n)
    (letrec([go (match n
                  [0 1]
                  [1 1]
                  [n (factorial-08 (- n 1))])])
      (* n go))))
```

; factorial-08 is NOT tail recursive.  After the recursive call, it
; still multiplies by n.  That multiplication is just hidden elsewhere.

Some traces

```
(define factorial-03
  (lambda (n)
    (letrec ([kernel (lambda (i result)
                        (if (> i n)
                            result
                            (kernel (+ i 1) (* result i))))])
      (kernel 1 1))))

    (factorial-03 5)
--> (kernel 1 1)
    ; i (1) is not greater than 5
--> (kernel 2 1)
    ; i is 2, result is 1; i is not greater than 5
--> (kernel 3 2)
    ; i is 3, result is 2 ; i is not greater than 5
--> (kernel 4 6)
    ; i is 4, result is 6 ; 4 is not greater than 5
--> (kernel 5 24)
    ; i is 5, result is 24; 5 is equal to, but not greater than 5.  False part
--> (kernel 6 120)
    ; i is 6, result is 120; 6 is greaer than 5.  Return the reslt
--> 120
```

### Other questions

Can I skip MP7 if I do MP6?

> No.  MP7 is required.

How much work is left?

> One optional mini-project (MP6)

> One required mini-project (MP7) + presentation

> Four labs (M, F, M, F)

> Three sets of readings (F, M, F)

> Two more quizzes and two more SoLAs, with five more topics

What are the seven topics for phase 4?

> Markup (quizzed)

> Higher-order procedures (quizzed)

> Tail recursion (today; quiz Friday)

> Tree recursion (topic covered Friday/Monday)

> Running time (topic covered Friday the 6th)

> Searching (topic covered Friday the 6th)

> Functional vs. imperative programming (discussed previously)

What happens if I get fewer than 21 LAs?

> You (probably) won't get a C or above.  Let's talk.

Lab
---

### Preparation

### During lab

### Post lab

* `; SAM SAYS WE CAN STOP HERE!`
