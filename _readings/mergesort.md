---
title: Merge sort
summary: |
  In [a recent reading](../readings/sorting.html) and
  [the corresponding laboratory](../labs/insertion-sort.html), we've
  explored the basics of sorting using insertion sort.  In this reading,
  we turn to another, faster, sorting algorithm, *merge sort*.
---
**This reading has been rewritten for Fall Term Two 2020.**

The costs of insertion sort
---------------------------

In looking at algorithms, we often ask ourselves how many "steps" the
algorithm typically uses.  Rather than looking at every kind of step,
we tend to focus on particular kinds of steps, such as the number of
times we have to call `vector-set!` or the number of values we look at.

Let's try to look at how much effort the insertion sort algorithm expends
in sorting a list of `n` values, starting from a random
initial arrangement.  Recall that insertion sort uses two lists: a growing
collection of sorted values and a shrinking collection of values left
to examine.  At each step, it inserts a value into the collection of
sorted values.

In the worst case, the value we're inserting should be preceded by all
the values in the list we're inserting it into.  In that case, we end up
comparing the value to all the elements in the list.  Since we insert into
lists from size 1 to `n`-1, the average list size is `n`/2.  We do `n`
such insertions, so the number of comparisons is approximately (`n`\*`n`)/2.
(More precisely, it's the sum 0 + 1 + 2 + ... + `n`-1, which ends up being
`n`*(`n`-1)/2.)

We get this effect, for example, when sorting a list of integers that
is already in order.  We insert the smallest, then the next smallest (which
goes to the end, then the next smallest (which goes to the end), and so
on and so forth.

In the tables below, we give the length of the list being sorted, the
initial condition of the list (i.e., increasing order, decreasing order,
or random), the sorting comparator, and the number of times it is called,
as well as the expression used to generate the line.

| `n` | Ordering   | `less-equal` | Calls | Command |
|:----|:-----------|:-------------|:------|:--------|
|  10 | Increasing | `<=`         | 45    | `(list-insertion-sort (range 10) <=)` |
|  20 | Increasing | `<=`         | 190   | `(list-insertion-sort (range 20) <=)` |
|  40 | Increasing | `<=`         | 780   | `(list-insertion-sort (range 40) <=)` |
|  80 | Increasing | `<=`         | 3160  | `(list-insertion-sort (range 80) <=)` |
{:.table}
{:.table-hover}

In the best case, the value we're inserting precedes all the values in
the list we're inserting it into.  In that case, we end up only comparing
it to the first element of the list.  Since there are `n`-1 times we
insert into a non-empty list, there are approximately `n`-1 comparisons.

We get this effect, for example, when sorting a list of integers that
is arranged from smallest to largest, and putting them in the order
largest to smallest.

| `n` | Ordering   | `less-equal` | Calls | Command |
|:----|:-----------|:-------------|:------|:--------|
| 10  | increasing | `>=`         | 9     | `(list-insertion-sort (range 10) >=)` |
| 20  | increasing | `>=`         | 19    | `(list-insertion-sort (range 20) >=)` |
| 40  | increasing | `>=`         | 39    | `(list-insertion-sort (range 40) >=)` |
| 80  | increasing | `>=`         | 79    | `(list-insertion-sort (range 80) >=)` |
{:.table}
{:.table-hover}

Since there's such a big difference between the worst case and the
best case, we should probably consider the "average" case.  There are,
unfortunately, a variety of definitions of average.  We'll chose a
simple one.  In particular, we'll say that, on average, the insert routine
needs to look through about half of the elements in the sorted part of
the data structure to find the correct insertion point for each new value
it places.  The size of that sorted part increases linearly from 0 to `n`,
so its average size is `n`/2 and the average number of comparisons needed
to insert one element is `n`/4.  Taking all the insertions together,
then, the insertion sort performs about `n`<sup>2</sup>/4
comparisons to sort the entire set.  That is, we do an average of `n`/4
comparisons for each insert, and we do `n` inserts, giving (`n`\*`n`)/4.

This function grows much more quickly than the size of the input list.
For example, if we have 10 elements, we do about 25 comparisons.  If we
have 20 elements, we do about 100 comparisons.  If we have 40 elements,
we do about 400 comparisons.  And, if we have 100 elements, we do about
2500 comparisons.

Does that really happen?  Let's try it with some "random" lists generated
by the following procedure.

```
(define rnum 
  (lambda (n) 
    (if (zero? n) 
        null 
        (cons (random 1000) 
              (rnum (- n 1))))))
```

| `n`  | Ordering   | `less-equal` | Calls | Command |
|:-----|:-----------|:---------------|:------|:--------|
|  10  | Random     | `>=`         | 34    | `(list-insertion-sort (rnum 10)  >=)` |
|  20  | Random     | `>=`         | 89    | `(list-insertion-sort (rnum 20)  >=)` |
|  40  | Random     | `>=`         | 464   | `(list-insertion-sort (rnum 40)  >=)` |
|  100 | Random     | `>=`         | 2429  | `(list-insertion-sort (rnum 100) >=)` |
{:.table}
{:.table-hover}

So, it's not exactly (`n`\*`n`)/4 steps, for some lists (and we wouldn't
expect it to be) but it's close enough for us to be confident that it
has a shape fairly similar to (`n`\*`n`)/4 steps.

