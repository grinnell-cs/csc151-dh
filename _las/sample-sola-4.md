---
title: Sample Learning Assessment Problems (LAP 4)
---
# {{ page.title }}

These are sample individual learning assessments of the approximate type 
and difficulty that you will encounter.
They represent the LAs for the fourth LA period.

In some cases, I've included multiple problems to help you explore issues in different ways, especially for more recent topics.
Some of these problems are likely to be longer than the corresponding problem on the SoLA.

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

## Write higher-order procedures

_Write procedures that take procedures as parameters and return procedures as results._

Write, but do not document, a *recursive* procedure `(split pred? lst)`,
that takes a predicate and a list as parameters and returns a two-element
list, the first of which is all the elements for which the predicate
holds, and the second of which is all the elements for which the
predicate does not hold.  You may assume that the predicate is
applicable to all elements of the list.

```
> (split odd? (list 5 1 5 4 2 3 8))
'((5 1 5 3) (4 2 8))
> (split string->number? (list "11" "fred" "one" "22.1" "two"))
'(("11" "22.1") ("fred" "one" "two"))
```

## Write higher-order procedures (Extra)

a. As you may recall, the `(left-section proc left)` procedure looks 
like this.

```racket
(define left-section
  (lambda (proc left)
    (lambda (right)
      (proc left right))))
```

In your own words, explain why we have two `lambda` expressions
in `left-section.

b. Consider the following alternate definition of `left-section`.

```racket
(define left-section
  (lambda (proc left)
    (let ([result
           (lambda (right) 
             (proc left right))])
      result)))
```

Why might someone prefer this version of `left-section`?

c. Using the strategy of b, write a procedure, `(make-multiplier n)`,
that creates a procedure that takes one input and multiplies it by `n`.

```
;;; (make-multiplier n) -> procedure?
;;;   n : number?
;;; Create a procedure that multiplies its parameter by n
(define make-multiplier
  (lambda (n)
    undefined))
```

```
> (define mul5 (make-multiplier 5))
> (mul5 10)
50
> mul5 1.2)
6.0
```

---

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

---

## Tree recursion

_Design and write recursive functions over trees._

(_Note that this problem focuses more on tracing tree recursion than on implementing it.  We've found that tracing tree recursion is too time consuming for a SoLA.  But we leave it on as an example of a kind of procedure you might write._)

Consider the following procedure.

```
(define tree-level
  (lambda (tree n)
    (cond
      [(empty-tree? tree)
       null]
      [(= n 0)
       (list (btt tree))]
      [else
       (append (tree-level (btl tree) (- n 1))
               (tree-level (btr tree) (- n 1)))])))
```

Summarize the steps involved in computing `(tree-level t 3)` for the
following tree.  (You need not do a full trace.)

```
                  "A"
                  / \
                "B" "C"
                /   / \
              "D" "E" "F"
              / \   \   \
            "G" "H" "I" "J"
            /       / \   \
          "K"     "L" "M" "N"
            \     / \
            "P" "Q" "R"
                      \
                      "S"
```

Your answer will look something like the following.

> `(tree-level (bt "A" ...) 3)` appends `(tree-level (bt "B" ...) 2)`
  and `(tree-level (bt "C" ...) 2)`.

> `(tree-level (bt "B" ...) 2) appends ...

> ...

> Therefore, `(tree-level (bt "B" ...) 2)` returns ...

> `(tree-level (bt "C" ...) 2)` appends ...

> ...

> Therefore, `(tree-level (bt "C" ...) 2)` returns ...

> So the final result is ...

Alternately, you can do a more traditional trace.

```
    (tree-level (bt "A" ...) 3)
--> (append (tree-level (bt "B" ...) 2) (tree-level (bt "C" ...) 2))
--> ...
```

> _Space for answer_

Explain, in your own words, what `tree-level` computes.

> _Space for answer_

*Note*: You can access the binary-tree library we've been using with
`(require csc151/binary-trees-list)`.   You may have to update your
`csc151` library in order to do so.

*Note*: Here's the code for the tree above.

