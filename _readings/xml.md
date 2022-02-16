---
title: Generalized document markup with XML
summary: |
  We consider issues related to the storage of text documents
  in electronic form.  We also explore some basic ways in which the
  XML markup language can be used to represent both text documents and
  collections of information.
prereqs: |
  This section has no prerequisites.
---

## Content, formatting, structure, and metadata

As you may recall from the introduction, computer scientists concern
themselves with two broad issues: algorithms and data representation.
Data representation will form a core part of our study of the digital
humanities; if our goal is to use computers to help us study the works
of humanity, we must represent those works.  Although digital humanists
deal with a wide variety of data, we will begin by considering the kind
of information we might store for a textual work in digital form, such
as a book, an article, or a poem.

Consider, for example, this excerpt from The Millennium Fulcrum Edition
1.7 of Lewis Carroll's _Through the Looking-Glass_. (This particular
version was found on Project Gutenberg at
[https://www.gutenberg.org/ebooks/12](https://www.gutenberg.org/ebooks/12).)

> 'What manner of things?' said the Queen, looking over the book (in
which Alice had put '_The White Knight is sliding down the poker. He
balances very badly_') 'That's not a memorandum of _your_ feelings!'

> There was a book lying near Alice on the table, and while she sat
watching the White King (for she was still a little anxious about him,
and had the ink all ready to throw over him, in case he fainted again),
she turned over the leaves, to find some part that she could read, '—for
it's all in some language I don't know,' she said to herself.

> It was like this.

> > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_JABBERWOCKY_{: .mirror .inline-block}

> > &nbsp;&nbsp; _'Twas brillig, and the slithy toves_{: .mirror .inline-block} \\
> > _Did gyre and gimble in the wabe;_{: .mirror .inline-block} \\
> > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _All mimsy were the borogoves,_{: .mirror .inline-block} \\
> > _And the mome raths outgrabe._{: .mirror .inline-block}

<!--
> > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_YKCOWREBBAJ_{: .mirror .inline-block}

> > &nbsp;&nbsp; _sevot yhtils eht dna ,gillirb sawT'_{: .mirror .inline-block} \\
> > _;ebaw eht ni elbmig dna eryg diD_{: .mirror .inline-block} \\
> > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _,sevogorob eht erew ysmim llA_{: .mirror .inline-block} \\
> > _.ebargtuo shtar emom eht dnA_{: .mirror .inline-block}
-->

<!--
> > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_YKCOWREBBAJ_

> > &nbsp;&nbsp; _sevot yhtils eht dna ,gillirb sawT'_ \\
> > _;ebaw eht ni elbmig dna eryg diD_ \\
> > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _,sevogorob eht erew ysmim llA_ \\
> > _.ebargtuo shtar emom eht dnA_
-->

Let's start with the _content_.  We might think of this data as a series
of characters: There's a single opening quotation mark, the letter W,
the letter h, the letter a, the letter t, and so on. We might also think
about it as a series of words and punctuation: A single opening
quotation mark, the word "What", the word "manner", the word "of", the
word "things", a question mark, a single closing quotation mark, and so
on.  We might even be able to teach the computer how to identify the
sequence of words from the sequence of characters.

Believe it or not, but even "a series of characters" leads to some
questions about underlying representation.  Since computers store
everything as a series of 0's and 1's ("bits", in the common
parlance), we need to convert from characters to bits and back again.
It turns out that there are multiple choices we can make. For example,
if we care about efficiency of storage, we might use fewer bits for
common letters like "e" and "a", and more bits for uncommon characters,
like the caret (^).  For many years, most systems used one of a few
popular encodings of characters, either ASCII, the American Standard
Code for Information Interchange, or EBCDIC, the Extended Binary
Coded Decimal Interchange Code.  Why two?  Because America was
dominant in the development of early computer technology, ASCII
became a de-facto standard.  But ASCII leaves off not only many
diacritics necessary for many other Western languages, but also the
wide variety of symbols used in non-Roman alphabets.

You may have noted that there's more to the text above than just a
sequence of characters.  For example, there are breaks between blocks of
text, breaks that help us identify those blocks as paragraphs (or,
perhaps, lines or stanzas in a poem).  Some of the text is in italics.
And it appears that Carroll (or Carroll's typesetter) has used italics
for at least two separate meanings.  In the first case ("_your_"), the italics
suggest an emphasis in spoken language.  In the second case, they appear
to serve to distinguish quoted written text (in both quotation marks
and italics) from quoted spoken text (only with quotation marks).
Jabberwocky is also in italics, most likely to represent printed
text, but perhaps to indicate poetry.  There are certainly a variety
of other reasons that people use italics.  For example, book titles
usually appear in italics, as do certain section headings.

We will also need to represent those kinds of _formatting_ and
_structural_ information.  And, once again, there are a variety of
techniques that are possible.  Some programs, like Microsoft Word, use a
custom sequence of bits that it hides from the reader. Others use
agreed-upon sequences of visible characters.  For example, in Scribble,
the typesetting language often used for Racket documentation, I
might write `@emph{your}` to indicate that "your" is emphasized;
in LaTeX, a popular typesetting language for Mathematicians, Computer
Scientists, and Economists, I might write `\textit{your}`; in HTML,
the primary document markup language for the World-Wide Web, I might
write `<em>your</em>`; and in Markdown, a simple markup language
we use for the course, I might write `_your_`.

Finally, we need to represent information about the text, which both
computer scientists and digital humanists call "_metadata_". For
example, we might indicate the author of a work (Lewis Carroll, or
perhaps Charles Lutwidge Dodgson), the publisher (Project Gutenberg,
in this case), the edition (The Millenium Fulcum Ediction 1.7), the
publication date (6 October 2016, for this edition).  We might also
record information about who is responsible for the current form (e.g.,
the transcriptionist and the date of transcription). When we're dealing
with not just a book in the abstract, but a particular physical volume,
we might record other aspects, such as a history of ownership, the
condition (broadly or in detail), attributes that distinguish it from
other similar physical volumes (e.g., that it has Carroll's
signature), and so on and so forth.

As you might expect, there are various ways to encode metadata.  We
won't consider those in depth.  However, there's a second issue at play
with metadata: Do we store the metadata for work in the same file as the
work or do we store it separately?  There are many kinds of metadata
that exist separately from the works. Consider, for example, the Library
of Congress record or an Amazon sales page for a book.  Intellectual
property considerations suggest that neither the Library of Congress nor
Amazon should provide you with the content of the book.  Nonetheless,
both provide you with a variety of other information, including not just
author, title, and publisher, but also genre (or Library of Congress
classification), number of pages, and, in the case of Amazon listings,
reviews.  While examples like this suggest that there are situation in
which it is useful to store metadata separately, there are also risks to
separate storage.  Files don't always stay together, no matter how hard
we try; if the metadata is stored externally to the content data, either
the content or the metadata might get lost.   Each is substantially less
useful on its own.

We've suggested four kinds of information we might store for a document:
content, formatting, structure, and metadata.  You will find that there
is some slippage between these classifications. For example, some
systems would include quotations marks as parts of the data, while
others would suggest that our primary responsibility is to indicate that
something is a quotation and let other rules determine how that
quotation is displayed—e.g., with single quotation marks, double
quotation marks, or Guillemets.  Similarly, do we consider page breaks
part of the structural information or part of the metadata?  For these
issues, and many more, context matters.  If we are participating in the
construction of an existing corpus, there will be guidelines.  If we are
creating a new corpus, we will be responsible for making our own
choices, developing the guidelines along the way.  In both cases, we
will be adding information to ("marking up" or "annotating") the
digitized content.

## XML basics

In this course, we will generally use a notation called XML (eXtensible
Markup Language) to represent content, format, structure, and metadata.
XML is a popular language for digital humanists and has at least three
major benefits.

* _XML supports human-readable, in-text mark for formatting, document
  structure, and metadata_.  You need only one language for the three
  kinds of document markup.  And, because XML markup is plain
  text, you can write XML in almost any editor and can read it using any
  programming language.

* _XML supports both systematic and ad-hoc markup_.  If you want to
  carefully design a set of rules for marking documents, you can. If you
  want to choose new markup tags as you go, you can do that, too.

* _XML supports both within-document and external metadata_.  Whether
  your context suggests that you should store metadata within the
  document or requires that you store it externally, you can do so with
  essentially the same XML syntax.

* _XML closely resembles HTML_.  Most people who work with computers
  eventually learn HTML.  (You will, too.)  Hence, the transition to
  XML is relatively simple and straightforward.

The basic approach of XML is relatively straightforward: You surround a
piece of text with "tags" that indicate something (role, structure,
format) about the text.  A simple opening tag consists of a left angle
bracket, a word that describes the text, and a right angle bracket, as
in `<paragraph>`.  A closing tag looks similar, except that there is a
forward slash after the left angle bracket, as in `</paragraph>`.  Here
are a few examples.

* `<emphasize>your</emphasize>`{:.language-xml} indicates that the word "your" should be
  emphasized.  In this case, we have marked the document to indicate
  its formatting.
* `<paragraph>There was a book lying near Alice on the table ... she
  said to herself.</paragraph>` indicates that the given text forms a
  paragraph.  In this case, we have marked the document to indicate
  its structure.
* `<quotation>What manner of things?</quotation>` indicates that "What
  manner of things?" is a quotation.  Here, we have also marked the
  document to indicate its structure.  The structure also implies a bit
  of formatting—we should surround the quotation with the appropriate
  quotation symbols.
* `<poem><title>YKCOWREBBAJ</title>...</poem>` indicates that
  "YKCOWREBBAJ" is the title of a poem.

At times, we want to include additional information about the tagged
text.  For example, we might want to indicate that "What manner of
things?" was spoken aloud by the Queen.  To do so, we add what are
called _attributes_ to the tags.  Each attribute consists of a word
describing the type of attribute, an equals sign, and the associated
information surrounded by single- or double-quotation marks.

```xml
<paragraph>
  <quotation mode='spoken' source='White Queen'>What manner of things?</quotation>
  said the Queen, looking over the book (in which Alice had put
  <quotation mode='written' source='Alice'>The White Knight is sliding down
  the poker. He balances very badly</quotation>)
  <quotation mode='spoken' source='White Queen'>That's not a memorandum of
  <emphasize>your</emphasize> feelings!</quotation>
</paragraph>
```

No, that's not nearly as readable for a human being as the original.
However, a computer program can readily translate it into something a
human can read.  And, as importantly, it provides a mechanism by which
we can start to extract "interesting" information from the text.  We
might, for example, write a program that relies on this notation to
extract all of the quotations attributed to the White Queen or to help
ourselves remember what the dormouse said.

There are a few subtleties that you will soon encounter. First, if the
left angle bracket represents the start of a tag, how do we represent a
left angle bracket?  XML uses what are called _character entities_,
which consist of an ampersand, a name for the character, and a
semicolon.  Most importantly, < is represented as `&lt;` and > as
`&gt;`As you might guess, since the ampersand has meaning, we need an
entity for it, too: & is represented as `&amp;`. You can look up other
entities [online](https://dev.w3.org/html5/html-author/charref).

Second, there are times that you will want to mark up the text
wihtout referring to any particular text.  For example, if there's
a mark on a page between two words in a particular copy of the book
that you are representing, you might want to describe that mark.
You can use a pair of tags with nothing in between them (e.g.,
`<insertion description='a heart drawn in burgundy'></insertion>`)
or you can just include a slash before the close tag (e.g., `<insertion
description='...'/>`).

Third, XML documents must be _hierarchical_; any start tag that is
within another tagged section of text must have a corresponding end tag
within that section.  For example, if you start a quotation within a
paragraph, you must end that quotation within the same paragraph.
Hierarchical tagging generally corresponds to the structure of most
written texts.  However, when you start to add additional tags, you will
find that you'll want to overlap tagged sections.  For example, you will
find it difficult to tag both pages and paragraphs since paragraphs
often start on one page and start on the next.  When we encounter such
situations, we'll need to come up with alternate solutions.  For
example, in the case of paragraphs and tags, we might use our standard
strategy for tagging paragraphs and just insert a singleton "page break"
tag to indicate where each page begins or ends.

Believe it or not, but that's the majority of what you need to know
about XML.  That is, there are three primary issues: (a) you use
XML to "mark up" texts with additional information, (b) XML markup
typically involves surrounding a piece of text with tags, and (c)
tags can have attributes.  There are also three additional issues
to consider: (d) we use character entities in place of <, >, and
&, (e) we can write singleton tags if the need arises, and (f) XML
documents must be hierarchical.

## A longer example

Here's one possible representation of the excerpt in XML.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<excerpt>
  <source>
    <book
     author='Lewis Carroll'
     title='Through the Looking-Glass'
     subtitle='and What Alice Found There'
     actual-author='Charles Lutwidge Dodgson'
     publisher='Project Gutenberg'
     version='The Millennium Fulcrum Edition 1.7'
     date='2016-10-06'
     original-publication-year='1871'
     url='https://www.gutenberg.org/files/12/12-h/12-h.htm'/>
  </source>

  <paragraph>
    <quotation mode='spoken' source='White Queen'>
      What manner of things?
    </quotation>
    said the Queen, looking over the
    <ref target="King's memorandum">book</ref>
    <aside>
      (in which Alice had put
      <quotation mode='written' source='Alice'>
        The White Knight is sliding down the poker. He balances very badly
      </quotation>)
    </aside>
    <quotation mode='spoken' source='White Queen'>
      That's not a memorandum of <emphasize>your</emphasize> feelings!
    </quotation>
  </paragraph>

  <paragraph>
    There was a <ref target='jabberwocky'>book</ref> lying near
    Alice on the table, and while she sat watching the White King
    <aside>
      (for she was still a little anxious
      about him, and had the ink all ready to throw over him, in case
      he fainted again)
    </aside>, she turned over the leaves, to find some
    part that she could read,
    <quotation mode='introspective' source='Alice'>
      —for it's all in some language I don't know,
    </quotation>
    she said to herself.
  </paragraph>

  <paragraph>
    It was like this.
  </paragraph>

  <poem mode='right-align' title='YKCOWREBBAJ'>
    <stanza>
      <line translation="'Twas brillig, and the slithy toves">
        sevot yhtils eht dna ,gillirb sawT'
      </line>
      <line type='continuation'
            translation="Did gyre and gimble in the wabe;">
        ;ebaw eht ni elbmig dna eryg diD
      </line>
      <line translation="All mimsy were the borogoves,"
            note='For additional explanation, see the short story
                  "Mimsy Were the Borogoves" by Henry Kuttner and
                  C. L. Moore writing as Lewis Padgett'>
        ,sevogorob eht erew ysmim llA
      </line>
      <line type='continuation'
            translation="And the mome raths outgrabe.">
        .ebargtuo shtar emom eht dnA
      </line>
    </stanza>
  </poem>
</excerpt>
```

You may have noted that I've made the title of the poem an attribute,
rather than putting it in the text and marking it as a title.  One of
the strengths (or weaknesses, depending on your perspective) of XML is
that we can use either approach.

You may also have noted that I've made liberal use of "whitespace",
changing line breaks and inserting space at the beginning of the line.
XML collapses most of the whitespace in a document into a single space,
which allows us to organize our documents in a way that may be more
readable to human beings.

Finally, I've added a few bits of information for the reader or analyst,
such as references to distinguish the two books that appear in this
scene, translations of the mirrored text, and an external reference for
more information about a line in Jabberwocky.  Others might make
differenct decisions, particularly about the mirrored text.  For
example, one might put that text in the correct order with a notation
that it it should be displayed as a mirror image.

```xml
      <line display="mirror">
        'Twas brillig, and the slithy toves"
      </line>
```

## Representing collections of information

We've seen that XML provides a somewhat straightforward mechanisms for
representing both the content of documents and additional information
about that content.  However, that's not the only way in which digital
humanists use XML; many find that XML is an equally natural way to
represent collections of data or metadata.

Suppose, for example, that we wanted to store information about the
books in Project Gutenberg.  In some sense, this task is much like that
of representing a single document: We have some data (in this case, the
list of books) and some additional information that we want to convey
about the data (in this case, that might be to indicate which text
represents author, title, and URL).

```xml
<?xml version="1.0" encoding="UTF-8"?>
<collection>
  <name>Project Gutenberg</name>
  <bookinfo book-id="000001">
    <author><first>Thomas</first> <last>Jefferson</last></author>
    <title>The Declaration of Independence of the United States of America</title>
    <url>https://www.gutenberg.org/ebooks/1</url>
  </bookinfo>
  <bookinfo book-id="000002">
    <author>
      Anonymous
      <alternative>
        The United States of America
      </alternative>
    </author>
    <title>The United States Bill of Rights</title>
    <url>https://www.gutenberg.org/ebooks/2</url>
  </bookinfo>
  ...
  <bookinfo book-id="000011">
    <author author-id="412369">
      <first>Lewis</first> <last>Carroll</last>
      <alternative>
        <first>Charles</first> <middle>Lutwidge</middle> <last>Dogson</last>
      </alternative>
    </author>
    <title>Alice's Adventures in Wonderland</title>
    <url>https://www.gutenberg.org/ebooks/11</url>
  </bookinfo>
  <bookinfo book-id="000012">
    <author author-id="412369"/>
    <title>Through the Looking-Glass</title>
    <url>https://www.gutenberg.org/ebooks/12</url>
  </bookinfo>
  ...
</collection>
```

XML is not the only format one can use to store this information. In
fact, many people find XML to be overly verbose and prefer other
formats, such as CSV.  (We'll cover CSV in a subsequent reading.)
XML's structure can also slow down the initial processing of document
data.  However, XML still has some advantages for situations like this.
First, it remains comparatively readable.  Second, it makes it much
easier to deal with optional information, such as the alternative
authors we have for some situations but not for others.

As we found when marking up _Through the Looking-Glass_, XML allows us
to indicate the same information in multiple ways. Suppose, for example,
we wanted to represent all of the quotations from that work.  We might
follow the model we used in our original form.

```xml
<?xml version="1.0" encoding="UTF-8"?>                                
<elements>                                                            
  <quotation mode='spoken' source='Alice'>                            
    Oh, you wicked little thing!                                      
  </quotation>                                                        
  ...                                                                 
  <quotation mode='spoken' source='White Queen'>                      
    What manner of things?                                            
  </quotation>                                                        
  <quotation mode='written' source='Alice'>                           
    The White Knight is sliding down the poker. He balances very badly
  </quotation>                                                        
  <quotation mode='spoken' source='White Queen'>                      
    That's not a memorandum of <emphasize>your</emphasize> feelings!  
  </quotation>                                                        
  <quotation mode='introspective' source='Alice'>                     
    —for it's all in some language I don't know,                      
  </quotation>                                                        
  ...                                                                 
</elements>                                                           
```

We might instead follow a model closer to the one we used for the
Project Gutenberg list.

```xml
<?xml version="1.0" encoding="UTF-8"?>                                
<elements>
  <quotation>
    <mode>spoken</mode>
    <source>Alice</source>
    <audience>The black kitten</audience>
    <content>Oh, you wicked little thing!</content>
  </quotation>
  ...
  <quotation>
    <mode>spoken</mode>
    <source>White Queen</source>
    <content>What manner of things?</content>
  </quotation>
  <quotation>
    <mode>written</mode>
    <source>Alice</source>
    <content>The White Knight is sliding down the poker. He balances very badly</content>
  </quotation>
  ...
</elements>
```

Which is more "correct"?  Neither; it depends on what you, as designer,
choose.  With practice, you'll find that different strategies work
better for different situations.  Fortunately, you will also find that
you can write programs that translate between the different
representations.

## Additional resources

The Text Encoding Initiative (TEI) provides a fairly standard set of
markup used by many digital humanists.  For an introduction, check out
[http://teibyexample.org](http://teibyexample.org).

The World Wide Web Consortium (W3C) maintains the "XML standard"; the
official rules for XML.  You can find the official description of XML
1.0 at
[https://www.w3.org/TR/2008/REC-xml-20081126/](https://www.w3.org/TR/2008/REC-xml-20081126/).

## Self checks

### Self check 1: Markup (‡)

We discussed four possible kinds of markup.  Summarize those four types.

### Self check 2: XML tags

Suppose you had to explain XML tags to a classmate who had not done this
reading.  What would you tell them?

