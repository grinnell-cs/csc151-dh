---
title: Sample Learning Assessment Problems (LAP 2)
---
# {{ page.title }}

These are sample individual learning assessments of the approximate type 
and difficulty that you will encounter.
They represent the LAs for the second LA period.

## Program style

_Write and structure program code in ways that makes it easier to understand._

Although it is early in the semester, you have already started to learn some basic approaches to making your code more readable.  Here are a few.

* Put all of the parameters to a procedure on the same line, or all
  on separate lines.
    * Similarly, when writing an if statement, put the test,
      consequent, and alternate all on the same line or all
      on separate lines.
* Use Ctrl-i to reindent the text.
* When defining a procedure, place the `lambda` and the parameters on 
  a separate line from the `define`, and start the body on a separate
  line from the from the lambda and the parameters.
* Follow "The Zen of Booleans": Avoid explicitly using #t and #f in
  expressions if you can write them more clearly with `and` or `or`.
* Avoid repeated code.
* Avoid unnecessary code.
* Choose descriptive names for variables and procedures.

a. Using those principles, as well as others you have learned, clean up
the following code.

```
(define rab (lambda
(int 
str)
(if (if (equal? #t (integer? (string->number (substring int str))))
#t #f) (string->number (substring int str))
(if (if (equal? (integer? 
(string->number (substring int 0 str))) #f) #f
#t
) (string->number (substring int 0 
str)) #f))))
```

b. In English, describe what `rab` does.

Here are some sample calls to help get you started.

```
> (rab "876xy12" 0)
#f
> (rab "876xy12" 1)
8
> (rab "876xy12" 2)
87
> (rab "876xy12" 3)
876
> (rab "876xy12" 4)
#f
> (rab "876xy12" 5)
12
> (rab "876xy12" 6)
2
> (rab "876xy12" 7)
#f
> (rab "876xy12" 8)
. . substring: starting index is out of range
  starting index: 8
    valid range: [0, 7]
      string: "876xy12"
```

## Local bindings

_Refactor redundancy and add clarity in computations with let-bindings._

Consider the following procedure that contains some repetitious code.

```drracket
;;; (letter->number ch) -> either integer? boolean?
;;;   ch : char?
;;; Converts ch to the corresponding number in the English alphabet.
;;; (1 for #\a or #\A, 2 for #\b or #\B, etc.).  Returns false (#f)
;;; if ch is not a letter in the English alphabet.
(define letter->number
  (lambda (ch)
    (cond
      [(<= (char->integer #\a) (char->integer ch) (char->integer #\z))
       (+ 1 (- (char->integer ch) 97))]
      [(<= (char->integer #\a) (+ (char->integer ch) 32) (char->integer #\z))
       (+ 1 (- (+ (char->integer ch) 32) 97))]
      [else #f])))

(check-equal? (map letter->number (string->list "abcde"))
              '(1 2 3 4 5)
              "First five lowercase letters")
(check-equal? (map letter->number (string->list "ABCDE"))
              '(1 2 3 4 5)
              "First five uppercase letters")
(check-equal? (map letter->number (string->list "XYZ"))
              '(24 25 26)
              "Last three uppercase letters")
(check-equal? (map letter->number (string->list "xyz"))
              '(24 25 26)
              "Last three lowercase letters")
(check-equal? (letter->number #\.)
              #f
              "Not a letter")
```

As you know, we should avoid redundant computations and magic numbers.  Using
local bindings (`let` or `let*`), remove the redundant computations and magic
numbers from `letter->number`.  You need not change the primary stucture
of the `cond`, but you should not compute the same value twice.

Note: In case you didn't know, 32 is the result of subtracting the
collating sequence number of `#\A` from the collating sequence number
of `#\a`.  By adding 32, we switch from uppercase to lowercase.  And
37 seems to be the collating sequence number of `#a`, but we probably
shouldn't count on that.

---

## Documentation

_Document programs according to good software engineering principles._

Consider the following `matching-indices` procedure that finds the
indices of elements of a list that match a particular predicate.
(You need not understand all of the code, just what it does.)

