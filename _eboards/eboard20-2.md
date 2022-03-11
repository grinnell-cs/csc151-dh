---
title: "EBoard 20 (Section 2): Pause for Breath"
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
* Mentor sessions are Sunday 4--5 p.m., Monday 8--9 p.m.  Wednesday, 8--9 p.m.

### Upcoming work

* Quiz 7 due Sunday at 4pm: Use higher-order procedures.
     * We're going through the samples today.
* Week seven survey distributed today, due at the end of class.
     * <https://bit.ly/csc151-2022Sp-week07>
     * 60%+ class response rate yields a token for all
* Reading for Monday's class (Pairs and Pair Structures), due 
  Sunday at 10:00 p.m.
* MP 5 due next Thursday at 10:30 p.m.  Released today.

### Upcoming Token-Generating Activities

* International student dinner Saturday at 6 p.m.
* Grinnell Singers Sunday at 2 p.m.

### Other Upcoming Activities

* Movie: King Richard III, some time this weekend.

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

The problem: If we lose in the =1 block, we play again.  We could win
that second time.  In that case, we fall to the else.  (We've also
played one more game than we should.)

* Ideas: `if` statement.
* Use a `let` in which we set the variable equal to `(play-seven-eleven)`


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

Nope.

It's because we're calling `(pair-a-dice)` twice.

### Comments from Dan and Tina

* Blues Brothers, "Rawhide": <https://www.youtube.com/watch?v=RdR6MN2jKYs>
* Tina Turner, "Proud Mary": <https://www.youtube.com/watch?v=T2T5_seDNZE>

### Further observations

### Morals

* It's harder to test random procedures.
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

Why not write

```
(define random-person
  (random-list-element people))
```

> If we do the `define` without the lambda, we'll get the same value
  every time.  We also won't have a procedure.  

Moral: We use empty lambdas when we want procedures to run, which is
necessary for random output.

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
> (select-special-words '("Um" "banana" "apple" "orange" "pizza" "grape" "coal" "no"))
'("banana" "orange")
```

a. What kinds of words does `select-special-words` select?

> Words with more than two vowels.  (ATLV is "at least three vowels")

b. Explain how `(o (section > <> 2) count-vowels)` works as a
predicate for such words.

> `filter` expects a predicate.  The `(o (section > <> 2) count-vowels)`
  gets applied to each element in the list.  So it first counts the vowels,
  and then checks if it's greater than two.

c. Rewrite `vowel?` using `section` and composition but no
`lambda`.

```
(define vowel?
  (let ([vowels (string->list "aeiou")])
    (lambda (ch)
      (integer? (index-of vowels (char-downcase ch))))))
```

Hint: Think about the sequence of operations, use `o`.  (`o` goes
right to left.)

* Since it's already in the right order, it's easier.
* First char-downcase, then use index-of to look in vowels, then check
  whether it's an integer.

```
(define vowel?
  (let ([vowels (string->list "aeiou")])
    (o integer? (section index-of vowels <>) char-downcase))
```

Why does `char-downcase` get used?

> `(o f g)` is a shorthand for `(lambda (x) (f (g x)))`

> Our `o` is `(lambda (x) (integer? ((section index-of vowels <>) (char-downcase x))))`

> `(section f val <>)` is a shorhand for `(lambda (y) (f val y))`.  Maybe that's not relevant here.

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

* The `(lambda (x) (sqr (+ 1 x)))` is "a procedure that adds one and
  then squares.  We can rewrite it as `(o sqr (section + 1 <>))`
* More broadly, first we filter the odd elements, then we map that
  add-then-square procedure.  So we could write

```
(define silly
  (o (section map (o sqr (section + 1 <>)) <>)
     (section filter odd? <>)))
```

With the diamonds, how do you know which parameters they take?

> Careful analysis.

> The last diamond is "the input to the procedure"

> Because I have composition, I know that the penultimate diamond is
  "the output from filter".

> The first diamond is used in `map`, so I know that it's going to be
  used for every element in some list (that list is the output from
  filter)

### Survey

<https://bit.ly/csc151-2022Sp-week07>
