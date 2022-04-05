---
title: Sample Learning Assessment Problems (LAP 3)
---
# {{ page.title }}

These are sample individual learning assessments of the approximate type 
and difficulty that you will encounter.
They represent the LAs for the third LA period.

In some cases, I've included multiple problems to help you explore issues in different ways, especially for more recent topics.

## Randomness

_Write programs that produce unpredictable output._

Grinnell has suggested that we make up "random ids" for the students in our classes that we can use in online platforms.

Write a procedure, `(random-id)`, that creates a string consisting of a random six-letter identifier of the form consonant-vowel-consonant-vowel-consonant-vowel, with all letters uppercase.

```
> (random-id)
"PALEQO"
> (random-id)
"ZEDUMI"
```

Isn't that fun?

## Mental models of memory

_Describe or diagram the layout of memory for lists and vectors/arrays._

Consider the following pair structure represented in ASCII art.

```
+---+---+  +---+---+  +---+---+  +---+---+
| * | *--->| * | *--->| * | *--->| * | / |
+-|-+---+  +-|-+---+  +-|-+---+  +-|-+---+
  v          |          v          v
 "a"         |         "e"        "f"
             v
           +---+---+  +---+---+  +---+---+
           | * | *--->| / | *--->| * | / |
           +-|-+---+  +---+---+  + | +---+
             v                     v
           +---+---+             +---+---+
           | * | / |             | * | * |
           +-|-+---+             +-|-+-|-+
             v                     v   v
           +---+---+              "c" "d"
           | / | * |
           +---+-|-+
                 v
                "b"
```

Write the Racket expression to build this structure.  (And yes,
you can use `cons`.)

Here's an approximate key for ASCII-art pair structures.

```
(cons "x" "y"):    +---+---+
                   | * | * |
                   +-|-+-|-+
                     v   v
                    "x" "y"

(cons "z" null):   +---+---+
                   | * | / |
                   +-|-+---+
                     v    
                    "z"   

(cons null "w"):   +---+---+
                   | / | * |
                   +---+-|-+
                         v
                        "w"

(cons null null):  +---+---+
                   | / | / |
                   +---+---+

(cons "t" (cons "u" null)): +---+---+  +---+---+
                            | * | *--->| * | / |
                            +-|-+---+  +-|-+---+
                              v          v
                             "t"        "u"

(vector 'a 'b 'c):          /---+---+---+---+
                            | 3 | * | * | * |
                            \---+-|-+-|-+-|-+
                                  v   v   v
                                  a   b   c

(vector 'a 'b 'c 'd):       /---+---+---+---+---+
                            | 4 | * | * | * | * |
                            \---+-|-+-|-+-|-+-|-+
                                  v   v   v   v
                                  a   b   c   d
```

## Mental Models of Memory

Suppose the diagram above is named `stuff`.  Give expressions that
extract the following elements of `stuff`.

* `"b"`
* `"c"`
* `"f"`

## Dictionaries

_Design and write functions that utilize dictionaries._

Suppose `counts` is a dictionary whose keys are words and whose values are integers that represent how many times the word appears in a text.  Write a procedure, `(total-words counts)`, that determines the sum the numbers in the dictionary.

_Note/hint: As you may recall, `(hash-keys hash)` returns the list of all the keys in a hash table._

## Vectors

_Design and write functions (potentially recursive functions) that utilize vectors._

Write a procedure, `(vector-product nums)` that finds the product of the numbers in in a vector that contains only numbers.

```
(check-equal? (vector-product (vector 4 1 3))
              12
              "normal case: short vector with 1
(check-equal? (vector-product (vector -3 1 7 2))
              -42
              "normal case: includes negatives")
(check-equal? (vector-product (vector 2 3+4i))
              6+8i
              "normal case: mixed types, includes complex")
(check-equal? (vector-product (vector))
              1
              "edge case: empty vector")
(check-equal? (vector-product (vector 1 2 3 0))
              0
              "edge case: includes 0")
```

## Vectors (Extra)

_Design and write functions (potentially recursive functions) that utilize vectors._

Consider the following recursive procedure that adds all of the numbers in a vector of numbers.

```
(define vector-sum  
  (lambda (vec)
    (let ([len (vector-length vec)])
      (letrec ([helper
                (lambda (pos)
                  (if (< pos len)
                      (+ (vector-ref vec pos)
                         (helper (+ pos 1)))
                      0))])
        (helper 0)))))
```

Trace the evaluation of `(vector-sum (vector 3 5 7 11))`.  You can skip to the consequent or alternate of the `if` without showing the `if` iteself.  You can also do simple steps (e.g., adding one or looking up a value in a vector) in parallel.

```
    (vector-sum '#(3 5 7 11))
--> (helper 0)
    ; 0 < 4
--> (+ (vector-ref vec 0) (helper (+ pos 1)))
--> (+ 3 (helper 1))
```

## Vectors (Extra)

_Design and write functions (potentially recursive functions) that utilize vectors._

Consider the following recursive procedure that adds all of the numbers in a vector of numbers.

