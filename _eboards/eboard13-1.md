---
title: "EBoard 13 (Section 1): Recursion Lab"
number: 13
section: eboards
held: 2022-02-23
link: true
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [~15 min]
* Racket stuff [~0 min]
* Questions [~15 min]
* Lab [~50 min]

Administrivia
-------------

### Introductory notes

* Reminder: Friday is a "no 151" day.  Please spend class time on something
  that makes your life better (sleep, getting ahead on work, time reading,
  etc.)
    * Also: Please give yourself a Friday PSA!
* You should have received a grade sheet from me via email yesterday.
    * Let me know if there are ways I can improve the grade sheets.
* I have written to those of you who struggled on SoLA 1 to offer an
  individual tutor.
    * If you didn't get email from me, have been attending mentor sessions,
      and think you'd benefit from an individual tutor, let me know.
* We will have an observer in class today who wants to see how students
  first encounter recursion.
* I have split MP3 into MP3 (problems 1 and 2 from the old MP3) and 
  MP4 (everything else from the old MP3).
    * Both are due a week from tomorrow.  
    * If you can get the new MP3 in sooner, our graders would appreciate it.
      (If I had thought more, I would have kept the due date.)
    * I'll have the Gradescope entry up tonight, if not sooner.
* Survey response rates
    * Section 1: 16/27 (+1 token)
    * Section 2: 14/26 (+1 token)
    * Section 3: 10/27
    * Let's try for better response rates next time!

### Reminders

* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* Evening tutors are available 7--10 p.m. Sunday through Thursday as
  well as 3--5 p.m. on Sunday.
* Mentor sessions are Wednesday, 8--9 p.m., Sunday 4--5 p.m., Monday 8--9 p.m.

### Upcoming work

* No reading for Friday!  We have a "compute differently" day.
* Monday reading will be updated by tonight.  It's a short reading
  on recursion.
    * As that suggests, we continue to explore list recursion on Monday.
* Today's lab writeup is due Sunday night.  
    * But we hope to finish in lab.
* Quiz 5 due Sunday: Regular expressions
* Mini-Project 2 redo due Sunday the 27th at 10:30 p.m. (sooner is better)
* MP3 due Thursday the 3rd at 10:30 p.m.
    * But if you have it done, submit it asap.
* MP4 due Thursday the 3rd at 10:30 p.m.

### Upcoming Token-Generating Activities

* TONIGHT: Mentor Session
* THURSDAY, 11am, JRC 101, "Physics Is More Than Problem-solving: Building 
  Inclusivity and Belonging by Practicing Professionalism".  Prof Marty Baylor 
  of Carleton College.
* FRIDAY, ??? Concert in Harris Gym, Magdalena Bay
* ANYTIME: Visit the current exhibit in the Grinnell Art Museum.
  (At least 15 min.)
* SATURDAY: Men's Tennis at the Field House (2pm)
* SUNDAY: Mentor Session

### Other Upcoming Activities

Notes on partnering
-------------------

Thank you to those of you who filled out the survey!

For partnering: There were more 'ehs than I'd like.  (Okay, any 'ehs
is more than I'd like, but we had about 25% 'ehs.)

You should see their comments.  (Note that there are also positive
comments.)

* I feel like I know what the benefits are but for me it’s really 
  lowering my confidence.
* Some of the partners that I've had have taken a little bit too
  much initiative, meaning that I don't get many chances to be the
  one driving at times even though I would like to.
* I would appreciate if my partners would be more open to discussing
  the problem and possible solutions, what worked/didn't work and
  why. About half of them so far have done this, and the other half
  hasn't. I'm very grateful to the people who have.
* Something that I struggle with and I’ve struggled with other
  people doing is jumping in too soon to correct smaller mistakes,
  like the lack of a paren or space. That kind of stuff is good to
  figure out for everyone, just because I or my partner sees it first
  doesn’t mean we have to point it out right away (esp. if the partner
  is still typing)
    * Give me a chance to realize my mistakes before correcting me, 
      more than 2 secs preferably.
* People's confidence in the material varies greatly from person
  to person. If I seem to have a slower learning curve than you on
  the material, it might go quicker for you to dominate the lab, but
  make sure to slow down a little and make sure your partner understands.
  If you feel less confident, don't be afraid to question my code
  to understand it, and have resources such as readings accessible
  to you while we're working on the lab.
* Sometimes I’m placed with a partner who assumes I don’t know what 
  I’m doing, or maybe just that they know more? It’s frustrating
  when a partner explains way more than what I asked… as in, if I
  ask what’s the order of arguments for make-string? and they explain
  what make-string is and how i could use it and what an argument
  is.
* It's pretty mixed, There's some people I adore, due to how excited
  they are to learn the subject ( and more importantly, are excited
  to experiment), and others I'd rather avoid simply due to their
  lack of enthusiasm for the subject.
* Some partners have been pretty quiet. Others have not been checking 
  with me to see if I'm on the same wavelength before moving on to the 
  next question.
* If you understand the material better than me and are quicker on
  the activities then that is fine, but there are some activities
  that I would like to test and fiddle around with just to understand
  what is happening instead of rushing to the next question.
* That I generally do think they're smart and intelligent people
  who know what they're doing and I respect they're input even if I'm
  not always great at communicating that
* Copying and pasting old code can save a *ton* of time when you're writing 
  the same thing over and over.
* I would like them to know that I am worried sometimes about my
  partner who knows more than me carrying me on the lab because I
  don't have a grasp on what I am doing rather than explaining it to
  me.
* I hope I haven't offended anyone by accident! Please feel free
  to interrupt back if I overstep your personal boundaries. I promise,
  I'm not trying to do it.
