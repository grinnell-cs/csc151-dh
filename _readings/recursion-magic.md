---
title: The magic of recursion (thinking recursively)
summary: We consider ways to think about recursion
link: true
---
_This reading is under development.  Please check back later._

There are many different ways that people come to understand, or
at least be able to employ, recursion. Some painstakingly trace out
recursive procedures to see how they expand into a giant expression
that, eventually reaches a base case and then builds back to a final
answer. Others rely on patterns, attempting to consider how each
new recursive procedure they write might bear a similarity to one
they have written or seen before.  And still others try to avoid explicit
recursion altogether, relying instead on the generalized recursive
procedures others have written, like `map` and `filter` and `reduce`.

However, those who seem most successful at employing the vast power
of recursion as a tool for solving problems embrace a bit of magic.
They start by solving the base case, an input whose result is so
obvious that even a cs prof could solve it. Then they assume that
the procedure they are currently working on already works, albeit
only for "smaller" inputs.  "_Suppose I could use this procedure_", they
ask, "_but only if I tweak the input a limitless bit. How does that
help me solve the problem?_"

Consider the problem of finding the longest string in a list.  If
you had never done this before, you might ask yourself or your
partner something like this, "How do we do this?  Should wecompare
one element to all the others?  Should I compare neighbors?  And
then what next?"

The recursive thinker instead asks "_Suppose we can find the longest
string in the cdr of the list, how do we find the longest string
in the whole list?_"  

```
(define longest-string
  (lambda (lst)
    (if (BASE-CASE-TEST)
        BASE-CASE
        (??? (longest-string (cdr lst))))))
```

But that seems straightforward. If they have the largest of the
cdr, it’s the only one in the cdr they need worry about; every other
element in the cdr is irrelevant.  So all they have to do is compare
the car to the recursive result.  

```
(define longest-string
  (lambda (lst)
    (if (BASE-CASE-TEST)
        BASE-CASE
        (longer-string (car lst) (longest-string (cdr lst))))))
```

Of course, they also have to handle the base case: The longest string
in a one-element list is that element.

```
(define longest-string
  (lambda (lst)
    (if (null? (cdr lst))
        (car lst)
        (longer-string (car lst) (longest-string (cdr lst))))))
```

And, well, they also need to write the `longer-string` procedure.


```
(define longer-string
  (lambda (str ing)
    (if (> (string-length str) (string-length ing))
        str
        ing)))
```

Starting by assuming that the recursive call worked led them (or
us) to the answers.  And that might be familiar?  We often design
procedures by decomposing them into "smaller" helper procedures
which we assume we can implement.  It's just that in this case, the
smaller procedure is the one we are writing.

"_**But how does it work**_?", some ask. The recursive programmer
doesn’t care. They trust the magic of recursion to make everything
work (we often refer to this as _the magic recursion fairy_). Deep
in their hearts, recursive programmers believe that there’s an underlying 
mathematcal proof that ensures that recursion works; they just can't
prove it themselves. However, they also know that any sufficiently
sophisticated mathematics is indistinguishable from magic. And so
they trust the magic recursion fairy.

You should, too 