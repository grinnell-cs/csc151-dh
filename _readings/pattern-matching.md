---
title: Pattern matching
summary: |
  We also introduce pattern matching as an elegant way of capturing case analysis on the shape of data.
---

_This reading is under development._

Recall that one of our design goals is to write programs that are correct from inspection.
In particular, when we have a recursive design, we want our code to look like that design.
Let's see how our definition of length fares in this respect
Below, we have replicated the definition of `length` with the recursive design in-lined in comments:

~~~racket
(define length
  (lambda (lst)
    (if (null? lst)                   ; A list is either empty or non-empty.
        0                             ; + The empty list has zero length.
        (let ([head (car lst)]        ; + A non-empty list has a head and tail
              [tail (cdr lst)])       ; element.
             (+ 1 (length tail))))))  ;   The length of a non-empty list is one
                                      ;   plus the length of the tail.
~~~

Not too bad!
Like our design, the code is clearly conditioned on whether `lst` is empty or non-empty.
Furthermore, the results of the cases clearly implement the cases of our design, so we can believe our implementation is correct as long as we believe our design is correct.

Is there anything we can improve here?
Yes—some subtle, yet important things, in fact:

+ We need to make sure that the guard of our conditional accurately reflects the cases of our data structure.
  Here, our list is either empty or non-empty which is captured by a `null?` check.
+ We know that in the recursive case that our non-empty list is made up of a `head` and `tail` which we need to manually access using `car` and `cdr`, respectively.
  Let-bindings name these individual pieces so that we don't interchange `car` and `cdr` in our code, but the let-binding adds a significant layer of complexity.

To fix these issues, we'll use the *pattern matching* facilities of Racket to express our recursive design directly without the need for a guard expression or let-binding.
Note that when we talk about pattern matching here, we don't mean regular expressions but instead a separate library of Racket for writing code that looks at the *shape* of a data type.

First, we'll revise our list definition slightly based on the functions we use to construct lists.

> A list is either:
> + `(list)`, the empty list (`null` may be a more readable alternative to `(list)`).
> + `(cons v l)`, a non-empty list constructed with `cons` that consists of a head element `v` and a list `l`.

Remember that a list is ultimately composed of repeated `cons` calls ending in `the empty list (`null`, `'()`, or `(list)`).
For example:

~~~racket
> (list 1 2 3 4 5)
'(1 2 3 4 5)
> (cons 1 (cons 2 (cons 3 (cons 4 (cons 5 null)))))
'(1 2 3 4 5)
~~~

Because of this, we know that our *constructive definition* of a list covers all possible lists.
Now, we'll use pattern matching to directly express `length` in terms of this constructive definition:

~~~racket
(require racket/match)

(define length
  (lambda (l)
    (match l
      [(list) 0]
      [(cons head tail) (+ 1 (length tail))])))
~~~

This version of `length` behaves identically to the previous version of the code but is more concise, directly reflecting our constructive definition of a list.
By doing so, we no longer need a let-expression to bind names to the components of the non-empty list—the `match` construct of Racket does this for us automatically!

### Pattern Matching In Detail

Pattern matching is available by including the `racket/match` package via `(require racket/match)`.
This package exposes a special form `match` that is syntactically similarly to a `cond` expression:

~~~racket
(match <expr>
  [<pat1> <expr1>]
  [<pat2> <expr2>]
  ...)
~~~

Following the `match` is an expression that evaluates to the value that is the *scrutinee* of the pattern match, *i.e.*, it is the value that we are analyzing.
Following the scrutinee are a collection of branches.
With `cond`, these branches had the form:

~~~racket
[<guard> <expr>]
~~~

Where `<guard>` is a boolean expression and `<expr>` is the expression that the overall `cond` evaluates to if `<guard>` evaluates to true.
Each of the guards of the branches are evaluated in top-down order until one returns true.

`match` behaves similarly except we attempt to `match` each branch in top-down order.
However, the branches of the `match` does not have guards; they have *patterns* instead!
A pattern describes a potential *shape* of the scrutinee.
If the scrutinee has that shape, then that branch is selected.

In the case of the empty list, this amounts to a simplified equality check.
The pattern `'()` means "is `l` equal to `'()`"?
So whenever `l` is the empty list, *i.e.*, `'()`, the `match` evaluates to `0`.