```
(define sample
  (bt "A"
      (bt "B"
          (bt "D"
              (bt "G"
                  (bt "K"
                      (empty-tree)
                      (leaf "P"))
                  (empty-tree))
              (leaf "H"))
          (empty-tree))
      (bt "C"
          (bt "E"
              (empty-tree)
              (bt "I"
                  (bt "L"
                      (leaf "Q")
                      (bt "R"
                          (empty-tree)
                          (leaf "S")))
                  (leaf "M")))
          (bt "F"
               (empty-tree)
               (bt "J"
                   (empty-tree)
                   (leaf "N"))))))
```

## Tree recursion

_Design and write recursive functions over trees._

Write the following procedure.

```
;;; (bt-find tree str) -> string? or boolean?
;;;   tree : treeof string?
;;;   str : string?
;;; Find a string equal to string (ignoring case) in tree.  If
;;; no such string exists, return false.
```

> _Space for answer_

*Note*: You can access the primary tree procedures by updating the csc151 library and then using `(include csc151/binary-trees-from-lists)`.

Here are some tests.

```
(define one-of-many
  (lambda (n i primary secondary)
    (let ([vec (list->vector (make-list n primary))])
      (vector-set! vec i secondary)
      (vector->tree vec))))

(check-false (bt-find (empty-tree) "A")
             "Base case: Nothing is in the empty tree")
(check-equal? (bt-find (leaf "A") "A")
              "A"
              "Simple case: At root, same capitalization")
(check-equal? (bt-find (leaf "a") "A")
              "a"
              "Simple case: At root, different capitalization")
(check-equal? (bt-find (leaf "alphabet") "ALPHAbet")
              "alphabet"
              "Simple case: At root, different capitalization")
(check-false (bt-find (leaf "B") "A")
             "Simple case: Not in small tree")
(check-false (bt-find (one-of-many 10 2 "C" "D") "E")
             "Normal case, not in big tree")
(check-equal? (bt-find (one-of-many 10 0 "E" "zero") "ZERO")
              "zero"
              "Big tree zero")
(check-equal? (bt-find (one-of-many 10 1 "F" "one") "ONE")
              "one"
              "Big tree one")
(check-equal? (bt-find (one-of-many 10 2 "G" "two") "TWO")
              "two"
              "Big tree two")
(check-equal? (bt-find (one-of-many 10 3 "H" "three") "THREE")
              "three"
              "Big tree three")
(check-equal? (bt-find (one-of-many 10 4 "I" "four") "FOUR")
              "four"
              "Big tree four")
(check-equal? (bt-find (one-of-many 10 5 "J" "five") "FIVE")
              "five"
              "Big tree five")
(check-equal? (bt-find (one-of-many 10 6 "K" "six") "SIX")
              "six"
              "Big tree six")
(check-equal? (bt-find (one-of-many 10 7 "L" "seven") "SEVEN")
              "seven"
              "Big tree seven")
(check-equal? (bt-find (one-of-many 10 8 "M" "eight") "EIGHT")
              "eight"
              "Big tree eight")
(check-equal? (bt-find (one-of-many 10 9 "N" "nine") "NINE")
              "nine"
              "Big tree nine")
```

---

## Running time

_Use a mental model of computation to count the relevant number of operations performed by a function._

The following procedure finds the largest numeric value in a tree of real numbers.

```racket
;;; (tree-largest tree) -> real?
;;;   tree : treeof real?
;;; Find the largest value in a non-empty tree of real numbers
(define tree-largest
  (lambda (tree)
    (cond
      ; Empty trees are an error
      [(empty-tree? tree)
       (error "Boom!")] ; Isn't that helpful?
      ; The largest value in a leaf is the leaf
      [(leaf? tree)
       (bt/t tree)]
      ; If there's no left subtree, compare the top value to the
      ; largest in the right.
      [(empty-tree? (bt/l tree))
       (max (bt/t tree) (tree-largest (bt/r tree)))]
      ; If there's no right subtree, compare the top value to the
      ; largest in the left
      [(empty-tree? (bt/r tree))
       (max (bt/t tree) (tree-largest (bt/l tree)))]
      ; Otherwise, we want the largest of (a) the top element, (b)
      ; the largest in the left subtree, or (c) the largest in the
      ; right subtree.
      [else
       (max (bt/t tree) 
            (tree-largest (bt/l tree)) 
            (tree-largest (bt/r tree)))])))
```

