---
title: Mini-Project 7
subtitle: Transforming Web Pages
summary: |
  In this assignment, you will develop a variety of programs
  that manipulate Web pages.
collaboration: |
  Each student should submit their own set of solutions to this project.
  You may certainly consult others in developing the project, although
  you should cite or acknowledge them if you have done so.
link: false
---

## Part One: Adding document information

In an earlier assignment, you explored the computation of a Dale-Chall score that measures the complexity of a document.
The Dale-Chall score requires a count of words in the document, a count of easy words, a count of difficult words, and a number of sentences.
The Dale-Chall score also provides an expected grade level.

**Write a procedure, `(add-dc-info infile outfile)`, that takes two file names as parameters, reads an HTML file from the `infile`, adds some preliminary information to the start of the body, and writes the result to `outfile`.**

The preliminary information should look something like the following:

> Number of words: **###** (**###** easy, **###** difficult)

> Number of sentences: **###**

> Given a score of **###**, this document is appropriate for a **LEVEL** audience.

You will likely want to

* Read the file into an SXML structure.
* Extract the text from the SXML structure and join it into a single string.
* Run the code you wrote from an earlier assignment.  (Make sure to cite yourself when you add it to this document.)
* Generate the introdcutory information as an SXML structure.
* Join them together.
* Write to a file.

## Part Two: Adding a table of contents

As you may recall, a well-designed Web pages uses *section headings* of the form `h1`, `h2`, `h3`, and so on and so forth.  
In your experience with print culture, you likely learned that printed documents often have something called a "table of contents", a list of the chapters, sections, and subsections, along with their page numbers.
On the Web, we often prefer "active" tables of contents.
That is, each entry in the table of contents has a link to the appropriate section of the document.

**Write a procedure, `(add-toc infile outfile)`, that takes two file names as parameters, reads an HTML file from the `infile`, adds a table of contents at the start of the body, and writes the result to `outfile`.**

For example, if our document has the following form,

```
<h1>My awesome document</h1>
...
<h2>Defining awesomeness</h2>
<p>Of course, if we call something <q>awesome</q>, we should
identify what we mean by that word.</p>
...
<h3>What is awe?</h3>
...
<h3>Summing Values</h3>
...
<h2>On the role of Racket in awesomeness</h2>
...
<h2 id="conclusion">Conclusion</h2>
...
```

Our revised document will have a form something like the following.

```
<div class="toc">
<ul>
  <li><a href="#element425431">My awesome document</a></li>
  <ul>
    <li><a href="#element247523">Defining awesmeness</a></li>
    <ul>
      <li><a href="#element608455">What is awe?</a></li>
      <li><a href="#element529052">Summing Values</a></l>
    </ul>
    <li><a href="#element912653">On the role of Racket in awesomeness</a></li>
    <li><a href="#conclusion">Conclusion</a>
  </ul>
</ul>
</div>
<h1 id="element425431">My awesome document</h1>
...
<h2 id="element247523">Defining awesomeness</h2>
...
<h3 id="element608455">What is awe?</h3>
...
<h3 id="element529052">Summing Values</h3>
...
<h2 id="element921653">On the role of Racket in awesomeness</h2>
...
<h2 id="conclusion">Conclusion</h2>
...
```

In case it's not clear from the example, you'll likely have to do
the following steps.

* Read from the file into an SXML structure.
* Add an id attribute to any `h1`, `h2`, or `h3` element that lacks an id.
  We would suggest adding a random id, created with the word "element"
  and a random six-digit number.
* Gather all the `h1`, `h2`, and `h3` elements and turn them into a
  list with links.
* Combine those two things.
* Write to a file.

## Part Three: Assessing Accessibility

As you should know, Web page authors have a responsibility to make their pages accessibile to those with physical diferences.
Everyone has a moral responsibility to consider others; some organizations, such as educational institutions, also have a legal responsibility.
The most basic issues to consider relate to making pages more accessible to the blind, those with limited vision, or those who rely on screen readers for a variety of reasons.

What kinds of things should a page author attend to?
Here are three basic ones.

* Every image (given by `img`) should have a nontrivial set of "alt text" (given by the `alt` attribute).
* Any link (given by an `<a href="...">` tag) should have "meaningful" text.  At minimum, meaninful should mean, "more than one word" but not "click here".
* Any two links must have intervening text (not just a space) so that one can tell the difference.

Write a procedure, `(assess-accessibility url)` that reads a page from the given URL and creates an SXML structure that reports on any accessibility flaws in the page (of the forms given above).

You may use `(fetch-page url)` to grab a page from the Web.

## Part Four: Linguistic Differences

_This problem is intended as satire.  It is not intended to favor any particular political perspective or party._

As you likely know, there are a host of linguistic differences across the US.
For example, most of the US calls a "frappe" a "milkshake"; a certain kind of standwich might be called a "sub", a "grinder", or a "poorboy"; and carbonated non-alcoholic beverages are called "soft drinks", "soda", "pop", or even "Coke".

