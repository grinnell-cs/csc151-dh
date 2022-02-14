---
title: "EBoard 09 (Section 3): Lists, Continued"
number: 9
section: eboards
held: 2022-02-14
link: true
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [~10 min]
* Questions [?? min]
* Discussion [Approximately 60 min]

Administrivia
-------------

### Reminders

* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* Evening tutors are available 7--10 p.m. Sunday through Thursday as
  well as 3--5 p.m. on Sunday.
* Mentor sessions are Wednesday, 8--9 p.m., Sunday 4--5 p.m., Monday 8--9 p.m.
    * No Mentor Session next Wednesday (SoLA 1)

### Introductory notes

* Happy Valentine's Day!  I care about you all (in a non-romantic way).
* I accomplished less than I had planned this weekend.  Stay tuned
  for grading and such.

### Racket notes

Here's one version of the code from last lab.

```
(define string->integer
  (lambda (str)
    (apply +
           (map *
                (string->digits str)
                (reverse (map (section expt 10 <>) 
                              (range (string-length str))))))))
```

People who have programmed before tend to want to use `string-ref`
or `list-ref` and try to deal with the characters individually.  One
nice things about Scheme (and most functional languages) is that you can
process the digits _en masse_.

### Upcoming work

* Readings for Wednesday due Tuesday at 10:00 p.m.
* Lab writeup from today due Tuesday at 10:30 p.m.
    * Let's hope we can finish in class today.
* SoLA 1 to be released Wednesday at 2:30 p.m.  
  It is due Thursday at 10:30 p.m.
* Quiz 4 Friday: Style
* Mini-Project 1 redo due Sunday the 20th at 10:30 p.m. (sooner is better)
* Mini-Project 2 redo due Sunday the 27th at 10:30 p.m. (sooner is better)

### Upcoming Token-Generating Activities

* Mentor sessions.
* CS Study Break, Tuesday, 8:30pm, CS Commons.
* Neuroscience Journal Club, Thursday, February 17, Noon, Noyce 2517.
* Visit the current exhibit in the Grinnell Art Museum.  (At least 15 min.)

### Other Upcoming Activities

Being more efficient
--------------------

I've included the ideas from Friday's email.  You should think/pair/be
ready to share about others.

### In readings

* Acknowledge that it's okay if you don't completely understand the 
  reading or the procedures mentioned in the reading.  We do the labs 
  to help you figure things out better.
* Take notes as you go.
    * Including pointers to things (i.e., find out more about X in ….)
    * Try things out in DrRacket.
    * Including variants of what we do.
* After you finish each reading, write a one-minute summary of the key points.
* Do the self checks.
* Get familiar with Racket documentation.

### In mini-projects

* Start early.  There's some evidence that our subconscious sometimes 
  helps us solve computational problems.
* Keep a list of potentially helpful procedures at hand.
    * Racket procedures you've learned and might use.
    * Procedures you've written
        * You might use them directly
        * You might use them as an example of how to solve certain problems
* Don't be afraid to experiment.
* Don't spend too much time stuck.  If you struggle on a problem for 
  more than five minutes, ask a question.  If you won't get the answer 
  immediately (e.g., if it's on Teams), move on to the next problem.
* It helps to work in 3813/3815, since there are often folks around 
  who might help.
* Other ways to get unstuck.
    * Reread the assignment/problem.
    * Check the Q&A channel for ideas.
* Accept that you might have to re-do parts of the mini-project to 
  achieve the grade you'd like.
* Consider submitting your code early to see potential issues.

Questions
---------

### From the readings (not discussing)

In the first reading, the result of `(flah 0+6i)` is `0-1/3i`. Why is 
the result not `0+1/3i`? 

>  `(1/3)*i + 6*i = 2*i*i.  i*i = -1.  So (6*i)/2 = -1/3*i.`

Why would you use 'o' instead of section if the parameters for 'o'
can only be things like add1 sub1 etc. whereas with section you can
use `-` `+` and `*`?

> Sometimes we'll have procedures that naturally compose, such as
in the `string-reverse` example (which we can't do with `section`).

### From the readings (discussing)

How are anonymous procedures useful?

> Anonymous procedures are useful when you need a "one off" procedure
  that you don't feel like naming.

> "I want all the grades between 80 and 90 (inclusive)."

        (define b-grade?
          (lambda (grade)
            (<= 80 grade 90)))
        (filter b-grade? grades)

        ; vs

        (filter (lambda (grade) (<= 80 grade 90))
                grades)

        ; vs

        (filter (section <= 80 <> 90) grades)

Could you go over `section` a bit more?

> `section` creates a new procedure by "filling in" one or more of 
  the parameters of another procedure (as in the third example above).

> It's useful as a shorthand for exactly those situations when you find 
  yourself writing something like

        (define proc
          (lambda (params)
            (other-proc constant params)))

> Some people find it more like English 

Why don't you have a one-character equivalent for `section` like you
have for `compose` and `lambda`?

> I haven't found a good one.  Any suggestions?

### Other questions

Lab
---

### Preliminaries

* I do not anticipate dropping any problems from today's lab.

### During Lab

### Wrapup

