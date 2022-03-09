---
title: "EBoard 20 (Section 1): Patterns of recursion"
number: 20
section: eboards
held: 2022-03-11
link: true
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [~5 min]
* Racket stuff [~10 min]
* Questions [~5 min]
* Lab [~60 min]

Administrivia
-------------

### Introductory notes

* I hope the SoLA went well.  I look forward to a weekend of intense grading.
* Don't forget: The navigator should check the board once in a while.

### Class mask policy

* Please bring your mask to class.  Wear it if you wish.
* If your partner is wearing a mask, please put on your mask.
* As a member of a high-risk group, I will be wearing a mask at least 
  through spring break.
* Note: Masks remain good for preventing transmission of cold and
  flu and other similar diseases.

### Reminders

* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* Evening tutors are available 7--10 p.m. Sunday through Thursday as
  well as 3--5 p.m. on Sunday.
* Mentor sessions are Monday 8--9 p.m.  Wednesday, 8--9 p.m., Sunday 4--5 p.m.

### Upcoming work

* Today's lab due Sunday at 10:30 p.m.
    * As usual, "SAM SAID I CAN STOP HERE"
* Quiz 7 due Sunday at 4pm: Use higher-order procedures.
* Week seven survey distributed today , due Sunday at 10:00 p.m.
* Reading for Monday's class, also due Sunday at 10:00 p.m.
* MP 5 due next Thursday at 10:30 p.m.  Released today.

### Upcoming Token-Generating Activities

* ???, Forum on Student Unionization (if the forum exists)

### Other Upcoming Activities

Racket/Lab Stuff
----------------

### Rolling dice

#### Starter code

```
(define play-seven-eleven
  (lambda ()
    (cond 
      [(= 7 (pair-a-dice))
       1]
      [(= 11 (pair-a-dice))
       1]
      [else
       0])))

(define pair-a-dice
  (lambda ()
    (+ (roll-a-die) (roll-a-die))))

(define roll-a-die
  (lambda ()
    (random 1 7)))
```

#### Count how many times we win

```
(define count-wins
  (lambda (n)
    (cond
      ; No games -> No wins
      [(zero? n)
       0]
      ; We win (-:  Count it and move on
      [(= (play-seven-eleven) 1)
       (+ 1 (count-wins (- n 1)))]
      ; We lose )-:  Just move on
      [(= (play-seven-eleven) 0)
       (count-wins (- n 1))]
      ; ??? This should never happen
      [else
       (error "Tie!")])))
```

#### Improving the code

```
(define count-wins
  (lambda (n)
    (if (zero? n)
        0
        (+ (play-seven-eleven)
           (count-wins (- n 1))))))
```

#### Observe problem

8/36 rolls win.  So when we play a lot of games, we should win about 8/36
of the time.  If we play 3600 games, we should win approximately 800 times.
Do we?

#### Comments from Dan and Tina

* Blues Brothers, "Rawhide": <https://www.youtube.com/watch?v=RdR6MN2jKYs>
* Tina Turner, "Proud Mary": <https://www.youtube.com/watch?v=T2T5_seDNZE>

#### Further observations

### Random language

The key procedure:


### Morals

* It's harder to test random procedures.
* We can easily create subtle (or not so subtle) errors in simulations;
  it's good to think carefully.
    * We want to call `random` neither too few nor too many times.
* Randomness can be fun.
* `pair-a-dice` is one of the best procedure names ever.

MP5
---

Extensions of the random language exercises ...

Questions
---------

### Reading questions

_Since there wasn't a reading, there shouldn't be any._

### Other issues

Lab
---

### Preparation

* Don't forget to wear your mask if your partner is wearing a mask.
* Have the normal 'start-of-lab' discussion.

### During Lab

### Wrapup