The residents of Middle Slobovia have some particularly strange differences. For example,

* Instead of "President", they say "Supreme Ruler".
* Instead of "Biden", they say "Bye Done".
* Instead of "vaccine", they say "tracing serum".
* Instead of "virus", they say "myth".
* Instead of "progressive", they say "anti-American".
* Instead of "liberal", they say "Marxist".
* Instead of "Republican", they say "Authoritarian".
* Instead of "Democrat", they say "Traitor".
* Inssted of "scientist", they say "liar".
* Instead of "science", they say "lies".
* Instead of "college", they say "cult".
* Instead of "professor", they say "indoctrinator".
* Instead of "student", they say "cultist".
* Instead of "midwest", they say "heartland".

**Write a procedure, `(slobovicize sxml)`, that takes as input an SXML structure and returns the structure in the Middle Slobovian dialect.**

For example, consider the following structure.

```
(define press-release
  '(div (@ (class "release"))
        (ul
          (li "Dateline " (span (@ (class "date")) "2021-11-01"))
          (li "Location " (span (@ (class "college") "Grinnell"))))
        (p "This week, President Anne Harris of "
           (span (@class "college") "Grinnell College")
           ", a midwest liberal-arts college known for its progressive values,"
           " announced today that all students must receive the vaccine"
           " for the corona virus.")
        (p "Professor and noted scientist Lindsey Smith, commenting"
           " on President Harris' announcement said, "
           (q "We want to keep our students alive to vote for"
              " Democrats in the next election."))
        (p "In response to President Harris' announcement, the Republican"
           " Iowa Legislature voted to require "
           (span (@ (class "medicine")) "horse parasite tablets")
           " of all students at state schools, at the urging of"
           " Senator Iam Old, who cited the clear science for"
           " such medicine.")))
```
After slobavicize-ing that text, we would end up with something like the following.

```
'(div (@ (class "release"))
      (ul
        (li "Dateline " (span (@ (class "date")) "2021-11-01"))
        (li "Location " (span (@ (class "college") "Grinnell"))))
      (p "This week, Supreme Leader Anne Harris of "
         (span (@class "college") "Grinnell Cult")
         ", a heartland Marxist-arts cult known for its Anti-American values,"
         " announced today that all students must receive the tracing serum"
         " for the corona myth.")
      (p "Indoctrinator and noted liar Lindsey Smith, commenting"
         " on Supreme Leader Harris' announcement said, "
         (q "We want to keep our cultists alive to vote for"
            " Traitors in the next election."))
      (p "In response to Supreme Leader Harris' announcement, the Authoritarian"
         " Iowa Legislature voted to require "
         (span (@ (class "medicine")) "horse parasite tablets")
         " of all cultists at state schools, at the urging of"
         " Senator Iam Old, who cited the clear lies for"
         " such medicine."))
```

Note: If you like to explore real linguistic differences, _The New York Times_ has [a fun intertactive quiz](https://archive.nytimes.com/www.nytimes.com/interactive/2013/12/20/sunday-review/dialect-quiz-map.html) about the issue.

## Part Five: Roll Your Own

Choose one other thing to do to/with existing Web pages.
You might explore a more significant version of one of the exercises above.
You might do something more like the Mad Libs exercise you did in a recent mini-project.
You might do something a bit more useful.
Check with your instructor or class mentors if you'd like some ideas.

## What to turn in

Please name your file `web.rkt` and turn it and any other files you used in on Gradescope.

## Rubric

### Necessary for R

```
[ ] Code file has appropriate headers.
[ ] Code file runs.
[ ] Part one: `add-dc-info` reads the input file, adds something, and writes to the output file.
[ ] Part two: `add-toc` reads the input file, adds something, and writes to the output file.
[ ] Part three: `fetch-page` generates SXML.
[ ] Part four: `slobovicize` works with strings.
[ ] Part five: Includes something.
```

### Necessary for M

```
[ ] All primary procedures documented.
[ ] Part one: `add-dc-info` reads the input file, adds the correct text in most cases, and writes to the output file.
[ ] Part two: `add-toc` reads the input file, adds something based on each header, and writes to the output file.
[ ] Part three: `fetch-page` generates SXML that reports counts of issues; numbers need not be exactly correct.
[ ] Part four: `slobovicize` works with SXML structures.
[ ] Part four: Examples of `slobovicize` provided.
```

### Necessary for E

```
[ ] All procedures documented, including helpers.
[ ] Part two: `add-toc` adds id attributes to any header that lacks them.
[ ] Part two: `add-toc` adds internal links to the headers.
[ ] Part three: `fetch-page` generates SXML that reports both counts of issues and individual issues; numbers are correct.
[ ] Part four: `slobovicize` deals appropriately with subwords (e.g., it should not change professorial to indoctrinatorial, but it should change professors to indoctrinators).
[ ] Part five: Uses recursion.
```