Because this function grows so quickly, the corresponding algorithm
becomes quite slow to sort larger lists (say, with more than 10,000
values).  Hence, it is valuable to find a sorting method that performs
fewer comparisons per value in the list, even if it takes more effort
to preprocess the list or to write the procedure.  In this reading,
we explore one such procedure.

Divide and conquer
------------------

What techniques do we know for making algorithms faster?  As we saw in
the case of binary search, it is often profitable to divide an input
in half.  We call this technique *divide-and-conquer*.  The strategy
works somewhat differently for different domains.   For binary search,
once dividing the list in half, we could throw away half and then recurse
on the other half.  Clearly, for sorting, we cannot throw away part of
the list.  However, we can still rely on the idea of dividing in half.
That is, we'll divide the list into two halves, sort them, and then do
something with the two result lists.

Here's a sketch of the algorithm in Scheme:

```
(define new-sort
  (lambda (stuff less-equal)
    ; If there are only zero or one elements in the list,
    ; the list is already sorted.
    (if (or (null? stuff) (null? (cdr stuff)))
        stuff
        ; Otherwise, split the list in half
        (let* ([halves (split stuff)]
               [firsthalf (car halves)]
               [secondhalf (cadr halves)]
               ; And sort each half
               [sortedfirst (new-sort firsthalf)]
               [sortedsecond (new-sort secondhalf)])
           ; Do some more stuff
           *???*))))
``` 

Merging
-------

But what do we do once we've sorted the two sublists?  We need to
put them back into one list.  Traditionally, we refer to the process
of joining two sorted lists as *merging*.  It is
relatively easy to merge two lists: You repeatedly take whichever
element of the two lists should come first.  When do you stop?
When you run out of elements in one of the lists, in which case you
use the elements of the remaining list.  Putting it all together,
we get the following definition.

```
;;; (merge sorted1 sorted2 less-equal?)
;;;   sorted1 : a sorted list.
;;;   sorted2 : a sorted list.
;;;   less-equal : a binary predicate that compares values.
;;; Merge the two lists into a larger sorted list.
(define merge
  (lambda (sorted1 sorted2 less-equal)
    (cond
      ; If the first list is empty, return the second
      [(null? sorted1) 
       sorted2]
      ; If the second list is empty, return the first
      [(null? sorted2) 
       sorted1]
      ; If the first element of the first list is smaller or equal,
      ; make it the first element of the result and recurse.
      [(less-equal (car sorted1) (car sorted2))
       (cons (car sorted1) 
             (merge (cdr sorted1) sorted2 less-equal))]
      ; Otherwise, do something similar using the first element
      ; of the second list
      [else
       (cons (car sorted2) 
             (merge sorted1 (cdr sorted2) less-equal))])))
```

