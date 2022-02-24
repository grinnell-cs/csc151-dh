---
title: Numeric recursion
summary: |
  We consider techniques for recursion over the natural numbers.
mathjax: true
---

In recursive design, our algorithms mimics the recursive definition of the structure we are operating over.
For lists, this leads us to write algorithms in terms of empty lists (the base case) and non-empty lists (the recursive case).
However, what other recursive structures exist out there?

In this reading, we study a data types that, at first, does not seem to have a recursive structures, the *natural number*.
We'll show in this reading that not only do natural numbers have a recursive structure that makes them amendable to recursive design, recursion over the natural numbers, so-called *numeric recursion*, is a cornerstone of many algorithms in computer science.

## A Recursive Definition of the Natural Numbers

Recall that a natural number is a nonnegative integer, *e.g.*, 0, 1, 2, 3, …, and so forth.
Where is the recursive structure in the natural numbers?
Let's look at an example: 5.

~~~racket
5
~~~

Ok.
That's not terribly interesting.
Unlike lists that are containers of data, a number is a primitive value that doesn't not "hold" anything else.
In that sense, it seems like there's nothing to break down about this value.
Thus, a different perspective is warranted!
Let's look at a *unary representation* of `5`.

~~~
| | | | |
~~~

In a unary representation of a number, we represent a number $$n$$ by $$n$$ tallies, here, represented by pipes (`|`).
(This is a unary representation because there is one digit in the number system, the tally.)

Now, do we see a smaller natural number inside of `5` somewhere?
Yes!
Let's highlight it below:

~~~
| | | | |
--------- 5
  ------- 4
~~~

We can see that `5` is simply `4` but with *one more tally* in our unary representation of the natural numbers.
Likewise we can see that `4` is simply `3` but with one more tally:

~~~
| | | | |
--------- 5
  ------- 4
    ----- 3
~~~

All the way down to 1:

~~~
| | | | |
--------- 5
  ------- 4
    ----- 3
      --- 2
        - 1
~~~

Each number is *one unit less* than the previous number.
But what about `1`?
What number is one unit less than one?
`0`, of course!

~~~
| | | | |
--------- 5
  ------- 4
    ----- 3
      --- 2
        - 1
          0
~~~

This completes our diagram that illustrates that a natural number of `5` can be decomposed recursively in terms of a smaller natural numbers, namely the natural number that is *one smaller* than it.
If we think of ordering the natural numbers in ascending order, then this is the number that *precedes* `5` in this order, *i.e.*, `4`.
We might also say that `5` is the *successor* of `4` in this ordering.
Finally, we note that `0` is the smallest natural number and is therefore the *base* of the ordering.

Putting all this together, we arrive at the following recursive definition of the natural numbers:

> A natural number $$n$$ is either:
> + Zero ($$n = 0$$)
> + The successor of some smaller natural number ($$n = k + 1$$ for some natural number $$k$$).

Here are some examples of this definition in action:

+ $$0$$ is a natural number by definition.
+ $$5$$ is a natural number because it is the successor of $$4$$, *i.e.*, $$5 = 4 + 1$$.
+ $$1$$ is a natural number because it is the successor of $$0$$, *i.e.*, $$1 = 0 + 1$$.
+ $$37$$ is a natural number because it is the successor $$36$$, *i.e.*, $$37 = 36 + 1$$.

Note that our definition does not cover negative integers.
This is a good thing because we said that the natural numbers did not include the negative integers!
But beyond this, note that if we included the negative integers in this definition, we would lose our base case.
`0` would become the successor of `-1`, `-1` is the successor of `-2`, and so forth.
There is now no number that serves as a base case for our recursive definition since *every* integer is the successor of some other integer!

## An example: The termial

As a first example of using the recursive definition of the natural numbers for an algorithm, let's consider writing a function that given a natural number, computes the result of adding all the natural numbers from `0` to that number, inclusive.
At Grinnell, this result is traditionally called the "*termial*" of the number, a play on the term "factorial".

As with list recursion, let's define this operation in terms of our recursive definition of the natural numbers.
Let's consider a natural number $$n$$.
We proceed by case analysis on $$n$$.

+   Suppose that $$n$$ is $$0$$.
    What is the termial of $$0$$?
    If we apply our definition of terminal directly to $$n = 0$$, we see that we sum up all the numbers from $$0$$ to $$0$$, inclusive.
    Of course, this is just $$0$$ which is our final result.