* One needs to learn that only the driver should use the keyboard and 
  when he isn't driver he should not be grabbing it away from me.
    * It’s been good, but i had one time where I had the keyboard taken,
      didn’t feel great. It was the class after we talked about it
      as well.
* "It’s okay for the mosquitoes part"

Sample Quiz Questions
---------------------

### Reading Rex Patterns

_In your own words, explain what each kinds of strings each of the following regular expressions describes._

```
(define r1 
 (rex-concat (rex-string "\"") 
             (rex-char-antiset "\"")
             (rex-string "\"")))

(define r2
 (rex-any-of (rex-char-range #\a #\z)
             (rex-char-range #\A #\Z)
             (rex-char-set "'-")))

(define r3
 (rex-repeat r2))

(define r4
 (rex-concat (rex-char-range #\A #\Z)
             (rex-repeat (rex-concat r3 (rex-string " ")))
             (rex-string "love ")
             (rex-repeat (rex-concat r3 (rex-string " ")))
             (rex-char-set ".?!")))
```

### Using Rex Patterns

Write a procedure, `(rex-tally rex str)`, that counts how many times that
the pattern given by `rex` appears in string.

```
> (rex-tally (rex-string "a") "alphonse says albert and fatima are alphabetical")
10
> (rex-tally (rex-string "al") "alphonse says albert and fatima are alphabetical")
4
> (rex-tally (rex-char-set "aeiou") "alphonse says albert and fatima are alphabetical")
17
> (rex-tally (rex-append (rex-string "a")
                         (rex-char-antiset "a")
                         (rex-string "a"))
             "alphonse says albert and fatima are alphabetical")
. . rex-append: undefined;
 cannot reference an identifier before its definition
> (rex-tally (rex-concat (rex-string "a")
                         (rex-char-antiset "a")
                         (rex-string "a"))
             "alphonse says albert and fatima are alphabetical")
1
> (rex-find-matches (rex-concat (rex-string "a")
                         (rex-char-antiset "a")
                         (rex-string "a"))
             "alphonse says albert and fatima are alphabetical")
'("a a")
```

### Writing Rex Patterns

Write a regular expression that matches the common form of "words"
in English.  Words start with a lowercase or uppercase letter and
then have a sequence of lowercase letters, apostrophes, and dashes.

Racket/Lab Stuff
----------------

_None today._

Questions
---------

### Reading questions

Can you go over tracing of recursive procedures?

> It should be the same as tracing of any other procedure.  However, we 
  tend to skip a few steps.

> But what you'll often observe is that we build up a *lot* of delayed
  computations that only get done when we reach the base case.

> And you'll get some practice in lab.

Why is `cdr` pronounced "could-er"?

> It's hard to pronounce things with no vowels.  I suppose "code-er" would
  be funnier.

Between the "big three" list functions and recursive list function,
which is more efficient/concise? Are there any special cases where
we should use one over the other?

> There are so many contextual issues that it's hard to answer your
  question.  It's nice to think in terms of the "big three" list
  functions.  But as we'll see, the "big three" are often implemented
  with recursion.  I tend to prefer that you use the big three, except
  when you're learning how to write recursive procedures.

> Note: You'll learn how to write the big three in class.  One of the
  outcomes of this class should be that you can write most of the procedures
  you use (except for some really basic ones, like `+` or `cons`).

What's going on with `(awesum (list 5 2))`?

```
(define awesum
  (lambda (lst)
    (if (null? lst)
        0
        (+ (car lst) (awesum lst)))))
```

```
    (awesum (list 5 2))
    ; The list is not null
--> (+ 5 (awesum (list 5 2)))
    ; The list is not null
--> (+ 5 (+ 5 (awesum (list 5 2))))
    ; The list is not null
--> (+ 5 (+ 5 (+ 5 (awesum (list 5 2)))))
    ; The list is not null
--> ...
```

> It keeps expanding forever because we never make the input "smaller".

What does `(awesum (list 5 2))` really result in?

> It runs forever, so there is no final result.

Can you use `car` and `cdr` outside of recursion? 

> Yup.  Anywhere you have a list you can use recursion.

Can you use procedures other than `car` and `cdr` in recursion?

> Yes, as long as they simplify the parameters.  `take` and `drop`
  are a nice pair.

Can two procedures each refer to each other?

> Yes.  We often call that "mutual recursion".

### Other issues

Do I still have to complete a lab if I missed class?

> Definitely!  How else will you learn the material?

I'm worried that I'm falling behind.  What should I do?

> Chill.  Different people learn at different rates.

> Talk to Sam or the mentors, depending on who you are more comfortable with.

> Ask for an individual tutor to help you through things.

Could you not cold call me?  It makes me too nervous.

> Certainly.  Chat with me and I'll put a mark on your card.  But
  you do need to volunteer.

Can I have SamR's approval to ______?

> Talk to me.

Can we get better keyboards?  These are really flimsy.

> That's out of my control.  Sorry.

I don't like working in pairs.  Can I work alone?

> Nope.  You should develop skills working with others.

Can you change the due date for quizzes to Sunday?

> Sure.  But I'll probably make them due before the mentor session.

Will you still release quizzes Friday morning?

> Yes

Lab
---

### Preparation

Please take the time to chat with your partner.  You may want to
re-review some of the concerns.

Someone may be looking over your shoulders.

### During Lab

* Note: We often use `l` or `lst` to name a list.  That's an L or L-S-T.
* Note: `(*)` -> `1` (exercise 4)

### Wrapup

* If you didn't finish everything, I probably screwed up.
* We teach you tracing, in part, so that you can understand recursion better.
* Congratulations, you've earned the cheesy CS department sticker!
