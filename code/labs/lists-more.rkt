#lang racket

;; CSC-151 (SEMESTER)
;; Lab: More Fun with Lists
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

; +-----------------------+------------------------------------------
; | Requirements and such |
; +-----------------------+

(provide (all-defined-out))
(require csc151)
(require 2htdp/image)
(require rackunit)

; +-------------+----------------------------------------------------
; | Preparation |
; +-------------+

#|
In this lab, you and your partner will practice manipulating lists
using the big-three higher-order functions: map, filter, and reduce.
There are five exercises; here's the division.

Exercise 1: A-Side
Exercise 2: B-Side
Exercise 3: A-Side
Exercise 4: B-Side
Extra 1: Both; Not to be turned in.

The person with the problem description should drive and their
partner should navigate.  Again, make sure to be good partners and
focus completely on solving the current problem together rather than
working ahead on your own.

Also: Don't forget our new "start of session".  Chat with your partner
about working habits and strengths.  Maybe share something interesting
about yourself

And don't forget to save this as `lists-more.rkt`!
|#

#| A |#

; +---------------------------------+--------------------------------
; | Exercise 1: Manipulating a list |
; +---------------------------------+

#|
Complete each of the definitions that manipulate ex-1-list in various sorts
of ways using one or more of the big three functions.  You may also use the
other standard library functions for lists (e.g., length) when appropriate.
|#

(define ex-1-list (list 25 25 23 5 21 20 20 18 10 1 22 21))

