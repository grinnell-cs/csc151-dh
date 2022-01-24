---
title: An Introduction to the course
summary: |
  We introduce the main themes of the course.
---

# Introduction

Welcome to _A Functional Approach to the Digital Humanities_, which
we will often refer to as _FunDHum_.  FunDHum provides a workshop-style
introduction to computer science grounded in examples from the
digital humanities and employing a functional programming approach
using the Racket programming language.  What does that all mean?
Let’s unpack some key terms.

## Course Syllabus

Before you proceed, please read the course syllabus (linked in the navbar above) for information about course logistics including required technology, course cadence, and evaluation.

## Computer Science

Although you will find that computer scientists don’t always agree on
all the details, most agree that, at the core, computer science is the
study of algorithms and data structures.  That is, computer scientists
think about the instructions and processes one might write to accomplish
a task and about ways to organize information to support those
instructions and processes.  In many ways, computer science is the study
of problem solving in formal domains: We consider how to make explicit
the requirements of a problem, to develop a solution in a formal
language \(most typically a programming language\), and to analyze that
solution for both correctness and efficient use of resources.  Whether
or not you continue your study of computer science beyond this course, I
hope that FunDHum will help you think you think more carefully about
solving problems.

You will develop your skills in algorithmic thinking in a variety of
ways, but most frequently by writing and exploring computer programs in
which you represent the algorithms and data structures that you have
created. Since you will write programs, we will also explore some issues
of software design, including ways to write programs to make them more
readable and maintainable by other humans and the use of both
experimental testing and formal reasoning to help ensure that the
programs you write meet their goals.  Since you are writing in a
language, albeit an artificial language, we will also consider issues of
style and elegance.

To some, "computer programming" is the same as "computer science".
While programming can be part of the work of a computer scientist, it is
often only a small part of that work.  Some computer scientists study
the limits of computing, what is and is not computable.  Many explore
the design of algorithms and data structures for particular domains,
from the details of how to implement algorithms in physical circuitry to
the abstract questions of how to represent intelligence.  Some consider
the implications of computing: Computing allows us to accomplish many
tasks that previously seemed impossible, such as gathering and analyzing
the purchasing or viewing habits of large segments of society; we have a
responsibility to think through the implications of such abilities and,
when possible to find ways to avoid broader harm.

Just in case it wasn’t clear: While you will develop a wide variety of
computer programs in FunDHum, the primary role of our programming
exercises is to help you develop skills at algorithmic thinking.

## Digital Humanities

Although one can develop such skills by exploring algorithms abstractly,
we will find it much more useful to focus on a particular problem
domain. In FunDHum, that problem domain is the relatively new field of
Digital Humanities.  But what are the Digital Humanities?  Perhaps we
should start by considering the Humanities themselves.  From my
perspective, humanists study the works of humanity, including language,
philosophy, religion, and art.  Of course, scientists and social
scientists might also study these areas.  However, humanists and
scientists approach their study differently.  While scientists tend to
employ the scientific or experimental method, humanists often attend
more to the particular details or broader contexts of individual works,
frequently guided by an underlying theory or framework.

What about the digital humanities?  Because the field is evolving, the
community has not agreed upon a consistent definition.  That’s almost
certainly a good thing; definitions can limit possibilities, and fields
need room to grow.  At the same time, some limits are useful.  For
the sake of FunDHum, we will consider the aspects of the digital
humanities that relate to the ways in which algorithmic thinking and
digital tools can contribute to humanistic work, particularly humanistic
work that involves text written in natural language. I use the term
"contribute" carefully; as a computer scientist, I know that computers
cannot replace the careful thought and analysis that undergird
humanistic study.  However, these technologies can reveal new topics and
modes of inquiry and provide new modalities for presenting results.

Let’s consider a few examples.

