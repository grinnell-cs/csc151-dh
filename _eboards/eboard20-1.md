---
title: "EBoard 20 (Section 1): Pause for Breath"
number: 20
section: eboards
held: 2022-03-11
link: true
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [~10 min]
* Rolling dice (from randomness lab) [~15 min]
* Random language (from the randomness lab) [~10 min]
* About MP5 [~10 min]
* Fun with higher-order programming [~20 min]
* Time to fill out the survey [~15 min]

Administrivia
-------------

### Introductory notes

* I hope the SoLA went well.  I look forward to a weekend of intense grading.
* Since you are probably recovering from the SoLA, today will mostly be a
  talk day.
    * There is a listed lab that you might want to look at, but there's
      nothing to submit.
* Please ask questions as we go.  I'll encourage you from time to time.
* Don't forget that we spring ahead this weekend.  Plan ahead for the
  loss of sleep time.

### Class mask policy

* Please bring your mask to class.  Wear it if you wish.
* If your partner is wearing a mask, please put on your mask.
* As a member of a high-risk group, I will be wearing a mask at least 
  through spring break.
* Note: Masks remain good for preventing transmission of cold and
  flu and other similar diseases.
* The week-seven survey asks you for other thoughts on the mask policy.

### Reminders

* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* Evening tutors are available 7--10 p.m. Sunday through Thursday as
  well as 3--5 p.m. on Sunday.
* Mentor sessions are Monday 8--9 p.m.  Wednesday, 8--9 p.m., Sunday 4--5 p.m.

### Upcoming work

* Quiz 7 due Sunday at 4pm: Use higher-order procedures.
     * We're going through the samples today.
* Week seven survey distributed today, due at the end of class.
     * <https://bit.ly/csc151-2022Sp-week07>
     * 60%+ class response rate -> a token for all
* Reading for Monday's class (Pairs and Pair Structures), due 
  Sunday at 10:00 p.m.
* MP 5 due next Thursday at 10:30 p.m.  Released today.

### Upcoming Token-Generating Activities

_None right now._

### Other Upcoming Activities

* Grinnell Singers, Sunday at 2pm.

### Administrative questions

### The Friday PSA returns

* Choose what is right for you, not what you think others are doing
  or what you think others want you to do.
* Take care of yourself.
* Moderation!
* Consent is essential.  
    * Go beyond consent.

Rolling dice
------------

### Starter code

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

### Count how many times we win

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

### Improving the code

```
(define count-wins
  (lambda (n)
    (if (zero? n)
        0
        (+ (play-seven-eleven)
           (count-wins (- n 1))))))
```

### Observe problem

8/36 rolls win.  So when we play a lot of games, we should win about 8/36
of the time.  If we play 3600 games, we should win approximately 800 times.
Do we?

### Comments from Dan and Tina

* Blues Brothers, "Rawhide": <https://www.youtube.com/watch?v=RdR6MN2jKYs>
* Tina Turner, "Proud Mary": <https://www.youtube.com/watch?v=T2T5_seDNZE>

### Further observations

* We had the same problem with `play-seven-eleven`.  Be careful about
  extra calls to recursive procedures.

### Morals

* It's harder to test random procedures.
* We can easily create subtle (or not so subtle) errors in simulations;
  it's good to think carefully.
    * We want to call `random` neither too few nor too many times.
* Randomness can be fun.
* `pair-a-dice` is one of the best procedure names ever.

### Dice questions

Can we use `or` to solve the seven-eleven problem?

> No.

Can we use a more sophisticated version of `or` that we don't learn in 151?

> Perhaps.

Random language
---------------

### A key procedure

```
;;; (random-list-element lst) -> any?
;;;   lst : listof any?
;;; Randomly select an element of `lst`
(define random-list-element
  (lambda (lst)
    (list-ref lst (random (length lst)))))
```

### Sample usage