```drracket
(define matching-indices
  (lambda (pred? lst)
    (matching-indices-helper pred? lst 0)))

(define matching-indices-helper
  (lambda (pred? lst pos)
    (cond
      [(null? lst)
       null]
      [(pred? (car lst))
       (cons pos (matching-indices-helper pred? (cdr lst) (+ pos 1)))]
      [else
       (matching-indices-helper pred? (cdr lst) (+ pos 1))])))

> (define starts-with-a?
    (lambda (str)
      (char=? #\a (string-ref str 0))))
> (define words (list "and" "as" "the" "animals" "rode" "off" "into" "the" "sunset"
                      "after" "aiding" "the" "enchantress"))
> (matching-indices starts-with-a? words)
'(0 1 3 9 10)
> (list-ref words 3)
"animals"
```

a. Write the standard documentation for `matching-indices`.

b. Other than the broad types of `pred?` and `lst`, what restrictions
does `matching-indices` impose on its parameters?  For example, can
you call `(matching-indices odd? words)`?  Can you call
`(matching-indices (section substring <> 0 1) words)`?  Should you?

c. Suppose an integer, `i`, appears in the list of values returned
by `matching-indices`.  What an we guarantee about `i` (other than that
it is a non-negative integer)?

---

## Testing

_Test programs according to good software engineering principles._

Consider the following not-yet-implemented procedure.

```drracket
;;; (median numbers) -> real?
;;;   numbers : list-of real?
;;; Find the median of a list of a nonempty list of numbers using
;;; the standard approach.
(define median
  (lambda (numbers)
    (car numbers))) ; Incorrect, but a good placeholder.
```

Write a set of tests for `median` using `check-=` and/or `check-equals?`.
Make sure to include at least three "expected" cases and at least three
"edge" cases.

Here are some examples to get you started.

```drracket
(check-= (median '(1 2 3))
         2
         0
         "An easy list of integers")
(check-= (median '(1.0 2 3 4))
         2.5
         0.00000001
         "A list of real numbers of even length.")
```

---

## Regular expressions

In your own words, explain what each kinds of strings each of the following 
regular expressions describes.

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

---

## List recursion

_Design and write recursive functions over lists._

Write a *recursive* procedure, `(increasing-length? words)`, that takes
a list of strings as input and ensures that every string is at least as
long as the previous string. If so, it returns true.  If not, it returns
false.

Here's a partial test suite.

```drracket
(check-equal? (increasing-length '()) 
              #t
              "No strings: They are in increasing length")
(check-equal? (increasing-length? '("hello"))
              #t
              "A singleton")
(check-equal? (increasing-length? '("a" "b" "cd" "efg" "hij" "klmn"))
              #t
              "Some duplicate-length words")
(check-equal? (increasing-length? '("a" "bb" "ccc" "dddd" "eee"))
              #f
              "Okay until the end.")
```

---

## Numeric recursion

_Design and write recursive functions over the natural numbers._

Write a *recursive* procedure, `(bounded-power-of-2 n)`, that finds the largest integer power of 2 less than of equal to the positive integer `n`.

```
(check-equal? (bounded-power-of-2 1)
              1
              "edge case/base case: 2^0")
(check-equal? (bounded-power-of-2 2)
              2
              "edge case/base case: 2^1")
(check-equal? (bounded-power-of-2 3)
              2
              "normal case: small non-power-of-two")
(check-equal? (bounded-power-of-2 7)
              4
              "normal case: small non-power-of-two")
(check-equal? (bounded-power-of-2 16)
              16
              "normal case: relatively small power of 2")
(check-equal? (bounded-power-of-2 17)
              "normal case: relatively small non-power-of-two")
(check-equal? (bounded-power-of-2 72)
              64
              "normal case: somewhat larger non-powr-of-two")
(check-equal? (bounded-power-of-2 (expt 2 123))
              (expt 2 123)
              "edge case: large power of 2")
(check-equal? (bounded-power-of-2 (+ (expt 2 123) 123))
              (expt 2 123)
              "edge case: large non-power of 2")
```