Here's a sample tree.

```racket
(define sample
  (bt 5
      (bt 3
          (bt 6
              (empty-tree)
              (leaf 2))
          (empty-tree))
       (bt 1
           (leaf 4)
           (leaf 7))))
```

Determine how many times `max` will be called in evaluating `(tree-largest sample)`.

You may either (a) use your mental model of computation, (b) instrument the code to print or count, or (c) logically analyze the code. In addition to the final count, show your work---either (a) an execution trace if you use your mental model, (b) the instrumented code if you instrument the code, or (c) an explanation of your analysis, if you analyze.  You can also do more than one of those, if you'd like to check yourself.

> _Space for answer_

---

## Searching

_Update or modify fundamental searching algorithms or trace the execution of those algorithms over concrete inputs._

Consider the following vector, represented in a way that makes indices and elements clear.

```
 0 : "Addison"
 1 : "Adrian"
 2 : "Aisley"
 3 : "Bailey"
 4 : "Beverly"
 5 : "Blake"
 6 : "Brett"
 7 : "Brook"
 8 : "Dakota"
 9 : "Dallas"
10 : "Dana"
11 : "Ellery"
12 : "Harley"
13 : "Hillary"
14 : "Hunter"
15 : "Jamie"
16 : "Lesley"
17 : "Mackenzie"
18 : "Madison"
19 : "Morgan"
20 : "Parker"
21 : "Quinn"
22 : "Reese"
23 : "Riley"
24 : "Sammie"
25 : "Shawn"
26 : "Taylor"
27 : "Temple"
28 : "Val"
```

As you may recall, the core of `binary-search` (code at the end) keeps track of a lower-bound (inclusive) and upper-bound (exclusive) within which we should be able to find the value, if it's in the vector.  For this vector, the lower-bound starts out as 0 and the upper-bound starts out as 29.

**a. Give the values of lower-bound, upper-bound, midpoint, and middle-key in each step as binary-search searches this vector in the following call.**

```
(binary-search names "Quinn" (lambda (x) x) string-ci<=?)
```

For example,

```
lower-bound: 0, upper-bound: 29
midpoint: 14, middle key "Hunter".  
  "Quinn" should follow "Hunter".

lower-bound: 15, upper-bound: 29 
midpoint: 22, middle key: "Reese"
  "Quinn" should precede "Reese"

lower-bound: 15, upper-bound: 22
midpoint: ??: middle-key: ??
  ...
```

> _Space for an answer._

**b. Give the values of lower-bound, upper-bound, midpoint, and middle-key in each step as binary-search searches this vector in the following call.**

```
> (binary-search names "Charlie" (lambda (x) x) string-ci<=?)
```

> _Space for an answer._

**c. Here is the binary search tree created by `vector->tree` from that vector.  How does a binary-tree search that tree relate to the binary search algorithm on the corresponding vector?**

```
> (vector->tree names)
'("Hunter"
  ("Brook"
   ("Bailey"
    ("Adrian" ("Addison" ◬ ◬) ("Aisley" ◬ ◬))
    ("blake" ("Beverly" ◬ ◬) ("Brett" ◬ ◬)))
   ("Ellery" ("Dallas" ("Dakota" ◬ ◬) ("Dana" ◬ ◬)) ("Hillary" ("Harley" ◬ ◬) ◬)))
  ("Reese"
   ("Madison"
    ("Lesley" ("Jamie" ◬ ◬) ("Mackenzie" ◬ ◬))
    ("Parker" ("Morgan" ◬ ◬) ("Quinn" ◬ ◬)))
   ("Taylor" ("Sammie" ("River" ◬ ◬) ("Shawn" ◬ ◬)) ("Val" ("Temple" ◬ ◬) ◬))))
```

