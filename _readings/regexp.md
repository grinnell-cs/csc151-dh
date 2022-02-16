---
title: Regular expressions
summary: |
  We explore regular expressions in Racket.  Regular expressions allow us to search for patterns of text in a structured, somewhat concise manner.
---
_Warning!  You may need to refresh your csc151 library to use the procedures mentioned in this reading.  You also need to add `(require csc151/rex)` to your requires at the top of the program._

## Introduction

As we've started to discover, Racket provides a variety of tools for working with strings and lists of strings.
We can extract substrings, split strings, count strings, and more.

We've encountered one significant obstacle: sometimes instead of a particular string, we want to work with *patterns* of characters potentially contained within a string.
For example:

+ We want to determine whether a string contains a book title, which is written using title case (the first letter of each word is capitalized).
+ We want to find all occurrences of two question marks (i.e., "??") embedded within a string literal (*i.e.*, in a block of text surrounded by quotes) and replace them with a string of our choice.
+ We want to break up a string that represents a date into chunks, noting that sometimes people use "-", "/", or even "." as the delimiter between day, month, and year.
+ We know some letters in a word and their positions and want to find the word.

As you might expect, needing to express patterns in strings is a fairly common task in computing and the digital humanities.
Some years ago, the Mathematician Stephen Kleene invented a notation, which he called "Regular Expressions".
(Fun fact: Kleene is the great-grand-advisor of Professor Rebelsky in CS.)
Most modern programming languages now provide some version of regular expressions.
Regular expressions are one of the central tools in the digital humanist's toolkit.

Unfortunately, the standard notation for regular expressions is obtuse, to put it politely.
To help you adjust to the standard notation, the csc151 library includes a more Scheme-like notation, which we will use for our initial forays into regular expressions.
We may then explore the standard notation later in the semester.

We can use regular expressions in Racket in a wide variety of ways, including determining whether a string follows a particular pattern, splitting strings, identifying parts of a string, and replacing parts of a string.
In this reading, we cover the basics of regular expressions and their associated library support in the csc151 library.
You can tell we are using the csc151 regular expressions when you see procedures whose name starts with "`rex`" (short for **r**egular **ex**pression).

## Regular expression basics

Regular expressions constitute a *domain-specific language* (DSL).
In contrast to a *general-purpose* programming language like Racket, a DSL is a smaller language built for a particular task.
Here, the task is specifying patterns of characters that appear in strings.

Because of this, it is natural to express such patterns using strings themselves.
We create a regular expression that matches the string `str` with `(rex-string str)`.
For example, the following string expresses the pattern of characters `#\h`, `#\e`, `#\l`, `#\l`, `#\o` in sequence:

~~~racket
(rex-string "hello")
~~~

If we wish to express the pattern of seeing this series of characters in sequence, we can just replicate the string:

~~~racket
(rex-string "hellohello")
~~~

What if we want to capture the pattern of *one or more repetitions* of the word `"hello"`?
We clearly can't specify that with just our literal string syntax!
Regular expressions enrich strings by introducing syntax and semantics for expressing these patterns.
For example, the following regular expression captures the pattern of one or more repetitions of `"hello"`.

~~~racket
(rex-repeat (rex-string "hello"))
~~~

How do we use these regular expressions?
The simplest way to use them is to check whether a string matches a regular expression using `(rex-matches? rex str)`.

```racket
> (define hellos
    (rex-repeat (rex-string "hello")))
> (rex-matches? hellos "hello")
#t
> (rex-matches? hellos "hellohello")
#t
> (rex-matches? hellos "hellohellohello")
#t
> (rex-matches? hellos "hellohello hello")
#f
> (rex-matches? hellos "")
#f
```

The more common way to use regular expressions is to search in a text for all of the strings that match a regular expression.

```racket
> (rex-find-matches hellos "hellohello")
'("hellohello")
> (rex-find-matches hellos "hellohello")
'("hellohello")
> (rex-find-matches hellos "You say goodbye, I say hello.  hellohello.  Oh, no.  You say goodbye, I say hello.")
'("hello" "hellohello" "hello")
```

Sometimes, we want slightly different kinds of pattern repetition.
If we want to match zero or more copies of `"hello"`, rather than one or more, we can use `rex-repeat-0`.