Splitting
---------

We know how to sort if we can split a list into two parts, sort the
smaller lists, and merge the sorted lists.  We can sort the smaller lists
recursively.  We've just figured out how to merge the two sorted lists.
All that we have left to do is to figure out how to split a list into two
parts.  One easy way is to get the length of the list and then cdr down
it for half the elements, accumulating the skipped elements as you go.
Since it's easiest to accumulate a list in reverse order, we re-reverse
it when we're done.  (Merge sort doesn't really care that they're in the
original order, but perhaps we want to use `split` for other purposes.)

```
;;; (split lst) -> listof list?
;;;    lst : list?
;;; Split a list into two nearly-equal halves.
(define split
  (lambda (lst)
    ;;; helper
    ;;;   Remove the first count elements of a list.  Return the
    ;;;   pair consisting of the removed elements (in order) and
    ;;;   the remaining elements.
    (letrec ([helper
              (lambda (remaining removed count)
                (write (list 'helper remaining removed count)) (newline)
                ; If no elements remain to be used,
                (if (= count 0)
                    ; The first half is in removed and the second half
                    ; consists of any remaining elements.
                    (list (reverse removed) remaining)
                    ; Otherwise, use up one more element.
                    (helper (cdr remaining)
                            (cons (car remaining) removed)
                            (- count 1))))])
      (helper lst null (quotient (length lst) 2)))))
```

In [the corresponding lab](../labs/mergesort), you'll have an opportunity
to consider other ways to split the list.  In that lab, you'll work with
a slightly changed version of the code.

Putting it together
-------------------

We saw most of the `merge-sort` procedure above, but with a bit of code
left to fill in.  Here's a new version, with that code filled in (and
a few other changes).

```
(define merge-sort
  (lambda (lst less-equal?)
    ; If there are only zero or one elements in the list,
    ; the list is already sorted.
    (if (or (null? lst) (null? (cdr lst)))
        lst
        ; Otherwise, 
        ;   split the list in half,
        ;   sort each half,
        ;   and then merge the sorted halves.
        (let* ([halves (split lst)]
               [some (car halves)]
               [rest (cadr halves)])
          (merge (merge-sort some less-equal?)
                 (merge-sort rest less-equal?)
                 less-equal?)))))
```

An alternative: From small lists to large lists
-----------------------------------------------

There's an awful lot of recursion going on in merge sort as we
repeatedly split the list again and again and again until we reach
lists of length one.  Rather than doing all that recursion, we can
start by building all the lists of length one and then repeatedly
merging pairs of neighboring lists.  For example, suppose we start
with sixteen values, each in a list by itself.

```
'((20) (42) (35) (10) (69) (92) (77) (27) (67) (62) (1) (66) (5) (45) (25) (90))
```

When we merge neighbors, we get sorted lists of two elements.  At some
places such as when we merge `(20)` and `(42)`,
the elements stay in their respective order.  At other places, such
as when we merge `(35)` and `(10)`, we need to
swap order to build ordered lists of two elements.

```
'((20 42) (10 35) (69 92) (27 77) (62 67) (1 66) (5 45) (25 90))
```

Now we can merge these sorted lists of two elements into sorted lists
of four elements.  For example, when we merge `(20 42)`
and `(10 35)`, we first take the 10 from the second list,
then the 20 from the first list, then the 35 from the second list,
then the 42 that is all that's left.

```
'((10 20 35 42) (27 69 77 92) (1 62 66 67) (5 25 45 90))
```

We can merge these sorted lists of four elements into sorted lists
of eight elements.

```
'((10 20 27 35 42 69 77 92) (1 5 25 45 62 66 67 90))
```