; Increments the value of each element of the list `ex-1-list` by 5
(define ex-1-list-adjusted "<TODO: fill me in>")
; (test-equal? "Adjusting the list"
;              ex-1-list-adjusted
;              '(30 30 28 10 26 25 25 23 15 6 27 26))

; Keeps only the elements of the list that are greater than 10.
(define ex-1-list-filtered "<TODO: fill me in>")
; (test-equal? "Filtering the list"
;              ex-1-list-filtered
;              '(25 25 23 21 20 20 18 22 21))

; Computes the average of the list (Hint: this computation is more
; than just a single reduce call!)
(define ex-1-list-average "<TODO: fill me in>")
; (test-equal? "Averaging the list" ex-1-list-average 211/12)

#| B |#

; +----------------------------------+-------------------------------
; | Exercise 2: Higher-order corners |
; +----------------------------------+

#|
Suppose we want to add 5 to every element of a list.  Some of you
may have tried the following.

> (define numbers (list 3 1 4 1 5 9 2 6))
> (define numbers-plus-5a (map + numbers 5))

a. Why doesn't that work?

<TODO: FILL ME IN>
|#


#|
b. As we hope you've learned, you can use `section` to help
with this problem.  Write an expression  using `section` that
adds five to each element of `numbers`.
|#

(define numbers (list 3 1 4 1 5 9 2 6))
(define numbers-plus-five-b "<TODO: FILL ME IN, NOT AS A STRING>")

#|
c. Suppose you had not learned `section`.  There are still at least
two other ways to to add five to each element of a list.  Come up 
with two, at least one of which uses the three-parameter `map`.
|#

(define numbers-plus-five-c1 
  "<TODO: FILL ME IN, NOT AS A STRING>")

(define numbers-plus-five-c2 
  "<TODO: FILL ME IN, NOT AS A STRING>")

#|
d. Which of those definitions do you most prefer?  Why?

<TODO: FILL IN AN ANSWER HERE>
|#

#| A |#

; +------------------------------------+-----------------------------
; | Exercise 3: Party people revisited |
; +------------------------------------+

#|
One of the things that `map` allows us to do is perform repetitive
behavior.  We'll demonstrate this by generalizing one of the images
we created in our first lab on decomposition and then using our list
functions to generate repeated instances of that images.
|#

#|
a. Recall in the first exercise of our decomposition lab
you created an image that consisted of five people with party hats.
Using this code as a base, write a function `(party-person scale)`
that draws a single person, *i.e.*, a person with a party hat but
scales the person's width and height by a factor of `scale`.  For example:

+   If `scale` is `1`, then the image is drawn at its original dimensions.
+   If `scale` is `0.5`, then the image is drawn at half size.
+   If `scale` is `2`, then the image is drawn at 2x size.
|#

(define original-party-person
  (above (triangle 20 'solid 'green)
         (circle 20 'outline 'black)
         (rectangle 10 40 'solid 'black)))

(define party-person
  (lambda (scale)
    ???))

#|
b. Using `party-person` define a *list of images* called `party-list`
that consists of six party people scaled by the following factors.

    3/2, 1, 1/4, 2, 7/4, 1/2

Hint: start with a list of these scaling factors as a list of fractions.
What functions can we use in combination to transform this list of factors 
into a list of images?
|#

(define party-list "TODO: fill me in!")

#|
c. You might notice that the type of `party-list` isn't quite an
image. To see this, attempt to rotate `party-list` using the `rotate`
function. In the space below, report the error you receive and in a
sentence or two explain what the problem is!

    > (rotate 90 party-list)

<TODO: give your error and description of the error here!>

|#

#|
d. To fix the problem, we need to combine the images of `party-list`
into a single image.  To do this, we should use `beside` to place each
person beside each other.  However, try calling `beside` on
`party-list`.  This should result in yet another error!  In the space
below, report the error and in a sentence or two explain the problem!

   > (beside party-list)

<TODO: give your error and description of the error here!>

|#

#|
e. As you might expect, it turns out that the fix is to use the
`apply` function which takes a function `f` and a list of values
as input and returns the result of applying `f` to the values of
the list.  Use `apply` to complete the definition of `party` below
and verify that it produces what you expect.  

Please use `beside` and not `beside/align`.
|#

(define party "TODO: FILL ME IN!")

#|
f. It's also possible to do this with `reduce` rather than `apply`.
(At least it should be.)  Try doing so.  Once again, please use
`beside` rather than `beside-align`.
|#

(define party-f "TODO: FILL ME IN!")

#|
g. Try using `reduce` with `beside/align` rather than `beside`.
Remember: `reduce` needs a two-parameter procedure.
|#

(define party-g "TODO: FILL ME IN!")

#| B |#

; +------------------------------------+-----------------------------
; | Exercise 4: Exercises in reduction |
; +------------------------------------+

#| 
If you do not get to this part of the lab in class, don't worry.
You need not do it together.  Each partner should do it on their
own and not submit it, but be ready to discuss it.
|#

#|
a. What does the following procedure do?

<TODO: INSERT YOUR ANSWER HERE>
|#

(define combine
  (lambda (s1 s2)
    (string-append s1 " and " s2 " and " s1)))

#|
b. What value do you expect to get for the following expressions?
Check each as you go.

<TODO: INSERT YOUR ANSWERS HERE>
|#

(define combine-2 (reduce combine (list "A" "B")))

(define combine-1 (reduce combine (list "A")))

(define combine-3-left (reduce-left combine (list "A" "B" "C")))

(define combine-3-right (reduce-right combine (list "A" "B" "C")))

(define left-and-right (equal? combine-3-left combine-3-right))

#|
c. What values do you expect for all-the-same below?  Why?
Don't check yet!  Wait until you get to part d.

<TODO: INSERT YOUR ANSWERS HERE>
|#

(define combine-abcde-1 (reduce combine (list "A" "B" "C" "D" "E")))

(define combine-abcde-2 (reduce combine (list "A" "B" "C" "D" "E")))

(define combine-abcde-3 (reduce combine (list "A" "B" "C" "D" "E")))

(define all-the-same 
   (and (equal? combine-abcde-1 combine-abcde-2)
        (equal? combine-abcde-1 combine-abcde-3)
        (equal? combine-abcde-2 combine-abcde-3)))

#|
d. Check your answer experimentally.  That is, print out the value
of `all-the-same` and see if it's what you expected.
|#

#|
e. What do you take as the main lessons of this exercise?

<TODO: INSERT YOUR ANSWER HERE>
|#

#| AB |#

; +----------------------+-------------------------------------------
; | Submitting your work |
; +----------------------+

#|
Congratulations on finishing this lab!  To turn in your work:

a.  If you're working online, combine the two parts into a single file.
b.  Ensure that your file runs properly.
c.  Make sure you save as `lists-more.rkt` using 
    File -> Save Other -> Save Definitions As Text...
d.  Send this completed file to your partner for their records.
e.  Submit this final file to Gradescope.  Make sure, if appropriate,
    to submit your work as a group submission and include your
    partner in the submission.
|#

; +---------------------------------------------------+--------------
; | Extra 1: A short introduction to textual analysis |
; +---------------------------------------------------+

#| 
You do not need to turn in this exercise, and you probably won't
complete it during class.  However, you should do the exercise
on your own (or with another person) to make sure that you
understand the parts.
|#

#|
Now, that we've gotten our feet wet with lists and the big three,
let's see what we can do!  We'll use our knowledge of list processing
to perform some basic analysis of texts.  This sort of analysis is
the "bread and butter" of the digital humanities, and we will be
exploring in more detail in the coming weeks.
|#

#|
a. First off, we need to find a text to analyze.  A rich repository
of freely available texts can be found on Project Gutenberg:

https://gutenberg.org/

From Project Gutenberg, we'll do some basic analysis of The Wonderful
Wizard of Oz by L. Frank Baum.  Download a copy of the book as a
plaintext file from this URL:

https://www.gutenberg.org/cache/epub/43936/pg43936.txt

Make sure to put the file in the same directory that you saved this
file in.  We'll talk more about file processing in a future class, but
for now, we'll provide you with the code to read this text file into
a list of words.

Once you have downloaded the book and placed it in the proper
directory, uncomment the line below and verify in the interactions
pane with `length` that the file contains around 44000 words.
(probably a few less)
|#

; (define wizard-words (file->words "pg43936.txt"))

#|
b. Hopefully you noticed that `wizard-words` is a _large_ list!  If
you happen to accidentally type `wizard-words` in the interactions
pane, DrRacket will happily try to print all of the list's contents.
If this happens, click the "Stop/Kill" button in the top right corner
a few times to stop execution of the program.

To get an example of what the list contains, we can use the
`(take l n)` function from the standard library which returns the
first `n` elements of list `l`.  In the space below, report what the
first 20 words of the text file are.

<TODO: report your findings here>

|#

#|
c. Whoops! You should have found that the first 20 words don't look
like the start of the Wizard of Oz.  Go ahead and open up
`pg43936.txt` in DrRacket.  Even though the file is not a Racket
source file, DrRacket is happy to open it up since it is plain text.

Many data sources we'll look at will contain a *preamble* of
information before we get to the good stuff.  It is easiest to
*cleanse* our data file manually so that this preamble does't get in
the way of our analysis.  Delete the start of the text up until the
title:

                             The WONDERFUL
                                 WIZARD
                                   OF
                                   OZ

Save the file, reload your source file (so that we update
`wizard-words` with your changes), and rerun your `take` expression
and verify that the first 20 words of the book are:

'("The" "WONDERFUL" "WIZARD" "OF" "OZ" "BY" "L" "Frank" "Baum" "W"
  "W" "Denslow" "Illustration" "Geo" "M" "Hill" "Co" "New" "York"
  "INTRODUCTION")

|#

#|
d. Write an expression to grab the next 20 words of the book.
|#

(define second-twenty-words "<FILL IN THE DETAILS>")

#|
e. Now let's analyze the book!  _The Wizard of Oz_ features five main
characters:

+   Dorothy
+   Toto
+   Scarecrow
+   Tin Woodman
+   Cowardly Lion

While Dorothy is clearly the main character, who are the most
important among the other characters?  One way to view this question
computationally or in a data-driven fashion is to count the number of
occurrences of each character in the text.

Complete the definitions below to count the number of occurrences of
each character in The Wizard of Oz.  In the space below, report the
counts and who you believe is the most important character besides
Dorothy, computationally speaking!

(Hint 1: I recommend perusing the book before you write your code to
see how each character is referenced.)

(Hint 2: One way to perform this computation is to rely on filter to
get rid of all the text other than relevant occurrences of a
character's name!)

(Hint 3: If you have trouble finding any results with some characters,
keep in mind that the list you have is a *list of words* which might
require you to compromise a bit in what you search for in the text.)

Counts
+ Dorothy:   <TODO: fill me in!>
+ Scarecrow: <TODO: fill me in!>
+ Woodman:   <TODO: fill me in!>
+ Lion:      <TODO: fill me in!>

<TODO: who do you believe is the second most important character?>
|#

(define dorothy-occurrences
  "TODO: fill me in!")

(define toto-occurrences
  "TODO: fill me in!")

(define scarecrow-occurrences
  "TODO: fill me in!")

(define woodman-occurrences
  "TODO: fill me in!")

(define lion-occurrences
  "TODO: fill me in!")

#|
f. If you have extra time, try to come up with your own questions
you can ask of the _The Wizard of Oz_ text and try to answer them
using lists!  Your questions don't have to be complicated, e.g.,
you might ask what the longest word in the book is or whether Dorothy
is ever referenced by her full name.  You might not be able to
answer the question directly in code, but you can certainly generate
new information that can help you answer your question!  
|#