The non-empty list case is more interesting.
Recall that a non-empty list is formed by the `cons` function.
The pattern `(cons head tail)` checks to see if `l` is such a list.
However, on top of this check, if successful, the match also *binds* the two arguments of the `cons` to the variables `head` and `tail` respectively.
For example, we know that if `l` is `'(1 2 3 4 5)`, we can think of this as the following sequence of `cons` calls: `(cons 1 (cons 2 (cons 3 (cons 4 (cons 5 '())))))`.
Then the pattern `(cons head tail)` will bind `head` to `1` and `tail` to `(cons 2 (cons 3 (cons 4 (cons 5 null))))`.

We can visualize how a pattern will bind values by *overlaying* the pattern on top of the value:

~~~racket
(cons head tail)
(cons  1   (cons 2 (cons 3 (cons 4 (cons 5 null)))))

head = 1
tail = (cons 2 (cons 3 (cons 4 (cons 5 null))))
~~~

Here, we see that `head` lines up with `1` and ` tail` lines up with `(cons 2 ...)`.
In contrast, if `l` was `(cons 8 '())`, then we would have:

~~~racket
(cons head tail)
(cons   8   '())

head = 8
tail = '()
~~~

As another example, here is the `sum` function rewritten to use pattern matching:

~~~racket
(define sum
  (lambda (numbers)
    (match numbers
      ['() 0]
      [(cons head tail) (+ head (sum tail))])))
~~~

Again, note how the code is more concise and better reflects our recursive definition for list summation.

### Nesting Patterns

We gain immediate benefits of readability and conciseness with pattern matching.
But pattern matching is more powerful than what we've used so far: we can specify *arbitrary* patterns of values by nesting our patterns.
For example, suppose we want to write a pattern to bind the *first two* values of a list rather than just the top one.
With lists, we would need to chain `car` and `cdr` calls which is tedious and error-prone.
Instead, we can write the pattern `(cons x (cons y lst))` which matches a list with at least two elements and binds the first two elements to `x` and `y`, respectively, and `lst` to the remainder of the list.

~~~racket
(cons x (cons y lst))
(cons 1 (cons 2 (cons 3 (cons 4 (cons 5 '())))))

x = 1
y = 2
lst = (cons 3 (cons 4 (cons 5 '())))
~~~

We won't immediately use nested patterns in our recursive functions, but there will be a few cases where we will want to employ nested patterns for more complicated recursive designs.

### A Note on Bindings with Pattern Matching

In the non-empty case of `sum`, the branch:

~~~racket
[(cons head tail) (+ head (sum tail))]
~~~

Binds `head` to the head of the list and `tail` to the tail of the list.
This pattern binds the same variable as the following let-expression fragment:

~~~racket
(let ([head (car l)]
      [tail (cdr l)])
  (+ head (sum tail)))
~~~

As such, note that the names `head` and `tail` are arbitrary in our pattern and can be anything!
Frequently, you'll see me take the convention of naming the variables of the `cons` pattern as:

~~~racket
[(cons x xs) (+ x (sum xs))]
~~~

`x` is the head of the list, a single value.
`xs` is the tail of the list or, how I think of it: the *rest* of the `x`s.
However, you can choose whatever names make sense to you.
Another valid choice is to *shadow* the original parameter name:

~~~racket
[(cons x l) (+ x (sum l))]
~~~

In this branch, `l` no longer refers to the parameter of `sum` but it instead refers to the more-local binding of `l` as the tail of the list.
Recall that we say that this local binding of `l` *shadows* or *hides* the parameter `l` of the function.

Finally, note that sometimes we don't use all of the bindings introduced by a pattern.
For example, in `length`, we don't care about the head element of the list (we always add `1` to the result irrespective of what the head is):

~~~racket
[(cons x xs) (+ 1 (length xs))]
~~~

It is useful to avoid binding unnecessary identifier in our code as it isn't clear whether we should have incorporated `x` or if we intentionally didn't use it in our computation.
To capture the fact that `x` is unused, we can instead use an underscore `_` which matches anything but doesn't bind that value to a variable.

~~~racket
[(cons _ xs) (+ 1 (length xs))]
~~~

## Self checks

_Forthcoming._
