---
title: "EBoard 07 (Section 1): Pair Programming"
number: 7
section: eboards
held: 2022-02-09
link: true
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [15 min]
* Questions [?? min]
* Discussion [Approximately 60 min]

Administrivia
-------------

### Introductory notes

* I hope you had a pleasant "work differently" day.
* Today is a "teach differently" class.  It will be mostly discussion,
  with no on-computer lab.
* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* Evening tutors are available 7--10 p.m. Sunday through Thursday.
* Mentor sessions are Wednesday, 8--9 p.m., Sunday 4--5 p.m., Monday 8--9 p.m.
    * No Mentor Session next Wednesday (SoLA 1)
* Note that 02-05-2022 is an ambiguous date, as is 02/05/2022.
  I much prefer that you use the unambiguous YYYY-MM-DD format.
* When you need to finish a lab outside of class, and can't get a 
  problem in a reasonable amount of time, it's okay to say "This is 
  as good as I could do".
* **Do not divide work on labs!  Both partners should be working
  together on all the problems.**

### Attendance / Mispronunciations

* Sam has names arranged in random order and will attempt to read them
  again.
* When you hear your name, say your name again and say how you used your
  Learn Differently Day.

### Racket notes / Debrief from last lab

* Sorry about the `median-of-three?` vs. `median-of-three` issue.
* Please do not put your `lambda` on the same line as your `define`.
* Please do not cram stuff together.  Always have a space between
  a procedure and its parameters.  No `(+(- 2)3)` or anything like that.
* Please limit the length of your lines and the number of "words"
  on a line.
* "Please" is short for "If you ignore me, you will likely lose points."

#### Zen of Booleans

* Aspect one: Avoid explicit `#t` and `#f`.
    * `(if TEST #t #f)` is a long way to write `TEST`
* Aspect two: Use `and` and `or` instead of `if` and `cond`

Example

```
(define non-integer-number?
  (lambda (x)
    (cond
      [(integer? x)
       #f]
      [(number? x)
       #t]
      [else
       #f])))

(define non-integer-number?
  (lambda (x)
    (and (number? x) 
         (not (integer? x)))))
```

#### Different ways of thinking

```
; Direct tests
(define median-of-three
  (lambda (x y z)
    (cond
      [(or (<= x y z) (<= z y x))]
       y]
      [(or (<= x z y) (<= y z x))]
       z]
      [(or (<= y x z) (<= z x y))]
       x]
      [else
       (error "math makes no sense")])))

: Nested ifs
(define median-of-three
  (lambda (x y z)
    (if (<= x y)
        (if (<= y z)
            y
            (if (<= x z)
                z
                x))
        (if (<= x z)
            x
            (if (<= y z)
                z
                y)))))

; Mathy
(define median-of-three
  (lambda (x y z)
    (- (+ x y z) 
       (min x y z) 
       (max x y z))))

; MinMax
(define median-of-three
  (lambda (x y z)
    (min (max x y) (max x z) (max y z))))
```

Sam's tests

```
(test-equal? "in order" (median-of-three 1 2 3) 2)
(test-equal? "in reverse order" (median-of-three 10 3 1) 3)
(test-equal? "median first, largest last" (median-of-three 4 2 5) 4)
(test-equal? "median first, largest second " (median-of-three 5 8 1) 5)
(test-equal? "median last, largest first" (median-of-three 11 5 6) 6)
(test-equal? "median last, largest second" (median-of-three 1 11 7) 7)
(test-equal? "all equal" (median-of-three 8 8 8) 8)
(test-equal? "first two equal, third larger" (median-of-three 9 9 10) 9)
(test-equal? "first two equal, third smaller" (median-of-three 0 0 40) 0)
(test-equal? "last two equal, first larger" (median-of-three 3 1 1) 1)
(test-equal? "last two equal, first smaller" (median-of-three 0 2 2) 2)
(test-equal? "outside equal, first larger" (median-of-three 3 5 3) 3)
(test-equal? "outside equal, first smaller" (median-of-three 4 2 4) 4)
(test-equal? "fractions" (median-of-three 1 2 3/2) 3/2)
(test-equal? "includes negatives" (median-of-three 3 -4 11) 3)
(test-equal? "all negative" (median-of-three -3 -5 -4) -4)
```

Note: TPS is "Think, Pair, Share" (or Talk to Person Sitting nearby)

Note: TLA is a Three Letter Acronym

Which do you prefer?  Why? (TPS)

* The one with the direct conditionals (very popular)
    * We did it
    * Easiest to read
* Minmax (about six)
    * "It's the one I came up with"
    * "It's really short"
    * I managed to avoid conditionals on a lab about conditionals.
* Nested if (3)
    * It's efficient
    * My brain "learns differently" so that's how I tend to write things
* The mathy one
    * I didn't write it that way and it let me think differently

What hasn't Sam tested? (TPS)

* Inexact numbers.  Sometimes weird things happen with inexact numbers.

### Gradescope notes

* Gradescope doesn't let us give categorical grades, so you get numbers.
* For S/N, S is 1 and N is 0.
* For E/M/R/I, E is 3, M is 2, R is 1, N is 0.
* For everything, the autograder scores have no effect (other than to see
  what you might have had problems with).
    * E.g., 1.9999 is a 1.
* We'll look at how you check grades on Gradescope.

### Upcoming work

* Quiz 3 Friday: Conditionals
* Readings for Friday due Thursday at 10:00 p.m.
* Lab writeup from today due Thursday at 10:30 p.m.
    * Individual