```
(define vector-sum  
  (lambda (vec)
    (let ([len (vector-length vec)])
      (letrec ([helper
                (lambda (pos sum-so-far)
                  (if (< pos len)
                      (helper (+ pos 1)
                              (+ sum-so-far (vector-ref vec pos)))
                      sum-so-far))])
        (helper 0 0)))))
```

Trace the evaluation of `(vector-sum (vector 3 5 7 11))`.  You can skip to the consequent or alternate of the `if` without showing the `if` iteself.  You can also do simple steps (e.g., adding one or looking up a value in a vector) in parallel.

```
    (vector-sum '#(3 5 7 11))
--> (helper 0 0)
    ; 0 < 4
--> (helper (+ pos 1) (+ 0 (vector-ref vec pos)))
--> (helper 1 (+ 0 3))
--> (helper 1 3)
```

## Vectors (Extra)

_Design and write functions (potentially recursive functions) that utilize vectors._

Write a procedure, `(vector-swap-neighbors! vec)` that takes an even-length vector as a parameter and swaps the neighboring elements (those at indices 0 and 1, those at indices 2 and 3, etc.).

```
> (define vec (vector 'a 'b 'c 'd 'e 'f))
> (vector-swap-neighbors! (vector 'a 'b 'c 'd 'e 'f))
> vec
'#(b a d c f e)
```

_Hint: You will find a let binding helpful._

---

## Data abstraction

_Design data structures to separate interface from implementation._

A point in two-space is often represented as an (x,y) pair.

a. Write a struct `point-core` that stores two fields, named `x`
and `y`.

b. Write a set of "wrapper" procedures, `(point x y)`, `(point-x pt)`,
and `(point-y pt)`.  `point` should ensure that both of its parameters
are real numbers.

c. Write a procedure, `(point->string pt)`, that takes a point as input
and returns a string of the form `"(x,y)"`.

d. Write a proceudre, `(string->point str)`, that takes a string of
the form `"(x,y)"` as input and returns the corresponding point.

## Data abstraction (extra)

_Design data structures to separate interface from implementation._

When we create a new way to structure data, there's a value of separating the *interface* to the structure (the procedures we call) from the *implementation* of the struture (the particular details, such as whether we use an array or list or whatever).

You may recall that we said that names are complex.  Some people have only one name.  Some people have multi-word last names.  Some people have middle names and others do not.  Some people have suffixes, like "Jr.", "Sr.", or "III".  Some people might also have prefixes to their names, like "King" or "Pope", but we will ignore those for now.

Here's the start of a library that is intended to represent the various possibilities for names.

```drracket
#lang racket
(require csc151)
(require rackunit)

;;; (make-name given middle surname suffix) -> name?
;;;   given : string?
;;;   middle : string? or #f
;;;   surname : string? or #f
;;;   suffix : string? or #f
;;; Create a new name from the appropriate components.
(define make-name
  (lambda (given middle surname suffix)
    (list given middle surname suffix)))

;;; (make-name-1 given) -> name?
;;;   given : string?
;;; Create a name for those who have only one name, such as Prince,
;;; Madonna, Cher, or Simon.
(define make-name-1
  (lambda (given)
    (make-name given #f #f #f)))

;;; (make-name-2 given surname) -> name?
;;;   given : string?
;;;   surname : string?
;;; Create a name for those who have only a given name and a surname.
;;; One of the most common forms.
(define make-name-2
  (lambda (given surname)
    (make-name given #f surname #f)))

;;; (make-name-3 given middle surname) -> name?
;;;   given : string?
;;;   middle : string?
;;;   surname : string?
(define make-name-3
  (lambda (given middle surname)
    (make-name given middle surname #f)))

;;; (make-name-gs given suffix) -> name?
;;;   given : string?
;;;   suffix : string?
;;; Make a name for someone who has only a given name and a suffix,
;;; such as Elizabeth II or Henry IV.
(define make-name-gs
  (lambda (given suffix)
    (make-name given #f #f suffix)))

;;; (name? val) -> boolean?
;;;   val : any?
;;; Determine if val appears to be a name created by `make-name`
;;; of any of the similar procedures.
(define name?
  (let ([string-or-false? (lambda (val) (or (string? val) (not val)))])
    (lambda (val)
      (and (list? val)
           (= 4 (length val))
           (string? (given-name val))
           (string-or-false? (middle-name val))
           (string-or-false? (surname val))
           (string-or-false? (suffix val))))))

;;; (given-name name) -> string? or false
;;;   name : name?
;;; Determine the given name for a name.  Returns false
;;; if there is no given name.
(define given-name
  (lambda (name)
    (car name)))

;;; (middle-name name) -> string? or false
;;;   name : name?
;;; Determine the middle name for a name.  Returns false
;;; if there is no middle name.
(define middle-name
  (lambda (name)
    (cadr name)))

;;; (surname name) -> string? or false
;;;   name : name?
;;; Determine the surname for a name.  Returns false if there
;;; is no surname.
(define surname
  (lambda (name)
    (caddr name)))

;;; (suffix name) -> string? or false
;;;   name : name?
;;; Determine the suffix for a name.  Returns false if there
;;; is no suffix.
(define suffix
  (lambda (name)
    (cadddr name)))

;;; (name->string) -> string?
;;;   name : name?
;;; Convert a name to one of the standard forms, approximately
;;;   Given Middle Surname, Suffix
(define name->string
  (lambda (name)
    (let ([given (given-name name)]
          [middle (middle-name name)]
          [surn (surname name)]
          [suff (suffix name)]
          [use (lambda (word pre) (if word (string-append pre word) ""))])
      (cond
        ; Special case: Only first and suffix.  We don't use a comma
        ; before the suffix here.
        [(and (not middle) (not surn) suff)
         (string-append given " " suff)]
        ; Normal case
        [else
         (string-append given
                        (use middle  " ")
                        (use surn " ")
                        (use suff ", "))]))))

;;; (name->dirstring) -> string?
;;;   name : name?
;;; Convert a name to the standard form used for alphabetization
;;; of names, approximately,
;;;   Surname, Given Middle Suffix
(define name->dirstring
  (lambda (name)
    (let ([given (given-name name)]
          [middle (middle-name name)]
          [surn (surname name)]
          [suff (suffix name)]
          [use (lambda (word pre) (if word (string-append pre word) ""))])
      (string-append (if surn (string-append surn ", ") "")
                     given
                     (use middle " ")
                     (use suff " ")))))
```