+   Now suppose that $$n$$ is non-zero.
    Because $$n$$ is a non-zero natural number, we know that $$n$$ is the successor of some smaller natural number, $$n - 1$$.
    How can we express the termial in terms of $$n$$ and $$n - 1$$?
    Observe what the definition of terminal tells us to compute:

    \\[
    n + (n-1) + (n-2) + \cdots + 1 + 0
    \\]

    How can we decompose this in terms of $$n$$, $$n-1$$, and a recursive call?
    Perhaps you see it immediately: we can see that the summation to the right of $$n +$$ is actually the termial of $$n-1$$:

    $$
    n + \underbrace{(n - 1) + (n - 2) + \cdots + 1 + 0}_{\text{termial(n - 1)}}
    $$

    Thus, the termial of $$n$$ is obtained by adding $$n$$ onto the termial of $$n - 1$$.

    But more often, you might not see the decomposition to begin with.
    Rather than staring at the screen not making progress, I highly encourage you to *look at concrete* examples to find *a pattern* of behavior that can help you make progress.

    For example, let's look at how termial ought to compute from its definition, for example on `5`:

    ~~~racket
    termial(5) = 5 + 4 + 3 + 2 + 1 + 0
    ~~~

    Now, we can proceed similarly to how we derive the recursive definition of the natural numbers.
    Do we see a recursive occurrence of a smaller `termial` call inside of this computation?
    Indeed we do!
    It is `4 + 3 + 2 + 1 + 0` which is `(termial 4)`.
    Thus:

    ~~~racket
    termial(5) = 5 + 4 + 3 + 2 + 1 + 0
    termial(5) = 5 + termial(4)
    ~~~

    Generalizing this pattern to `n` we obtain that `termial(n) = n + termial(5)`.

Note that this final expression is already awfully close to a direct implementation in Racket.
What pieces do we need for our recursive implementation of this algorithm?

+   We need a way to test to see if a number if zero/non-zero (*distinguishing the base case from the recursive case*).
+   We need a way to obtain the predecessor of a natural number (*extracting the smaller recursive occurrence of a value*).

With lists, we used either `null?/car/cdr` or pattern matching to accomplish these goals.
However, because natural numbers are primitives, we can use simple arithmetic tests and operations to create these effects.
Let's see this in action in our implementation of `termial`:

~~~racket
;;; (termial n) -> nat?
;;; n : nat?
;;;
;;; Returns n + (n-1) + (n-2) + ... + 1 + 0
(define termial
  (lambda (n)
    (if (zero? n)                   ; Check if n is zero:
        0                           ; + If n is zero, the sum is zero.
        (+ n (termial (- n 1))))))  ; + Otherwise, the sum is n plus
                                    ;   the termial of n - 1.
~~~

As we can see, we arrive at a straightforward translation of our design into code.
A few things to note about this implementation:

+   To test whether `n` is zero, we could have used `(= n 0)`.
    However the `zero?` predicate also performs this test in a more readable manner.
+   Because it is much easier to reason to recognize the predecessor of `n` as `(- n 1)`, we don't need to bother with let-binding as we did with lists.

Our mental model of evaluation allows us to check that `termial` behaves correctly.
For example, here is the evaluation trace of `(termial 3)`.
In this deviation, we take the short cut of simplifying the conditional directly to the branch it evaluates to.

~~~racket
    (termial 3)
--> (if (zero? 3) 0 (+ 3 (termial (- 3 1))))
--> (+ 3 (termial (- 3 1)))
--> (+ 3 (termial 2))
--> (+ 3 (if (zero? 2) 0 (+ 2 (termial (- 2 1)))))
--> (+ 3 (+ 2 (termial 1)))
--> (+ 3 (+ 2 (if (zero? 1) 0 (+ 1 (termial (- 1 1))))))
--> (+ 3 (+ 2 (+ 1 (termial (- 1 1)))))
--> (+ 3 (+ 2 (+ 1 (termial 0))))
--> (+ 3 (+ 2 (+ 1 (if (zero? 0) 0 (+ 0 (termial (- 0 1)))))))
--> (+ 3 (+ 2 (+ 1 0)))
--> (+ 3 (+ 2 1))
--> (+ 3 3)
--> 6
~~~

## A skeleton for numeric recursion

In summary, we have the following recursive definition of the natural numbers:

> A natural number $$n$$ is either:
> +   Zero or
> +   The successor of a natural number, *i.e.*, ($$n = k + 1$$ for some natural number $$k$$).

Like with lists, this definition allows us to derive a general skeleton for the design of a recursive function over a natural number:

> We define an operation over the natural numbers by case analysis:
> +   The base case: we consider what to do when the natural number is zero.
> +   The recursive case: we consider what to do when the natural number $$n$$ is non-zero assuming that the operation works for the predecessor of $$n$$, $$n-1$$.

Finally, this leads itself to a implementation skeleton for numeric recursive functions:

~~~racket
(define my-numeric-recursive-function
  (lambda (n)
    (if (zero? n)
        ; base case
        ; recursive case
)))
~~~

## Preconditions for `termial` and natural numbers

The restriction that `termial` takes only natural numbers is important.
If we gave it a negative number or a non-integer, we'd produce an infinite loop!
For example, watch how our `termial` evaluates with a negative number:

