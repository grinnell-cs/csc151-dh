---
title: Mini-Project 6
subtitle: Statistical language generation
summary: |
  In this assignment, you will explore alternate forms of language generation to those you worked with in MP5. In particular, you will write programs that generate (or attempt to generate) different forms of writing.  Along the way, you will explore issues pertaining to randomness and textual analysis.
collaboration: |
  Each student should submit their own responses to this assignment. You may
  consult other students in the class as you develop your responses.  You
  may also consult with the normal host of other folks: Mentors, tutors,
  SamR, Grinnell CS students, random strangers on the Web, and so
  on and so forth.  If you receive help from anyone, make sure to
  cite them in your responses. You do not need to cite course pages
  you were instructed to read for this assignment.
link: false
admin: |
  Cut, cut, cut.
---
# {{ page.title }} : {{ page.suubtitle }}

Note: In doing this mini-project, you will likely want to refer back
to [the prior assignment on language generation](../assignments/mp05)
to [the reading on hash tables](../readings/hash-tables), to
[the reading on randomness](../readings/randomness), and to
[the reading on files](../readings/text-files).  There are also
other materials likely to be of help, but those form a good start.

Please name your file `statistical-language-generation.rkt`.

## Background

As you may have heard, in recent years, computer scientists have
developed a variety of techniques that produce surprisingly readable
"new" text.  Although early work on text generation focused on some
of the issues we've been working with, such as using templates, and
on identifying parts of speech, most modern language generation
focus more on statistical techniques.

One of the techniques that is easiest to comprehend (at least for
your instructors) involves recording patterns from text and then
using those patterns to generate new text.  In particular, for each
sequence of successive words in a text, we might gather all of the
words that follow that sequence in a large corpus, along with the
probability of each word appearing.  Here's part of a simple table
giving that kind of information for an invented text, using two-word
sequences.

```
at the: [cat,1/2] [rat,1/2] 
cat spat: [at,1/2] [on,1/2] 
fat rat: [jump,1/2] [put,1/2] 
it is: [now,1] 
on the: [cat,1/7] [flat,1/7] [hat,3/7] [rat,2/7] 
rat it: [is,1] 
rat the: [cat,1/4] [fat,1/4] [rat,1/2] 
spat at: [the,1] 
spat on: [the,1] 
the cat: [and,1/8] [s,1/8] [sat,1/8] [spat,1/4] [the,1/4] [wore,1/8] 
the fat: [rat,1] 
the rat: [had,1/6] [how,1/12] [it,1/12] [someone,1/12] [spat,1/4] [the,1/4] [was,1/12] 
```

Let's explore the generation of a sort piece of text from that table.