An early form of digital humanities involved using computers to find
patterns in moderate-sized or large corpora, such as the works of
Shakespeare or a digitized collection of 18th century British novels.
This form of analysis is often termed "distant reading" to contrast it
with the close reading that is core to many forms of humanistic study.
It also suggests the potential benefits of stepping back and looking at
a larger group of works.  While distant reading incorporates a wide
variety of practices, one of the more popular is that of "topic
modeling", the use of computers to find groups of words that tend to
appear together.  Of course, the topics themselves are not intended to
serve as the final "result".  Rather, discovering an unusual grouping of
words may lead the scholar to a set of readings that she can then
explore more closely through traditional techniques.  She may discover
insight from the particular grouping of words.  She may find the
unexpected connections between works lead her in new directions.  She
may conclude that the relationships appear to be specious.

"Place" plays a large role in many works; Humanists increasingly find
that tools that render places on a map can provide a useful mechanism
for both exploring and explaining the role of place.  Mapping place
names in, say, Hamlet, may suggest that although the primary action
takes place in one location or set of locations, other locations play
enough of a role in the play that they influence the action.  Mapping
tools need not be applied only to traditional literary texts.  For
example, Mark Laver at Grinnell College has developed an informative
project involving place names in the songs of Kendrick Lamar.  In many
such situations, the maps may lead the scholar to a closer analysis of
the text or texts. At the same time, the maps themselves can serve as a
kind of product of scholarly inquiry, providing evidence for a broader
argument about the role of place.

Digital maps can also be the primary product of humanistic inquiry.
Consider, for example, America’s troublesome separation of immigrant
children from their parents in the second decade of the 21st century.
While there is power in narratives that explore the experience of a few
individuals or a particular community, some digital humanists have found
it valuable to develop map-based visualizations of where these children
get housed compared to where they arrive.

## Workshop-style learning

We have established that FunDHum introduces computer science through
problems and approaches drawn from the digital humanities.  But how
should one teach and learn these materials?  Computer science has often
been taught in much the same way that the natural sciences are
traditionally taught, through lectures and associated labs.  However,
most students learn computer science better by doing rather than
by listening.  Hence, FunDHum is designed to support a so-called
"workshop-style" approach.  For each class period, students will
read a few pages that provide some background information.  While,
in a few cases, we will rely on articles written by others, most
frequently you will read materials written specifically for this
work.  Class time is then devoted to students working in pairs on
a series of problems.

Why pairs?  Because research suggests that programmers work better in
pairs, in both the classroom and in regular practice.  How much better?
Studies suggest that two people working together are regularly more
productive than two people working separately.  It’s not just that "two
heads are better than one"; we also know that having to describe a
thought process to someone else improves that thought process and helps
find flaws.

More importantly, working in randomly assigned pairs you the
opportunity not only to encounter a wide variety of people but also
to build appreciation for different backgrounds and different skill
sets.  Please make sure to treat your partners with care and respect
as you work together.

If you are reading through FunDHum on your own, I suggest that you do
your best to follow a similar approach.  You won’t learn this material
by just reading, so make sure that you work through the various
problems.  You may even want to design some new problems. If you’re
fortunate enough to have a friend who might be interested in these
topics, try to work as a pair.

## Functional programming in the Racket Programming Language

You will learn methods of algorithmic thinking, in part, by writing
programs that represent your algorithms and data structures in a formal
language, one that computers can understand.  We call such languages
"programming languages".  Although Python, PHP, and R are the most
popular programming languages for the digital humanities, we will use
the Racket programming language.

Why Racket?  There are many reasons.  Racket, like Python, was designed
for both novice and experienced programmers: Racket is simple enough for
a beginner but powerful enough for an expert.  For example, Racket’s
syntax is simpler than that of most other languages, although filled
with parentheses.  Racket comes with an affiliated program development
environment, DrRacket, that is particularly supportive of new
programmers.  DrRacket makes it easy to develop, to experiment, and to
debug.  As importantly, Racket encourages particular approaches to
algorithm and program design; I think that emphasizing those approaches
will make you a better algorithmic thinker and programmer.  Among other
things, Racket supports a model of programming called "functional
programming" which is characterized by an emphasis both on functions as
fundamental values and on writing procedures that do not affect the
state of the system.  Functional approaches are at the heart of many
modern programming languages, and I’ve found it useful to introduce them
early.