~~~racket
    (termial -1)
--> (if (zero? -1) 0 (+ -1 (termial (- -1 1))))
--> (+ -1 (termial (- -1 1)))
--> (+ -1 (termial -2))
--> (+ -1 (if (zero? -2) 0 (+ -2 (termial (- -2 1)))))
--> (+ -1 (+ -2 (termial (- -2 1))))
--> (+ -1 (+ -2 (termial -3)))
--> ...
~~~

Because we are subtracting repeatedly from an initially negative number, we'll never arrive at the termination condition `(zero? n)`!
This is the source of our infinite loop with negative numbers.

However, what about non-integers?

~~~racket
    (terminal 1.1)
--> (if (zero? 1.1) 0 (+ 1.1 (termial (- 1.1 1))))
--> (+ 1.1 (termial (- 1.1 1)))
--> (+ 1.1 (termial 0.10000000000000009))
--> (+ 1.1 (if (zero? 0.10000000000000009) 0 (+ 0.10000000000000009 (termial (- 0.10000000000000009 1)))))
--> (+ 1.1 (+ 0.10000000000000009 (termial (- 0.10000000000000009 1))))
--> (+ 1.1 (+ 0.10000000000000009 (termial -0.8999999999999999)))
--> ...
~~~

Note in this case that we skipped over `0` because of the fractional value!
Also note that inexact computation causes our results to become approximate rather than exact very quickly.
As a result, in some cases, we may land on zero but in other cases, we may not.
This is all dependent on the particular numbers and operations involved.

## Generalizing the base cases of a recursive function

As with lists, we have broken up our recursion into a single base and recursive case.
However, we should be aware that depending on the computation, we may need to refine our cases.
The golden rule is that we must always ensure that our base cases *cover* the execution of all possible inputs.

For example, recall that an even number is one that is divisible by `2`.
We showed how you can use `remainder` to compute divisibility directly.
However, we can also use recursion to perform a similar computation noting that:

+   Zero is even.
+   A non-zero natural number $$n$$ is even if $$n - 2$$ is even.

This leads directly to the following recursive implementation of an even predicate:

~~~racket
;;; (even? n) -> boolean?
;;; n : nat?
;;;
;;; Returns true iff n is even.
(define even?
  (lambda (n)
    (if (zero? n)
        #t
        (even? (- n 2)))))
~~~

The function seems to work on the positive cases:

~~~racket
> (even? 0)
#t
> (even? 4)
#t
> (even? 12)
#t
~~~

However, it fails miserably on the negative cases!

~~~racket
> (even? 3)
~~~

In fact, we go into an infinite loop on any odd number!
I recommend you trace through the execution of `3` on your own to convince yourself that this true.
However, as a quick "code smell", note that the definition of `even?` never returns `#f` but there are certainly non-even natural numbers out there!

How do we fix our function?
We can arrive at the fix with one of two insights:

1.  From the definition, we might note that we never identify what a "base" non-even, *i.e.*, odd, number is!
2.  From the trace, we might note that the function always hops over the `0` base case.
    The final natural number we reach before we go negative in these cases is `1` which is non-even.

Both insights suggest that we need *one additional base case* to cover the `1` case.
Our recursive design would be updated as follows:

+   Zero is even.
+   One is non-even.
+   A non-zero natural number $$n$$ is even if $$n - 2$$ is even.

And our implementation would be updated to reflect this change:

~~~racket
;;; (even? n) -> boolean?
;;; n : nat?
;;;
;;; Returns true iff n is even.
(define even?
  (lambda (n)
    (cond
      [(= 0 n) #t]
      [(= 1 n) #f]
      [else (even? (- n 2))])))
~~~

We switch to a `cond` because our conditional has three branches instead of two now.
But now, our function works as expected!

~~~racket
> (even? 0)
#t
> (even? 1)
#f
> (even? 2)
#t
> (even? 3)
#f
~~~

When do we need to include additional base cases in our recursive designs?
*It depends!*
There is no singular way of knowing these designs up-front.
You'll obtain a "spider sense" that will let you intuit when you might need to beyond the standard recursive template with practice.
However, you ultimately need to try *something*, typically the basic skeleton, encounter a failure, and realize that you might *fix* the problem by introducing additional cases.

## Self checks

### Check: Cases (‡)

After our discussion of generalizing the base cases of our recursive functions, we might get a bit paranoid and consider an implementation of `termial` as follows:

~~~racket
(define termial
  (lambda (n)
    (cond 
      [(= 0 n) 
       0]
      [(= 1 n) 
       1]
      [else
       (+ n (termial (- n 1)))])))
~~~

Experiment with this version of `termial`.
Is it correct?
If it is not correct, what is wrong with it?
If it is correct, is there anything disagreeable with it in terms of design?
Write your answer in a few sentences.