We'll start with "the cat".  12.5% (1/8) of the time, we'll choose "and" as
the next word.  12.5% (1/8) of the time, we'll choose "s" as the next word.
(That's a consequence of a mediocre word extraction algorithm.  We probably
had cat's in the original text.)  And so on and so forth.  Suppose
we randomly choose "spat".  Our phrase is now "the cat spat".

We look up "cat spat".  Half the time, the next word will be "on"; half
the time, the next word will be "at".  We'll suppose it's "on"  We've
now reached "the cat spat on".

We look up "spat on".  There aren't many options here.  The next word
is always "the".  (We said it wasn't a great text.)  We're now at
"the cat spat on the".

We look up "on the".  It appears that this is followed by "cat" 1/7
of the time, something flat 1/7 of the time, a hat 3/7 of the time,
and rat 1/7 of the time.  Let's suppose the random generator chooses
rat.  "the cat spat on the rat".  It's a complete sentence.  But
we're not worrying about sentence termination (at least not in
this assigment).  Let's go on.

"the rat" can be followed by a wide variety of words.  (It appears
that someone enjoyed writing about rats.)  Let's suppose we randomly
select "the".  "the cat spat on the rat the".  Not great English.
As we noted, we're not worrying about sentence breaks.  

What can follow "rat the"?  "rat", "fat", or "cat".  Let's suppose
it's "fat".  "the cat spat on the rat the fat".

What follows "the fat"?  Only "rat".  But that's okay; it sounds like
we're getting the subject of another sentence.

> the cat spat on the rat

> the fat rat ...

Fun, isn't it?  Don't worry; things will be better with a better
corpus.

As the use of the word "table" in our description suggests, we will
store information in a hash table.  The keys of the hash table will
be two-word sequences.  The values will be a list of word/probability
pairs for the successors.

But we can't build the list of word/probability pairs until we have
a list of all the successors.  So before building that table, we'll
first build a hash table whose values are lists of successors.

Look ahead for more details.


## Project stages

### Stage One: Tabling successors

Consider the following procedures.

```
;;; (add-successor! successor-table predecessor successor) -> void?
;;    successor-table: hash? (keys are strings, values are lists of strings)
;;;   predecessor : string?
;;;   successor : string?
;;; Add successor to the list of successors of predecessor.  If
;;; predecessor currently has no successors, creates a new list.
```

```
;;; (get-successors successor-table predecessor) -> listof string?
;;;   successor-table : hash? (keys are strings, values are lists of strings)
;;;   predecessor : string?
;;; Look up all of the successors of predecessors which have been
;;; stored by add-successor.  If there are no such values, returns
;;; the empty list.
```

Here's a quick (and incomplete) test program for `add-successor!`
and `get-successors`.

```
(define test-table (make-hash))
(test-equal? "No successors in initial table."
             (get-successors test-table "once upon")
             '())

(add-successor! test-table "once upon" "a")
(test-equal? "Our first successor"
             (get-successors test-table "once upon")
             '("a"))

(add-successor! test-table "once upon" "a")
(test-equal? "The same successor again"
             (get-successors test-table "once upon")
             '("a" "a"))

(test-equal? "No successors for a different predecessor"
             (get-successors test-table "upon a")
             '())

(add-successor! test-table "upon a" "time")
(add-successor! test-table "upon a" "mattress")
(add-successor! test-table "upon a" "time")
(test-equal? "Different successors"
             (get-successors test-table "upon a")
             '("time" "mattress" "time"))
```

Write `add-successor!` and `get-successors`.

### Stage Two: Tabling many successors

Now that you have the most basic steps for building the table down, you
can get to work building the table.

Write a procedure, `(add-text-to-table! successor-table file-name)`,
that reads all the words from the file with the given name and
adds the appropriate two-word predecessor + one-word successor to
the table.  

You may, but need not, convert all the words to lowercase.

You may, but need not, accommodate more than just sequences of letters.

You will likely find it helpful to write a procedure that takes
the successor table and a list of strings and grabs the two-word
predecessors and the one-word successors from the list of strings.
If you write that helper, `add-text-to-table!` will mostly involve
reading all the strings from the file into a list and then calling
this new procedure.

In addition, you should generate one or more small text files to use for 
testing `add-text-to-table!` and write one or more tests using that file
or those files.

### Stage Three: Building probability tables

Right now, our successor table contains lists of words.  For concision
and clarity, it is better to turn those lists of words into a
"probability table", one that gives the probability of each word
occurring.  As the name suggests, we will use a hash table for this
purpose, too.  However, we will construct the table in multiple
steps Initially, the table will contain counts.  After we finish
constructing the table, it will contain probabilities.

First, document, write tests for, and implement a procedure, `(add-word!
count-table word)`, that increments the count associated with a given
word.

```
> (define sample-counts (make-hash))
> (hash-ref sample-counts "hello" 0)
0
> (add-word! sample-counts "hello")
> (add-word! sample-counts "hello")
> (hash-ref sample-counts "hello" 0)
2
> (add-word! sample-counts "goodbye")
> (hash-ref sample-counts "hello" 0)
2
> (hash-ref sample-counts "goodbye" 0)
1
```

Next, document, write tests for, and implement a procedure, `(add-words!
count-table words)`, that increments the count associated with each
word in words.

```
> (hash-ref sample-counts "hello")
2
> (hash-ref sample-counts "goodbye")
1
> (hash-ref sample-counts "hi")
. . hash-ref: no value found for key
  key: "hi"
> (hash-ref sample-counts "hi" 0)
0
> (add-words! sample-counts
              '("hello" "hi" "goodbye" "hi" "goodbye" "hi" "hi" "hi" "goodbye"))
> (hash-ref sample-counts "hello")
3
> (hash-ref sample-counts "goodbye")
4
> (hash-ref sample-counts "hi" 0)
5
```

Next, write a procedure `(counts->probabilities counts)`, that takes
a hash table of counts and creates an equivalent hash table of
probabilities.

```
> (hash-keys sample-counts)
'("hi" "hello" "goodbye")
> (hash-ref sample-counts "hi")
5
> (hash-ref sample-counts "hello")
3
> (hash-ref sample-counts "goodbye")
4
> (define sample-probs (counts->probabilities sample-counts))
> (hash-ref sample-probs "hi")
5/12    
> (hash-ref sample-probs "hello")
1/4     ; 3/12
> (hash-ref sample-probs "goodbye")
1/3     ; 4/12
```

Finally, write a procedure, `(words->probabilities words)`, that
takes a list of words as input and returns a hash table that gives
the probability of each word appearing.

```
> (define new-sample-probs
    (words->probabilities '("hi" "hello" "hi" "hi"
                                 "hello" "goodbye")))
> (hash-ref new-sample-probs "hi")
1/2
> (hash-ref new-sample-probs "hello")
1/3
> (hash-ref new-sample-probs "goodbye")
1/6
```

#### Stage Four: Probablistic selection

Document and write a procedure, `(probabilistic-select probability-table)`,
that randomly selects a word from a probability table, making sure
that words are given back more-or-less according to their probability.

Hint: You may want to convert the table to a list for these
purposes.

Note: `(random)` with no parameter gives you an unpredictable
inexact number between 0 (inclusive) and 1 (exclusive).

Although you can't exactly test randomized procedures, you should
have an experiment that suggests that it's close.  Here's the
start of such an experiment.

```
(define probabilistic-word-list
  (lambda (probability-table n)
    (if (zero? n)
        null
        (cons (probabilistic-select probability-table)
              (probabilistic-word-list probability-table (- n 1))))))
```

```
> (define new-sample-probs
    (words->probabilities '("hi" "hello" "hi" "hi"
                                 "hello" "goodbye")))
> (probabilistic-word-list new-sample-probs 20)
'("hi" "hi" "hello" "hi" "goodbye" 
  "hello" "goodbye" "hi" "hello" "hello" 
  "hello" "hi" "hi" "hi" "hi" 
  "hello" "goodbye" "hi" "hi" "hello")
; Hmmm ... Not quite the distribution I expected.  Let's build something bigger.

> (define words (probabilistic-word-list new-sample-probs 1200))
> (tally-value words "hi")
591 ; About 1/2
> (tally-value words "hello")
418 ; About 1/3
> (tally-value words "goodbye")
191 ; About 1/6

```

### Stage Five: Building the full table

We're getting pretty close to finishing.  As you may recall, there are
two parts to text generation.  First, we need to build a table that,
for any word pair that appears in the original text, gives a table
of potential successors and their probabilities.  Next, we need to
use that table to generate the text.

But we aren't quite through building the table.  We built a table that,
for any word pair that appears in the original text, gives the list
of all successors.  We need to convert *all* of the lists to tables.

Document and write a procedure `(make-text-table successor-table)`
that takes the table of successor lists you created with
`add-text-to-table` in stage two as input and returns a new table.

### Stage Six: Generating text

Now that we have the table, we can generate text.  At least we should
be able to generate test.  The basic algorithm is fairly straightforward:
Start with two words that appear somewhere in the text.  Look them up
in the table to get the successor probabilities.  Select one of those.
Now you have a new pair of words (the second of the original set and this
new successor).  Do it again and again and again, and eventually you
have a long string of words that may or may not be readable.

Document and write a procedure, `(generate-text text-table word1
word2 n)`, that takes a table, two starting words, and an integer
as input and generates a list of `n` words using the text generation
process.

You may assume that `n` is at least 2.

```
> (generate-text cat-table "the" "cat" 2)
'("the" "cat")
> (generate-text cat-table "the" "cat" 3)
'("the" "cat" "sat")
> (generate-text cat-table "the" "cat" 4)
'("the" "cat" "sat" "on")
> (generate-text cat-table "the" "cat" 5)
'("the" "cat" "sat" "on" "the")
> (generate-text cat-table "the" "cat" 6)
'("the" "cat" "spat" "at" "the" "cat")
> (generate-text cat-table "the" "cat" 7)
'("the" "cat" "the" "cat" "the" "cat" "wore")
> (generate-text cat-table "the" "cat" 8)
'("the" "cat" "the" "cat" "spat" "on" "the" "flat")
> (generate-text cat-table "the" "cat" 20)
'("the" "cat" "spat" "at" "the" "rat" "the" "rat" "how" 
  "about" "that" "the" "rat" "it" "is" "now" "a" "flat" "hat" "said")

> (generate-text janeula "not" "refuse" 10)
'("not" "refuse" "it" "for" "i" "told" "him" "out" "of" "you")
> (generate-text janeula "not" "refuse" 10)
'("not" "refuse" "but" "i" "had" "come" "over" "her" "troubles" "with")
> (generate-text janeula "not" "refuse" 10)
'("not" "refuse" "to" "let" "it" "grow" "into" "a" "habit" "no")
> (generate-text janeula "not" "refuse" 10)
'("not" "refuse" "it" "for" "it" "seemed" "to" "paralyse" "my" "faculties")

> (reduce (lambda (s1 s2) (string-append s1 " " s2))
          (generate-text janeula "i" "must" 200))
"i must smother hope i did not refuse but i suppose the general
terms of this we know not much pride under such circumstances is
the date of fifteen years ago from gateshead an entrance into a
quieter death nor he had retired in dudgeon quite to the wise
resolution of keeping her out of the road one can see a long journey
and i believe you said you are parted from him i was ignorant or
nearly so much as i would have a quieter character and competency
a situation in the west he turned the smoke the cigarette in the
blossom especially when it has been a terrible resemblance to her
mate than i have nothing else when i saw it both were again in
daylight even for him for ever and always checked forced to his
companions some word to write only formal notes now but not for all
our material ready and when i have read by your conduct is it not
be your chief delight and to ponder business on a nursery chair and
so little at dinner we immediately adjourned to the etiquette of
death about it mina i shall hide this paper is"
```

Adding a bit of punctuation to the last one ...

```
I must smother Hope.
I did not refuse.
But ... I suppose the general terms of this we know not.
Much pride under such circumstances is the date of fifteen years ago.
  (From gateshead an entrance into a quieter death.)
Nor he had retired in dudgeon quite to the wise resolution of keeping her out of the road.
One can see a long journey and I believe you said you are parted from him.
```

### Stage Seven: Showing off

Pick an interesting and reasonably large piece or pieces of text
and use them to demonstrate the procedures you've written by
generating a few hundred words, joining them together, and
reformatting slightly.  Make sure to include the generated
text in a comment, as well as the instructions you used

You might try a mash-up of texts (e.g., _Jane Eyre_ and _Dracula_),
a set of tweets, a curated collection of pages from Wikipedia, the
readings from this class, or anything else you consider interesting
or valuable to use.

Don't worry if the output is mediocre.  The technique is clearly
imperfect.  You may have to experiment a bit.

## What to submit

Please submit your Racket file along with any text files you used.

## Rubric

### Necessary for **R**

```
[ ] Code file has appropriate header
[ ] Code file runs correctly
[ ] Includes any text files referenced in the code
[ ] Stage one: `add-successor!` and `get-successors` pass the tests
[ ] Stage two: `add-text-to-table!` reads from a file
[ ] Stage three: `add-word!` and `add-words!` pass the tests
[ ] Stage four: `probabilistic-select` selects a word (even if not according to the probability distribution)
[ ] Stage five: `make-text-table` returns a table of the correct form (even if it's not the correct table)
```

### Necessary for **M**

```
[ ] Code is correctly indented with Ctrl-I
[ ] No misleading variable, procedure, or parameter names
[ ] All procedures documented
[ ] No glaringly inefficient code (e.g., repeated calls to `list-ref` or `length`)
[ ] Stage two: `add-text-to-table!` appears to work correctly
[ ] Stage three: `words->probabilities` passes tests
[ ] Stage four: `probabilistic-select` appears to work correctly
[ ] Stage five: `make-text-table` appears to work correctly for most cases, but might have a few flaws
[ ] Stage six: `generate-text` passes the tests
[ ] Stage seven: Includes examples
```

### Necessary for **E**

```
[ ] Stage two: Includes additional small text files and associated tests
[ ] Stage three: `add-words!` implemented concisely, with `for-each`
[ ] Stage four: Includes a reasonable experiment for probabilistic-select, more than what is provided in the assignment
[ ] Stage five: `make-text-table` appears flawless
[ ] Stage five: `make-text-table` includes examples that demonstrate that it works correctly
[ ] Stage six: `generate-text` appears to work correctly
[ ] Stage six: `generate-text` includes examples that demonstrate that it works correctly
[ ] Stage seven: Particularly novel, clever, or fun examples
```