## Broad themes

The digital humanities encompass a wide variety of practices and
perspectives, even if we narrow our focus to algorithms that work with
text.  We could not hope to cover all pertinent approaches and
algorithms from the digital humanities in a year, let alone in a single
semester. That’s okay; my goal is not to teach you everything.  Rather,
I hope to expose you to enough algorithmic concepts and ways of thinking
about humanistic "data" that you can learn new things and, as
importantly, design your own algorithms.

In FunDHum, we will emphasize three core aspects of the digital
humanities: data representation, authoring of "algorithmic" texts, and,
most centrally, algorithms for analyzing and manipulating text.

### Data representation

One of the broad problems in the digital humanities is how to represent
data electronically to support a broad variety of algorithms.  Consider,
for example, the markup appropriate for an electronic version of a book.
We certainly want to provide the textual content of the book.  But
an algorithm should also be able to easily access the "parts" of that book,
not just chapters, but also section headings, authors, and so on and so
forth.  Scholars of the book might care about the details of the layout,
including the positions of line and page breaks or the typeface choices
throughout the book.  And, while a book may exist in the abstract, we
may also want to encode the information associated with a particular
printed instance of the book, including the marginalia and the ownership
history, if available.

Although we will not be able to cover the full range of issues that
digital humanists face, we will explore a variety of such issues
and practice developing our own schemas for representing information.
Along the way, we may examine common formats for representing and
annotating textual data, such as "markup languages"  like HTML and
XML, as well as simple file formats for storing additional information.

### Authoring algorithmic texts

Your daily experience with the Web tells you that computers have changed
how people write, from the abbreviated text of Twitter and SMS messages
to the multiply linked documents of Wikipedia and the World Wide Web.
We will explore various techniques for building "algorithmically
supported" documents, documents that draw some of their content from
algorithms, such as algorithms that analyze or reframe other documents.

### Textual analysis

Algorithms are core to the study of computer science.  Hence, the design
of algorithms that we can use to analyze and manipulate texts form the
core of the course.  These algorithms will, of course, rely on how
we choose to represent data.  And they can be used in the
service of the documents we author.  We will consider seemingly
straightforward issues of textual analysis, such as word frequencies, as
well as the complexities they raise, such as identifying words with
similar stems.  We will also explore more complex algorithms.

## Context

It would be irresponsible of us as computer scientists and as humanists
if we did not consider the broader context of the work we do.  At times,
we will consider the implications and potential pitfalls of the
algorithms we write and the data we represent.

Computer technology is changing the world.  Unfortunately, the people
who develop computer technology do not necessarily represent a
sufficient breadth of perspectives; fewer than 20% of computing
professionals self-identify as women and even fewer identify as people
of color. Since technology often reflects its designers' perspectives and
biases, this lack of diversity is troubling, not just because it means
that many kinds of technology better support or prioritize some groups
\(or, as importantly, deprioritize the needs of some groups\), but also
because of missed opportunities for other approaches and techniques.

One of the kinds of difference that many often miss is that of
difference in physical ability.  As developers find themselves excited
by new technologies and new opportunities, they forget to consider how
others might encounter those technologies, particularly those who have
limited sight, limited hearing, or limited movement. The digital
humanities also find themselves hampered by the lure of new
technologies; far too many digital humanities projects are inaccessible
to the differently abled, whether they represent highly visual
interfaces that cannot be used by the visually impaired, or archives of
auditory materials that lack transcripts, or complex user interfaces.
Whenever possible, we will ask ourselves whether the approaches we are
using are broadly accessible and, if they are not, we will consider ways
in which we could make them more accessible.

## Looking ahead

There you have it.  FunDHum introduces algorithmic thinking through
three core approaches to the digital humanities: data representation,
algorithmic texts, and textual analysis.  In the lessons to come, you
will explore the fundamentals of algorithm design, develop your own
algorithms, and enhance both your problem-solving skills and your
ability to represent things precisely.

Let’s get started.