Here are a few tests of the various procedures working in conjunction.

```
(check-equal? (name->string (make-name "Barack" "Hussein" "Obama" "II"))
              "Barack Hussein Obama, II")
(check-equal? (name->dirstring (make-name "Barack" "Hussein" "Obama" "II"))
              "Obama, Barack Hussein II")
(check-equal? (name->string (make-name-3 "George" "Herbert Walker" "Bush"))
              "George Herbert Walker Bush")
(check-equal? (name->dirstring (make-name-3 "George" "Herbert Walker" "Bush"))
              "Bush, George Herbert Walker")
(check-equal? (name->string (make-name-3 "George" "W." "Bush"))
              "George W. Bush")
(check-equal? (name->dirstring (make-name-3 "George" "W." "Bush"))
              "Bush, George W.")
(check-equal? (name->string (make-name-2 "Kamala" "Harris"))
              "Kamala Harris")
(check-equal? (name->dirstring (make-name-2 "Kamala" "Harris"))
              "Harris, Kamala")
(check-equal? (name->string (make-name-1 "SamR"))
              "SamR")
(check-equal? (name->dirstring (make-name-1 "SamR"))
              "SamR")
(check-equal? (name->string (make-name-gs "Elizabeth" "II"))
              "Elizabeth II")
(check-equal? (name->dirstring (make-name-gs "Elizabeth" "II"))
              "Elizabeth II")
```

Update the name structure (the procedures above) to use a struct rather
than lists.

> _Space for answer_

## Data abstraction (extra)

_Design data structures to separate interface from implementation._

Variants of the name question above, using hash tables or vectors (rather
than structs) are also possible.

---

## Use higher-order procedures

_Use `section` and composition to simplify computations._

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

b. Explain how `(o (section > <> 2) count-vowels)` works as a
predicate for such words.

c. Rewrite `vowel?` using `section` and composition but no
`lambda`.

## Use higher-order procedures (extra)

_This is a particularly evil problem.  You are unlikely to get one
this hard._

Consider the following procedure.

```drracket
(define silly
  (lambda (lst)
    (map (lambda (x) (sqr (+ 1 x)))
         (filter odd? lst))))
```

Rewrite the procedure using `o` and `section` so that it has *no* lambdas.

Notes:

* Use `o` when you want to sequence actions. (Do *this* to the parameter,
then *this* to the result, then *this* to the next result, and so on and
so forth.)
* Use `section` when you want to fill in one or more parameters to a procedure, thereby creating a new procedure.
* This is a case in which the lambda-free version is likely much harder to
  read.

---

### Structuring textual data

_Write and use HTML, XML, and CSS._

Write approximate XML, with only structural markup, to describe
the following document fragment.

> **Our Mission**

> When <span style="color: red">Grinnell College</span> framed its charter in the Iowa Territory of the United States in 1846, it set forth a mission to educate its students "for the different professions and for the honorable discharge of the duties of life." <span style="color: red">The College</span> pursues that mission by providing an education in the liberal arts through free inquiry and the open exchange of ideas. As a teaching and learning community, <span style="colr: red">the College</span> holds that knowledge is a good to be pursued both for its own sake and for the _intellectual_, _moral_, and _physical_ well-being of individuals and of society at large. <span style="color:red">The College</span> exists to provide a lively academic community of students and teachers of high scholarly qualifications from diverse social and cultural circumstances. <span style="color:red">The College</span> aims to graduate individuals who can think clearly, who can speak and write persuasively and even eloquently, who can evaluate critically both their own and others' ideas, who can acquire new knowledge, and who are prepared in life and work to use their knowledge and their abilities to serve the common good.

> Excerpted from _The Grinnell College Catalog_.

Make sure to use at least three different kinds of tags and at
least two attributes.  You may invent your own tags.  You may *not* 
use appearance-oriented tags.