Finally, we can merge these sorted lists of eight elements into one
sorted list of sixteen elements.

```
'((1 5 10 20 25 27 35 42 45 62 66 67 69 77 90 92))
```

Now we have a list of one list, so we take the car to extract the list.

```
'(1 5 10 20 25 27 35 42 45 62 66 67 69 77 90 92)
```

Translating this technique into code is fairly easy.  We use one helper,
`merge-pairs` to merge neighboring pairs.  We use a second helper,
`repeat-merge` to repeatedly call `merge-pairs` until there are no more
pairs to merge.

```
(define new-merge-sort
  (lambda (lst less-equal?)
    (letrec (; Merge neighboring pairs in a list of lists
             [merge-pairs
              (lambda (list-of-lists)
                (cond
                  ; Base case: Empty list.
                  [(null? list-of-lists) null]
                  ; Base case: Single-element list (nothing to merge)
                  [(null? (cdr list-of-lists)) list-of-lists]
                  ; Recursive case: Merge first two and continue
                  [else (cons (merge (car list-of-lists) (cadr list-of-lists)
                                     less-equal?)
                              (merge-pairs (cddr list-of-lists)))]))]
             ; Repeatedly merge pairs
             [repeat-merge
              (lambda (list-of-lists)
                ; Show what's happening
                ; (display list-of-lists) (newline)
                ; If there's only one list in the list of lists
                (if (null? (cdr list-of-lists))
                    ; Use that list
                    (car list-of-lists)
                    ; Otherwise, merge neighboring pairs and start again.
                    (repeat-merge (merge-pairs list-of-lists))))])
      (repeat-merge (map list lst)))))
```

The costs of merge sort
-----------------------

At the beginning of this reading, we saw that insertion sort takes
approximately (`n`\*`n`)/4 steps to sort a list of `n` elements.  How long
does merge sort take?  We'll look at `new-merge-sort`, since it's easier
to analyze.  However, since it does essentially the same thing as the
original `merge-sort`, just in a slightly different order, the running
time will be similar.

We'll do our analysis in a few steps.  First, we will consider the
number of steps in each call to `merge-pairs`.  Next, we will consider
the number of times `repeat-merge` calls `merge-pairs`.  Finally, we'll
put the two together.  To make things easier, we'll assume that `n`
(the number of elements in the list) is a power of two.

Initially, `repeat-merge` calls `merge-pairs` on `n` lists of length 1
to merge them into `n`/2 lists of length 2.  Building a list of length
2 takes approximately two steps, so `merge-pairs` takes approximately
`n` steps to do its first set of merges.

Next, `repeat-merge` calls `merge-pairs` on `n`/2 lists of length 2 to
merge them into `n`/4 lists of length 4.  Building a merged list of length
4 takes approximately four steps, so `merge-pairs` takes approximately
`n` steps to build `n`/4 list of length 4.

Each time, `repeat-merge` calls `merge=pairs` to
merge `n`/2<sup>`k`</sup> lists of length
2<sup>`k`</sup> into `n`/2<sup>`k`+1</sup>
lists of length 2<sup>`k`+1</sup>.  A little math suggests
that this once again takes approximately `n` steps.

So far, so good.  Now, how many times do we call `merge-pairs`?  We go
from lists of length 1, to lists of length 2, to lists of length 4,
to lists of length 8, ..., to lists of length `n`/4, to lists of
length `n`/2, to one list of length `n`.  How many times did we call
`merge-pairs`?  The number of times we need to multiply 2 by itself
to get `n`.  As we've noted before, the formal name for that value is
log<sub>2</sub>(`n`).

To conclude, merge sort repeats a step of `n`steps
log<sub>2</sub>(`n`) times.  Hence, it takes approximately
`n`*log<sub>2</sub>(`n`) steps.

Is this much better than insertion sort, which took approximately
`n`<sup>2</sup>/4?  Here's a chart that will help you
compare various running times.