> _Space for an answer._

_Here's the binary search algorithm, in case you need it._

```racket
;;; (binary-search vec key get-key less-equal?) -> integer?
;;;   vec : vector?
;;;   get-key? : procedure? unary?
;;;   less-equal? : procedure? binary?
;;; Search the vector for a value whose key is key.  Returns
;;;   the index of the matching element or #f.
;;; get-key is used to extract the keys and less-equal? 
;;;   specifies the ordering.
;;; Pre: The vector is sorted.  That is,
;;;   (less-equal? (get-key (vector-ref vec i)) 
;;;                (get-key (vector-ref vec (+ i 1))))
;;;   holds for all reasonable i.  
(define binary-search
  (lambda (vec key get-key less-equal?)
    ; Search a portion of the vector from lower-bound to upper-bound
    (letrec ([search-portion 
               (lambda (lower-bound upper-bound)
                 ; If the portion is empty
                 (if (>= lower-bound upper-bound)
                     ; Indicate the value cannot be found
                     #f
                     ; Otherwise, identify the middle point, the element at that 
                     ; point and the key of that element.
                     (let* ([midpoint (quotient (+ lower-bound upper-bound) 2)]
                            [middle-element (vector-ref vec midpoint)]
                            [middle-key (get-key middle-element)])
                       (cond
                         ; If the middle key equals the value, we use the middle value.
                         [(and (less-equal? key middle-key)
                               (less-equal? middle-key key))
                          midpoint]
                         ; If the middle key is too large, look in the left half
                         ; of the region.
                         [(less-equal? key middle-key)
                          (search-portion lower-bound midpoint)]
                         ; Otherwise, the middle key must be too small, so look 
                         ; in the right half of the region.
                         [else
                          (search-portion (+ midpoint 1) upper-bound)]))))])
      (search-portion 0 (vector-length vec)))))
```

## Functional vs. imperative approaches

_Compare aspects of functional programming (e.g., everything is an expression, parameters are not mutable, procedures can be parameters) with aspects of imperative programming (e.g., mutable structures with sequencing)._

Some programmers dislike the mutability of structures like vectors and hash tables because they make programs less predictable.

Consider, for example, the following code fragments.

```
(define stuff (vector 10 'x))
...
(let ([tmp (vector-ref stuff 0)])
  (do-something-with other-stuff)
  (if (equal? tmp (vector-ref stuff 0))
      "Okay"
      "I'm confused"))
```

You'll note that `tmp` is defined as `(vector-ref stuff 0)` right before the call to `(do-something-with other-stuff)` and is then compared to that same expression immediately afterwards.  It would seem that we would see the value "Okay".  Nontheless, it is possible for this code to produce "I'm confused". 

Give two different ways in which this code could produce `"I'm confused"`.   That is, fill in the missing code, as well as the definitions of `do-something-with` and `other-stuff` in such a way that we get the confusing result.

## Functional vs. imperative approaches

_Compare aspects of functional programming (e.g., everything is an expression, parameters are not mutable, procedures can be parameters) with aspects of imperative programming (e.g., mutable structures with sequencing)._

As we've told you, CSC-151 is a course in functional programming.  If you've programmed before, you've likely seen that the approaches we use in CSC-151 are a bit different.  Here are some of them.

* The same procedure applied to the same parameter produces the same result.
* A procedure call does nothing other than compute a result.
* Almost everything is an expression.  Expressions can be used anywhere.  So, for example, a lambda expression can be the return value of a procedure and a let expression can be nested almost anywhere within a cond.
* Procedures can be parameters to other procedures and can be returned by procedures.

However, Scheme is not a pure functional language.  There are aspects of Scheme that violate many of these principles.  For example, we've seen procedures, such as `random`, that return different values when given the same parameter and we've seen other procedures, such as `vector-set!`, whose purpose is to change their parameter.

a. Give at least one procedure (other than `random`) that can return different values when given the same immutable values as parameters.

b. Give at least five procedures (other than `vector-set!`) that change their parameters.