```
;;; people -> listof string?
;;; A list of some of the folks who teach 151
(define people (list "Peter-Michael" "Nicole" "Sarah" "SamR" "Barbara" "Priscilla" "Jerod"))

;;; (random-person) -> string?
;;; Randomly select an element of the people list.
(define random-person
  (lambda ()
    (random-list-element people)))
```

### My questions

Why does `random-person` have a `lambda` with no parameters?

> We don't need the list of people, since that's already defined.
  (`random-list-element` only needs one parameter)

Why don't I just write
`(define random-person (random-list-element people))`.

> Putting in the lambda ensures that we re-do the `random-list-element`
  each time the procedure is called.

> We don't need any inputs (see above), so we leave the parameters blank.

### Your questions

Are there other cases in which we'd need an empty lambda?

> Not normally.  If we were to do more sophisticated file I/O, we might.

MP5
---

Our goal: Generate some interesting language (Haiku and Templated Writing).

* Haiku.
* Utilities.
* Mad libs.
* Haiku, using words from another text.

Higher-order procedures
-----------------------

### Sample LA 1

Consider the following procedures

```drracket
;;; (vowel? char) -> boolean
;;;   char : char?
;;; Determine if char is a vowel.
(define vowel?
  (let ([vowels (string->list "aeiou")])
    (lambda (ch)
      (integer? (index-of vowels (char-downcase ch))))))

;;; (count-vowels str) -> integer?
;;;   str : string?
;;; Count the number of vowels in str
(define count-vowels
  (lambda (str)
    (tally vowel? (string->list str))))

;;; (select-special-words words) -> list-of string?
;;;   words : list-of string?
;;; Selects all the special words in words using the ALTV criterion.
(define select-special-words
  (lambda (words)
    (filter (o (section > <> 2) count-vowels) words)))
```

a. What kinds of words does `select-special-words` select?

> Words that have more than two vowels.

b. Explain how `(o (section > <> 2) count-vowels)` works as a
predicate for such words.

> First it counts the vowels in the word and then compares that number
  to two.  `(section > <> 2)` is a Scheme way to write "greater than two"

c. Rewrite `vowel?` using `section` and composition but no
`lambda`.

Old

```
(define vowel?
  (let ([vowels (string->list "aeiou")])
    (lambda (ch)
      (integer? (index-of vowels (char-downcase ch))))))
```

New

Approach

* What are the three main steps in the `vowel?` procedure?
    * downcase the character with `string-downcase`
    * call `index-of` to find it in the list of vowels
    * call `integer?` to see if `index-of` found it

```
(define vowel?
  (let ([vowels (string->list "aeiou")])
    (o integer? (section index-of vowels <>) char-downcase)))
```

Morals:

* Think about sequencing, use `o` to build the sequence.
* If you have any multi-parameter procedures, use `section` to fix
  some of those parameters and give you a one-parameter procedure.

#### Questions

Why didn't we need `section` for `char-downcase`?

> `char-downcase` only takes one parameter.  We use `section` when we're
  trying to reduce the number of parameters.

Where is the lambda?

> `o` adds an implicit lambda

> `(o f g)` --> `(lambda (x) (f (g x)))`

### Sample LA 2 (hard!)

_You are unlikely to receive a problem this hard._

Consider the following procedure.

```drracket
(define silly
  (lambda (lst)
    (map (lambda (x) (sqr (+ 1 x)))
         (filter odd? lst))))
```

Rewrite the procedure using `o` and `section` so that it has *no* lambdas.

* First we're extracting all the odd numbers from the list.
* Then we're mapping some weird procedure over that list.
* We can use `o` to sequence those two.

```
(define silly
  (o (section map (lambda (x) (sqr (+ 1 x))) <>)
     (section filter odd? <>)))
```

That procedure adds one and then squares.  We can write that as
`(o sqr (section + 1 <>))`.

Putting it together

```
(define silly
  (o (section map (o sqr (section + 1 <>)) <>)
     (section filter odd? <>)))
```

### Survey

<https://bit.ly/csc151-2022Sp-week07>
