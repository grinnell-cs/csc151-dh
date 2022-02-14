---
title: More fun with lists
summary: |
  We further explore Scheme's *list* structures.  Lists permit us to
  group data and process those data as a group.  We also explore the procedures
  that we can use with lists, such as `range`, `map`, and `apply`
---

## Useful procedures and notation

### Standard list notation

`'(val1 val2 ... valn)` - a list of `n` values.

### Creating lists

`(list exp1 exp2 ... expn)` - create a list by evaluating each of the
expressions and then joining together their values.

`(make-list n val)` - make a list of `n` copies of `val`.

`(range n)` - create a list of all the natural numbers strictly less
than `n` (starting with `0`).

`(range s n)` - create a list of all the natural numbers between `m`
(inclusive) and `n` (exclusive).

`(range s n i)` - create a list of all the natural numbers between `m`
(inclusive) and `n` (exclusive), incrementing by `i` each time.

### Manipulating lists

`(apply fun lst)` - apply the function to all the elements of the
list, _en masse_.

`(filter pred? lst)` - Select only the elements of the list for
which the predicate holds.

`(map fun lst)` - apply the function to each element of the list.
`(map fun (list val1 val2 ... valn))` gives you
`(list (fun val1) (fun val2) ... (fun valn))`.

`(map fun lst1 lst2)` - create a new list by applying the function to
corresponding pairs of elements from the two lists.  You can also use
`map` with more than two lists.

`(reduce binproc lst)` - reduce a list to a single value

`(sort lst compare?)` - Sort a list. 

### Other list operations

`(length lst)` - Determine how many elements are in a list.

`(reverse lst)` - Create a new list with the elements in the opposite
order.

`(append lst1 lst2)` - Join two lists together.

`(take lst n)` - Build a new list consisting of the first `n` elements
of `lst`.

`(drop lst n)` - Build a new list consisting of all but the first `n` 
elements of `lst`.

`(list-ref lst n)` - Extract element `n` of the list.  (Remember that
lists start with element 0.)

`(index-of val lst)` - Determine the position of `val` in `lst`.  (It
turns out the position is how many values need to be dropped
from `lst` to reach `val`.)

`(indexes-of lst val)` - Find all the indices of the value in the list.

### Fun higher-order procedures

`(o f1 f2 f3)` - Create a new procedure that applys
`f3` to its *one* argument, then `f2` to the result,
then `f1` to that result.  Note that this takes as many as you
you want.

`(section func <> val)` - Take a two parameter procedure and
create a one-parameter procedure b filling in the second
parameter.

## Preparation

a. If you have not done so already, you may want to open a
separate tab or window in your browser for the varous readings.

b. Introduce yourself to your partner.  Describe your strengths and
approaches to work.

c. Review the double-dagger problems with your partner.

{% if site.online %}
d. Decide who will do the Side A problems and who will do the Side B problems.
Then load the two halves of the lab.

* [lists-more-a.rkt](../code/labs/lists-more-a.rkt)
* [lists-more-b.rkt](../code/labs/lists-more-b.rkt)

e. Get started!
{% else %}
d. The person closer to the board is Side A.  The other is Side B.

e. Load the lab.

* [lists-more.rkt](../code/labs/lists-more.rkt)

f. Get started.

{% endif %}