```racket
> (define hellos0
    (rex-repeat-0 (rex-string "hello")))
> (rex->string hellos0)
"(hello)*"
> (rex-matches? hellos0 "hello")
#t
> (rex-matches? hellos0 "")
#t
> (rex-matches? hellos0 "hellohellohello")
#t
> (rex-matches? hellos0 "hellohellohelloo")
#f
> (rex-find-matches hellos0 "hello goodbye")
'("hello" "" "" "" "" "" "" "" "" "")
```

Why would we care about "zero or more repetitions" of a pattern?
It depends on what we're looking for.
One common instance is permitting zero or more leading zeros in an integer.
Here's another example.

What if we only want to repeat only some of the characters in the string?
For example, what if we want to match `"hello"` or `"helloo"` or `"hellooo"` or even `"hellooooooooooooo`?
We build such patterns by *concatenating* (joining together in sequence) two regular expressions.

As we've started to learn, we solve problems like this by *decomposing* the problem.
To achieve the goal we just described, we need to match the string `hello` followed by zero or more `o`'s.

`(rex-string "hello")` matches the initial `hello`.

`(rex-repeat-0 (rex-string "o"))` matches zero or more copies of `o`.

So `(rex-concat (rex-string "hello") (rex-repeat-0 (rex-string "o")))` matches `hello` with an arbitrary number of additional `o`'s.

```racket
> (define hello-echo 
    (rex-concat (rex-string "hello") 
                (rex-repeat-0 (rex-string "o"))))
> (rex-matches? hello-echo "hello")
#t
> (rex-matches? hello-echo "helloooooooooooo")
#t
> (rex-matches? hello-echo "hellooo")
#t
> (rex-matches? hello-echo "goodbye")
#f
```

One important characteristic of regular expressions is that we gain power by combining them in different ways using operations like `rex-concat` and `rex-repeat`.
Let's consider a slightly more complicated situation:
We want to see if a string consists only of those echoing hellos (or hellooos or ...).

Let's decompose the problem.

We want to start with one echoing hello.
We want to follow it with zero or more echoing hellos, each of which is preceded by a space.

We know how to match one echoing hello.  We can use the `hello-echo` expression.

A space is the pattern `(rex-string " ")`.

A space and an echoing hello is therefore `(rex-concat (rex-string " ") hello-echo)`.

We can repeat that with `rex-repeat-0`.

Putting it all together, we get the following.

```racket
> (define remaining-hellos
    (rex-repeat-0 (rex-concat (rex-string " ") hello-echo)))
> (define echoing-hellos
    (rex-concat hello-echo remaining-hellos))
> (rex-matches? echoing-hellos "hello")
#t
> (rex-matches? echoing-hellos "helloooo")
#t
> (rex-matches? echoing-hellos "hello hello hello")
#t
> (rex-matches? echoing-hellos "hellooo hello hello")
#t
> (rex-matches? echoing-hellos "hellohello") ; no space
#f
> (rex-matches? echoing-hellos "hello he")   ; incomplete second hello
#f
```

What have we seen so far?
We've seen one basic kind of regular expression: Strings match themselves.
We've seen two ways to extend regular expressions: We can repeat them and we can concatenate them.
We've seen two ways to use regular expressions: We can check if a string matches a regular expression and we can find all of the matches in a longer string.
Perhaps most importantly, we've learned that by combining repetition and concatenation, we can create some fairly sophisticated patterns.

After a short detour, it's time to expand our knowledge of basic regular expressions, ways to combine regular expressions, and ways to use regular expressions.

## Regular expressions as instructions

You may find yourself a bit puzzled by a regular expression like the following,

```
(define hello-echo 
  (rex-concat (rex-string "hello") 
              (rex-repeat-0 (rex-string "o"))))
```

We're saying that `hello-echo` is the combination of the string `"hello"` and zero or more `"o"`s.
Where are the instructions for how the computer figures that out?
And what if we had something a bit more complicated, like the following?

```
(define hello-oh
  (rex-concat (rex-string "hello")
              (rex-repeat-0 (rext-string "o"))
              (rex-string "oh")))
```

That pattern is supposed to represent `"hello"`, zero or more `"o"`s, and then another "oh".
How do we tell when we see an `"o"` whether it's part of the repetition or of the final `"oh"`?