* Mini-Project 2 due Thursday at 10:30 p.m.
    * On Gradescope
    * Autograder is live; I think it's bug-free.
* Mini-Project 1 redo due Sunday the 20th at 10:30 p.m.
* SoLA 1 to be released next Wednesday at 2:30 p.m.  Due next Thursday
  at 10:30 p.m.

### About SoLAs

* A SoLA has a bunch of questions very much like the quiz questions.
* You get an hour for each question.  It's designed to take 10--15 
  minutes.
* If you get a question right, you've checked off one of the learning
  goals.
    * If you have credit, please don't try it again on future
      SoLAs.
* If you don't get a question right, you can try again on the next SoLA.
    * And you should talk to someone in advance to make sure you
      understand what you didn't understand.
* I add seven new learning goals on each SoLA (except SoLA 5).
* You can see the learning goals on the LAs link at the top of each page.
* You can also see a sample set of questions for the first SoLA.
* You may use DrRacket, your notes, the Course Web site, and the
  Racket documentation.  You may not use other people for help, nor
  may you search the Interweb.
* There are no mentor sessions on nights during the SoLA.
* Sam will not generally answer questions on the SoLA (but will fix bugs).

### Sample Quiz Question

_Utilize boolean expressions and values in a program to produce conditional behavior._

As you know, we often associate words with students' standing in
college.  At Smileyville College, Those who have completed fewer
than four terms are "freshlings", those who have completed between
four and seven terms (inclusive) are "wise fools", those who have
completed between eight and eleven terms (inclusive) are "subordinates",
and those who have completed at least twelve terms are "elders".

Write a procedure, `(status terms)`, that, given the number of
terms a student has completed as input, produces a string that
describes the student using the terms above.

### Upcoming Token-Generating Activities

* Mentor sessions.
* Grinnell Lecture, Thursday, 11am
* Track & Field, Darren Young Invite, Saturday, 10am

### Other Upcoming Activities

Questions
---------

### From the readings

_There weren't many questions on these readings._

Are you one of those professors that allows us to leave group
members' names off of projects if their contributions were
unsatisfactory? Or do you prefer to move around group members?

> Your primary group projects will be labs.  They are small enough
that I don't think it's an issue.

> Our bigger worry is partners who plow ahead without making sure
that their partner contributes / understands.

> In both cases, you should talk to me (or a mentor).

What happens if our lab partners are unwilling to meet outside of
class to finish a lab?

> You can finish the lab separately.  But I'll try to make sure
that most labs are finished in class.

If I'm sitting at a lab with a partner, and have no clue what I am
doing how should I work to be useful, while also being involved
with the lab?

> Ask questions.

> Obligatory story.

### Questions I'm not answering out loud

Who writes the autograders?

> I do.  I'm rewriting all of them this semester.

How long does it take you?

> It varies.  Usually about an hour for a lab and longer for a mini-project.
  In most cases, I also do (or re-do) the lab or mini-project, which adds
  additional time.  The MP2 autograder + answers + fixing took me about 
  three hours.

### Other questions

Pair Programming Pursued
------------------------

_We spent long enough on the introductory material that we skipped this section._

Discuss with your partner and be ready to answer.

* What did you find surprising in the readings?
* What outstanding questions do you have about pair programming in
  CSC-151?

### Surprising

### Questions

Pair Programming in Practice
----------------------------

* You should have received a card from Sam or one of the mentors.
* These represent approximate quotations from past CSC-151 students 
  (anywhere from midway through the semester to a few years after 
  they took CSC-151).
* I will ask you to read them aloud so that you hear them in the 
  voices of students.
* Listen carefully for comments that resonate or that you’d like 
  to discuss further.
* We will think, pair, and share.
* There's an *individual* lab for you to fill out.

### Comments that resonated

* Keyboard being pulled away was really hurtful.
* My partner asked me out on a date.
* People misjudge me because of my letter jacket.
* My partner doesn't understand why I won't work on Saturdays.
    * Might have other work on Saturdays.
    * You don't know someone else's life or schedule.
    * Might want to preserve Saturdays for non-school things, like hanging
      out with friends.
    * Perhaps a religious obligation.
* There are lots of different viewpoints and experiences.

### Other thoughts

* We like the idea of pair programming.  It seems like it's helpful.
  We need good partners, though.
* There's a psychological principle that people who know more tend to
  underestimate themselves and people who know less tend to overestimate
  themselves.  Working with a partner lets you norm yourself and improve
  your knowledge.
    * Plus: The person who thinks they know it all doesn't.
* It's nice to have someone you can ask questions from.  (Of course,
  you can also ask Sam or the mentors.)
* It's really nice that my partner can log in when the computer decides
  it hates me.
* It's really nice when I'm struggling to answer one of Sam's questions and 
  my partner gently suggests an answer.
* Since there are often many different ways to solve a problem, it's nice
  to talk to someone else who might come up with a different solution than
  I would come up with on my own.

### What would you like to promise to each other to address the problems and cultural differences?

* "We'll stop talking when Sam walks by so that he can't overhear us."
* "I'll do the readings before class so that I'm prepared to contribute."
* "We'll make sure that we agree when it's time to switch Driver and 
  Navigator."
* We have different ways of using the readings.  Some of us seem to have
  memorized them.  Others have taken notes.  Others want them up while
  we are doing the lab so they can check back.  I'll support my partner's
  approach and make clear my own.
* "We will confront problems in the moment, telling our partner when they
  are not behaving up to standards (or discussing the issue with one of
  the course staff)."
* "Have respect for your partner; understand their differences, including
  the other things that may be going on in their life."
* "Be kind."