| `n`   | log<sub>2</sub>(`n`) | `n`*`n`   | `n`*`n`/4 | `n`*log<sub>2</sub>(`n`) |
|:------|:-----------|:----------|:----------|:---------------|
|  10   | 3.3        | 100       | 25        | 33             |
|  20   | 4.3        | 400       | 100       | 86             |
|  30   | 4.9        | 900       | 225       | 147            |
|  40   | 5.3        | 1,600     | 400       | 212            |
|  80   | 6.3        | 6,400     | 1,600     | 506            |
|  100  | 6.6        | 10,000    | 2,500     | 660            |
|  500  | 9.0        | 250,000   | 62,500    | 4,483          |
|  1000 | 10.0       | 1,000,000 | 250,000   | 10,000         |
{:.table}
{:.table-hover}

As you can see, although the two sorting algorithms start out taking
approximately the same time, as the length of the list grows, the
relative cost of using insertion sort becomes a bigger and bigger ratio
of the cost of using merge sort.

Does merge sort really take about `n`\*log<sub>2</sub>(`n`)?  Let's see.

| `n`  | Ordering   | `less-equal` | Calls | Command |
|:-----|:-----------|:-------------|:------|:--------|
|  10  | Increasing | `>=`         | 19    | `(merge-sort (range 10) >=)` 
|  10  | Random     | `<=`         | 22    | `(merge-sort (rnum 10) <=)`
|  20  | Increasing | `<=`         | 40    | `(merge-sort (range 20) <=)`  
|  20  | Increasing | `>=`         | 48    | `(merge-sort (range 20) >=)` 
|  20  | Random     | `<=`         | 63    | `(merge-sort (rnum 20) <=)`
|  40  | Increasing | `<=`         | 100   | `(merge-sort (range 40) <=)`   
|  40  | Increasing | `>=`         | 116   | `(merge-sort (range 40) >=)` 
|  40  | Random     | `<=`         | 164   | `(merge-sort (rnum 40) <=)`
|  100 | Increasing | `<=`         | 316   | `(merge-sort (range 100) <=)`
|  100 | Increasing | `>=`         | 356   | `(merge-sort (range 100) >=)` 
|  100 | Random     | `<=`         | 548   | `(merge-sort (rnum 100) <=)`
|  500 | Random     | `<=`         | 3879  | `(merge-sort (rnum 500) <=)`
|  1000| Random     | `<=`         | 8862  | `(merge-sort (rnum 1000) <=)`
{:.table}
{:.table-hover}

So, it does a bit better than predicted for already sorted (or
backwards-sorted) lists.  (Can you figure out why?) <!-- Because we only
have to do half the comparisons to exhaust one sublist. -->  For random
lists, the estimate is pretty good.  For large lists, merge sort clearly
beats insertion sort.

Documenting merge sort
----------------------

You may have noted that we have not yet written the documentation for
merge sort.  Why not?  Because it's basically the same as the documentation
for any other sorting routine.  

Self checks
-----------

### Check 0: Divide and Conquer

a. Why is merge sort called a "divide and conquer" algorithm?

b. Name one other divide-and-conquer algorithm we have studied.

### Check 1: Merging (‡)

Using the `merge` procedure from above.

a. Write an expression to merge the lists `(1 2 3)` and
`(1 1.5 2.3)`.

b. Write an expression to merge two identical lists of numbers.
For example, you might merge the lists `(1 2 3 5 8 13 21)`
and `(1 2 3 5 8 13 21)`

c. Write an expression to merge two lists of strings.  (You may choose the
strings yourself.  Each list should have at least three elements.)

### Check 2: Splitting (‡)

Use the `split` procedure above to split:

a. A list of six real numbers.

b. A list of five real numbers.

c. A list of six strings.

Give the argument to `split` as well as the result of the `split` operation.

### Check 3: Sorting

a. Run `merge-sort` on a list you design of fifteen integers.

b. Run `new-merge-sort` on a list you design of ten strings.