Here's the strange thing about regular expressions: They describe only *what* we want, not *how* the computer is supposed to match them.
If you stay on in CS long enough, you will learn how to translate a regular expression into a program that matches regular expressions.
For now, your goal is to use regular expressions to describe the *form* of the strings you want to match.

## More basic regular expressions

While `rex-string` seems to be about as simple as you can make a regular expression, there are a few basic regular expressions that are nearly as simple.

`(rex-any-char)` matches any single character.

```racket
> (rex-matches? (rex-any-char) "a")
#t
> (rex-matches? (rex-any-char) "+")
#t
> (rex-matches? (rex-any-char) "a+")
#f
```

We often use `rex-any-char` along with `rex-repeat` to represent "anything".
For example,

```racket
> (define sr (rex-concat (rex-string "s")
                         (rex-repeat-0 (rex-any-char))
                         (rex-string "r")))
> (rex-matches? sr "super")
#t
> (rex-matches? sr "stranger")
#t
> (rex-matches? sr "sr")
#t
> (rex-matches? sr "samr")
#t
> (rex-matches? sr "computer")
#f
> (rex-matches? sr "science")
#f
> (rex-matches? sr "science computer")
#t
```

Unfortunately, that doesn't work great when we want to find words of that pattern.

```
> (rex-find-matches sr "samr is super strange")
'("samr is super str")
```

What went wrong?
In general, regular expressions match the longest possible sequence.

Hence, we sometimes want to match one of a few characters, rather than any character.
There are three additional basic patterns to match individual characters.

* `(rex-char-set str)` is a regular expression that matches any *one* character in `str`.
* `(rex-char-antiset str)` is a regular expression that matches any *one* character that does not appear in `str`.
* `(rex-char-range start finish)` is a regular expression that appears anywhere between the characters `start` and `finish` (e.g., `#\a` and `\#z` for lowercase letters or `#\0` and `#\9` for digits).

For example,

```drracket
> (define lowercase (rex-char-range #\a #\z))
> (define vowel (rex-char-set "aeiou"))
> (define non-vowel (rex-char-antiset "aeiou"))
> (rex-matches? lowercase "c")
#t
> (rex-matches? lowercase "C")
#f
> (rex-matches? lowercase "cc")
#f
> (rex-matches? vowel "c")
#f
> (rex-matches? vowel "e")
#t
> (rex-matches? non-vowel "f")
#t
> (rex-matches? non-vowel "e")
#f
> (rex-find-matches (rex-concat (rex-string "s") 
                                (rex-repeat-0 (rex-char-range #\a #\z))
                                (rex-string "r"))
                    "samr is super strange.  He's stranger than a supercomputer.")
'("samr" "super" "str" "stranger" "supercomputer")
```

We might use these to determine if a word contains two vowels in a row.
Once again, we'll decompose the problem.
We'll need a possibly-empty sequence of letters, then a vowel, then a vowel, then a possibly-empty sequence of letters.

```drracket
> (define double-vowel
    (rex-concat (rex-repeat-0 lowercase) vowel vowel (rex-repeat-0 lowercase)))
> (rex-matches? double-vowel-word "hello")
#f
> (rex-matches? double-vowel-word "helloo")
#t
> (rex-matches? double-vowel-word "field")
#t
> (rex-matches? double-vowel-word "aardvark")
#t
```

There's one more basic regular expression: `(rex-empty)` matches only the empty string.

```drracket
> (rex-matches? (rex-empty) "")
#t
> (rex-matches? (rex-empty) "hello")
#f
```

Why would you want a regular expression that matches only the empty string?
It turns out that the empty string is useful in conjunction with some other ways of combining regular expressions.

## Combining regular expressions

Speaking of combining regular expressions, you should know three basic ways of combining or extending regular expressions:
You can concatenate two or more regular expressions with `(rex-concat rex1 rex2 ...)` and you can repeat a regular expression with `(rex-repeat rex)` or `(rex-repeat-0 rex)`.

It turns out that there's only other important way to extend regular expressions.
`(rex-any-of rex1 rex2 ...)` takes two or more regular expressions as parameters and returns a regular expression that matches any of them.

```drracket
> (define greeting (rex-any-of (rex-string "hello")
                               (rex-string "hi")
                               (rex-string "hola")))
> (rex-matches? greeting "HI")
#f
> (rex-matches? greeting "hello")
#t
```

## Using regular expressions

So far, we've seen only one way of using regular expressions:
We can determine whether a string matches a regular expression (or vice versa).
What else might we do with regular expressions?

