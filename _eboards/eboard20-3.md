---
title: "EBoard 20 (Section 3): Pause for Breath"
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

* Diversity and Inclusion in Economics stuff this weekend.
  Saturday at 1pm.
* Rave Harris tonight.
* Slavic spring celebration 5-6pm outside Russian house.

### Other Upcoming Activities

* Grinnell Singers, Sunday 2pm
* International Dinner Saturday at 6pm (responses were due awhile ago)

### Administrative questions

### The Friday PSA returns

* Choose what is right for you, not what you think others are doing.
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

### Problems

* Most of the time, this crashes with "Tie!".
* But `(play-seven-eleven)` returns 0 or 1, so we should never reach
  the else case.  What's going wrong?

Hypotheses
 
* The recursive call. (nope)
* The logic makes us play twice if we don't win the first time (yup)
    * We could lose then win, which would mean all guards fail.

### Improving the code

* Get rid of the (= 0 ...) test, and just use an else.

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
      [else
       (count-wins (- n 1))])))
```

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
Do we?  Nope.

Fix.

### Comments from Dan and Tina

* Blues Brothers, "Rawhide": <https://www.youtube.com/watch?v=RdR6MN2jKYs>
* Tina Turner, "Proud Mary": <https://www.youtube.com/watch?v=T2T5_seDNZE>

### Further observations

### Morals

* It's harder to test random procedures.  We should probably do multiple
  runs to make sure they make sense.
* We can easily create subtle (or not so subtle) errors in simulations;
  it's good to think carefully.
    * We want to call `random` neither too few nor too many times.
* Randomness can be fun.
* `pair-a-dice` is one of the best procedure names ever.

### Dice questions

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

Couldn't we just use

```
(define random-person
  (random-list-element people))
```

> Without the `lambda`, it evaluates the `random-list-element` once,
  so we won't get different strings.

> Procedures run their body *each time* you call them, permitting
  different behavior with randomness.

### Your questions

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

```
> (select-special-words '("uh" "happy" "bob" "sad" "uh" "chemistry" "galaxy" "galaxian" "shoe"
                               "um" "microphone"))
'("galaxian" "microphone")
> (select-special-words '("um" "position" "uh" "mumble" "evaluate"))
'("position" "evaluate")
```

a. What kinds of words does `select-special-words` select?

> Words with more than two vowels.

> ALTV = At Least Three Vowels

b. Explain how `(o (section > <> 2) count-vowels)` works as a
predicate for such words.

> `tally` uses this to check each element in the list to see if
  it has more than two vowels.

> The meaning of the composition is "apply count vowels, then
  apply the section", the section is "thing greater than two".

> `(o f g)` is a shorthand for `(lambda (x) (f (g x)))`

c. Rewrite `vowel?` using `section` and composition but no
`lambda`.

```
(define vowel?
  (let ([vowels (string->list "aeiou")])
    (lambda (ch)
      (integer? (index-of vowels (char-downcase ch))))))
```

Hint: Think about the order in which we do things in this procedure.

* First downcase the character, then use index-of to look for it in
  vowels, and then check to see if it's an integer.

```
(define vowel?
  (let ([vowels (string->list "aeiou")])
    (o integer? (section index-of vowels <>) char-downcase)))
```
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

* Think about ordering (this then that uses `o`) and filling in parameters
  (with section).
* `(lambda (x) (sqr (+ 1 x)))` is "a procedure that takes one parameter,
  adds 1, then squares.  "add 1" is `(section + 1 <>)`.  So "add 1 then
  square" is `(o sqr (section + 1 <>))`.
* `silly` first filters all the odd elements, then maps that add-then-square.
    * "filter odd elements" is `(section filter odd? <>)`
    * "map procedure" is `(section map procedure <>)`
* Putting it together ...

```
(define silly
  (o (section map (o sqr (section + 1 <>)) <>)
     (section filter odd? <>)))
```

### Survey

<https://bit.ly/csc151-2022Sp-week07>