One of the most common uses of regular expressions is to search a longer string for portions that match a regular expression.
The procedure `(rex-find-matches rex str)` accomplishes that goal.
For example, we might write the following to find all of the strings with two vowels in a row.

```drracket
> (define lowercase (rex-char-range #\a #\z))
> (define vowel (rex-char-set "aeiou"))
> (define double-vowel-word
    (rex-concat (rex-repeat-0 lowercase) vowel vowel (rex-repeat-0 lowercase)))
> (rex-find-matches double-vowel-word "now is the time for all good people to come to the aid of their country")
'("good" "people" "aid" "their" "country")
```

When dealing with longer strings, we might split into substrings based on a regular expression.  For example, we might want to split at commas and semicolons, with a space and an optional `"and "` afterwards.
Let's decompose that pattern.

A comma or semicolon is a set (or an "any"): `(rex-char-set ",;")`.

A space is just a space: `(rex-string " ")`.

`"and "` is a string: `(rex-string "and ")`

We make it optional by matching it or the empty string: `(rex-any-of (rex-string "and ") (rex-empty))`.

Putting it all together, we get the following.

```drracket
> (define splitter
    (rex-concat (rex-char-set ",;")
                (rex-string " ")
                (rex-any-of (rex-string "and ") (rex-empty))))
> (rex-split-string splitter "me, you, and a dog named boo")
'("me" "you" "a dog named boo")
> (rex-split-string splitter "alpha, beta; gamma")
'("alpha" "beta" "gamma")
```

With more practice, you'll find many clever ways to use regular expressions.

## Limiting yourself to the start or end of the string

It's sometimes useful to limit regular expressions to the "edges" of a string.
`(rex-start-of-string)` matches the start of a string.
`(rex-end-of-string)` matches the end of a string.

```
> (define sr
    (rex-concat (rex-string "s") 
                (rex-repeat-0 (rex-char-range #\a #\z))
                (rex-string "r")))
> (rex-find-matches sr
                    "samr is super strange.  He's stranger than a supercomputer")
'("samr" "super" "str" "stranger" "supercomputer")
> (rex-find-matches (rex-concat (rex-start-of-string) sr)
                    "samr is super strange.  He's stranger than a supercomputer")
'("samr")
> (rex-find-matches (rex-concat sr (rex-end-of-string))
                    "samr is super strange.  He's stranger than a supercomputer")
'("supercomputer")
```

## Displaying regular expressions

How do we store regular expressions?
It turns out that the human-readable representation of the csc151 rex-style regular expressions looks remarkably like the expressions we would write to create them, just without formatting.

```drracket
> vowel
(rex-char-set "aeiou")
> double-vowel-word
(rex-concat  (rex-repeat-0 (rex-char-range #\a #\z)) (rex-char-set "aeiou") (rex-char-set "aeiou") (rex-repeat-0 (rex-char-range #\a #\z)))
> splitter
(rex-concat  (rex-char-set ",;") (rex-string " ") (rex-any-of (rex-string "and ") (rex-empty)))
```

As we noted at the beginning, there's a more standard syntax for regular expressions.
You can start to explore that syntax using `rex->regexp`.

```drracket
> (rex->regexp vowel)
#px"[aeiou]"
> (rex->regexp double-vowel-word)
#px"[a-z]*[aeiou][aeiou][a-z]*"
> (rex->regexp splitter)
#px"[,;] (and |)"
> (rex->regexp (rex-string "+"))
#px"\\+"
```

As you may have noted, this syntax is much more concise.
It is, however, harder for most humans to read and write, at least at first.
We may return to this notation later in the semester, once we've mastered some other issues.

## Self checks

### Check 1: Alternate spellings (‡)

People with the name "Jared" often encounter various "alternate
spellings" of their name, including "Jered", "Jerod", and "Jarod".
Write two regular expressions we could use to match any of those
four spellings.

### Check 2: Counting gendered words

One common analysis of a text is the ratio of male pronouns to
female pronouns in a text.

Suppose we want to identify the number of times that the words "she"
and "her" appear in a string and we do not want to count the number
of times they appear in other words (e.g., "sheet" and "there").

How could you use regular expressions to count those appearances?

## Questions and Answers

What does `concat` stand for?

> It's short for "concatenate", meaning "join together".

