---
title: Writing Web pages
summary: |
  We introduce basic mechanisms for creating and linking pages
  on the World-Wide Web.  We also explore the roles of markup and style
  sheets.
prereqs: |
  [Generalized document markup in XML](../readings/xml)
---
## Introduction

What is "the Web"?  At this point in time, it seems to be many different
things to people.  However, at the core, the World Wide Web is a
*hypertext* document, a collection of "pages" of information that are
connected together by links.  In the early days of the Web, those pages
consisted mostly of text.  These days, images and animations often seem
more common than text.  Still, we can think of the Web as a collection
of interlinked things that we'll still refer to as "pages".

What do you need to support a system like the World Wide Web?  It
clearly requires an underlying communication infrastructure (the
Internet) that lets computers talk to each other.  But that's not
enough.  We need many additional components.

You've just finished reading about [structural markup with
XML](/csc151/readings/xml.html). Hence, it should not surprise you that the
Web needs an agreed-upon _representation_ for documents.  We've
already realized that XML-like notation is relatively dense to read.
Hence, we benefit from a _browser_, like Mozilla Firefox, that
renders those documents in a form appropriate for human readers and
that makes it easy to follow links to new documents.  Where do the
documents reside?  On _servers_, which store or construct documents
and which respond to requests for those documents.  Of course, if
the servers are to receive requests and respond appropriately, we
need an agreed-upon _communications protocol_ that specifies, among
other things, how a browser specifies a request for a particular
page and how the server can respond.  For example, how should the
server describe the type of content or indicate that the particular
content requested is no longer available?

That sounds like a lot, doesn't it?  For the time being, we will focus
on how one writes that pages that compose the Web.  Later on, we'll
explore how one builds or extends Web servers and, along the way, we'll
consider issues of the communication protocols involved.

Let's start with how to build a simple Web page.

## HTML, the HyperText Markup Language

When Tim Berners-Lee first developed the World-Wide Web, he designed a
simple language for marking up content that he called HTML, for
HyperText Markup Language.  Although the Web has grown significantly
since its origins as a communications systems for Physicists, HTML
remains a core Web technology.  The HTML of today still looks much like
the HTML that Berners-Lee first designed.  And, even though HTML
predates XML, HTML is now an XML dialect.  You should find the structure
familiar: an HTML document contains a variety of content along with tags
that describe the structure of the content.

### An example

```xml
<!DOCTYPE html>
<html lang="en">
<head>
  <title>ThingymabobCoInc</title>
  <meta charset="utf-8"/>
  <link rel='stylesheet' href='thingymabobco.css'/>
</head>
<body>
  <h1>ThingymabobCoInc</h1>

  <p id="introduction">
    <em>Welcome</em> to the Web site of
    <em class="company">ThingymabobCoInc</em>.  We are purveyors of
    not only thingys, but also mabobs.
  </p>

  <p>
    Here at <em class="company">ThingymabobCoInc</em>, we say
    <q id="slogan">If you can't find it here, you probably don't need it.</q>
  </p>

  <p>
    <em class="company">ThingymabobCoInc</em> is a proud sponsor of
    the Digital Humanities program at <a href="https://www.cs.grin.edu">The
    College of Smiles</a>.
  </p>
</body>
</html>
```

You may have noticed that we've used somewhat different tags in this
document than we used in our XML documents.  HTML uses a `p` tag for
paragraphs and an `em` tag for emphasized text.  The `a` tag is used for
links.  (Why is it `a` and not `link`?  I believe Berners-Lee thought
of a link as an "anchor" and wanted a concise notation.)  We've also
used `head` tags to separate the metadata from the content, which
appears within a pair of `body` tags.  In this case, we've specified
only two pieces of metadata: the character set and the title of the
document.  As we progress through our study of HTML, you will see a few
more.

You will also find that HTML tends to make comparatively limited use of
attributes.  Every tag can have a `class` attribute, which indicates the
role or roles the annotated text serves.  Tags can also have a `style`
attribute, which describes appearance.  Since there are other ways to
describe appearance, many pundits discourage the use of the `style`
attribute.  Every tag can also have an `id` attribute, which lets us refer
specifically to that element.

There are also some tag-specific attributes, such as the `href`
attribute of the `a` tag.

<!--
### Try It Out!

One of the beauties of simple web pages is that there is nothing "between" your
HTML code and displaying it.  In particular, you can save your HTML code to
a file, point a web browser at the file, and view it immediately.

To work with non-Racket text-based files, we'll use the [Atom](https://atom.io)
text editor which provides some niceties such as syntax highlighting while
still retaining the simplicity of a basic text editing program by default.
Install Atom on your machine via the program's website:

+ [The Atom Text Editor](https://atom.io)

Once installed, let's try it out on the sample webpage above!

1. Create a new folder, *e.g.*, `csc151`, to hold all your work for this semester.
2. Open up Atom and create a new file (`File` → `New File`).
3. Take the example HTML file above and copy-and-paste it into your new file.
4. Save the file in Atom to your folder with the name `example.html`.
5. Navigate with Explorer (Windows)/Finder (Mac) to the file and double click it to open it in your current default browser.

You can then make edits to the code in Atom, save them, and then refresh your browser to see the updated changes!
-->

### Additional tags

As you might expect, HTML specifies a wide array of tags.  You can learn
about them by reading the official specification or less formal
documentation, by looking at the underlying source of any Web pages, and
by asking people.  For now, we'll start with a few simple tags. You'll
discover more in [the associated lab](../labs/www).

* The `p` tag marks paragraphs.
* The `em` tag marks emphasized text, which usually appears in
  italics.
* The `strong` tag marks strongly emphasized text, which usually appears
  in boldface.
* The `q` tag marks a short quotation.
* The `blockquote` tag marks a block quotation.
* The `ul` tag marks an unnumbered list of things.
* The `ol` tag marks a numbered or lettered list of things.
* The `li` tag marks an item in a list (either numbered or unnumbered).
* The `span` tag marks a short section of text, typically within a
  paragraph or something similar.  We often use `span` along with a
  `class` attribute to indicate a special role for a piece of text.
* The `div` tag marks a longer section of text, typically a paragraph or
  more.  We often use `div` along with a `class` attribute to
  indicate a special role for a longer piece of text.

## Formatting text with cascading style sheets

You may have noted that, in most cases, we did not discuss the
appearance of the marked-up text .  Even when we did, such as when we
noted that emphasized text usually appears in italics, we did not
make a universal statement.  That's because one can customize the
ways in which things appear on Web pages using a technology called
*cascading style sheets* or *CSS*.  Style sheets allow you to provide
uniform formatting for pages and to choose a "site theme", as it were.

How does one associate a stylesheet with a Web page?  You may have noted
that our sample Web page had the following line.

```xml
  <link rel='stylesheet' href='thingymabobco.css'/>
```

That tells the Web browser to load and apply styles from the file
`thingymabobco.css`.

Here are a few sample styles, taken from a style sheet you will work
with in [the corresponding lab](../labs/www).

```css
p { 
  margin-left: 1in;
  margin-right: 1in;
}

em {
  font-style: normal;
  font-weight: bold;
}
 
p#introduction {
  font-size: 150%;
  color: blue;
}   

em.company {
  color: white;
  font-family: Helvetica, Sans;
  text-shadow: 1px 3px red;
}
```

A CSS style sheet consists of a sequence of CSS rules.  Each rule
includes a *selector* that identifies what elements to apply a style
to and a *declaration block*, surrounded by braces, that describes
the style.  The block contains a sequence of declarations, each of
which has a property, a colon, a value, and a semicolon.

In the example above, the first rule is for paragraphs (`p`) and
specifies that the left and right margins of paragraphs are one inch.
The second rule is for emphasized text and indicates that emphasized
text should appear in a normal style (the alternatives are italic
and obligue) and a bold weight (alternatives include normal,
bold, bolder, and lighter).

The next two rules have selectors that limit their effect.  The
`#introduction` applies only to the paragraph that has an identifier
of `introduction`.  In this case, the introduction is larger and
colored blue.  The `em.company` selector applies only to emphasized
text that has the `company` class.  In this case, we are setting
the color, the font (Helvetica, if it's present, otherwise a sans-serif
font), and some shadowing.

In general, the `#ID` selector applies to tags with a particular id and the
`.CLASS` selector applies to tags with a particular class.  It is also
possible for a tag to have multiple classes; you indicate that by putting
a space between the class names.  In the following, the quotation 
has two classes: `spoken` and `white-queen`.

```xml
    <q class="spoken white-queen">What manner of things?</q>
```

We might style that as follows.  Note that we don't necessarily need
the tag for the class selector.

```css
.spoken {
  font-weight: bold;
}
.white-queen {
  font-color: gray;
}
```

### Useful CSS properties

Here are a few of the CSS properties that you will likely find
useful as you style pages.  You'll see examples in [the corresponding
lab](../labs/www).

<!-- Eventually, we should include examples. -->

`color`
  : The color to use for text.  You can use color names or RGB
    colors.  (More on those in another reading.)  You can find
    the list of CSS colors at 
    <https://www.w3schools.com/cssref/css_colors.asp>.

`background-color`
  : The color to put behind the text.

`margin-left`, `margin-right`, `margin-top`, `margin-bottom`
  : The margins.  You can specify these in inches (e.g., `1in`),
    centimeters (e.g., `2cm`), percent of the page width (e.g.,
    `5%`), width of the letter "m" (e.g., `2em`), height of the
    letter "x" (e.g., `1ex`), or a few other units.

`font-family`
  : A list of font familiess to use.  We use a list because not all
    fonts families are available on all computers.  Traditionally,
    we end the list with either `sans`, for the default sans-serif
    font family, or `serif`, for the default serif font family.  In
    case you don't know the terminology, serif font families have
    little outcroppings (serifs) at the ends of some lines in the
    letter, as in Times, while sans-serif font families do not have those,
    as in Helvetica.

`font-style`
  : The style of the font.  It can be `normal`, `italic`, or
    `oblique`.

`font-weight`
  : The weight of the font.  Typically, `normal` or `bold`.  `bolder`
    and `lighter` are also possible, but not always effective.  You
    can also use numeric weights (multiples of 100 between 100 and 900),
    but those are not supported in all font families.

`font-variant`
  : A variant of the font.  Currently, only `normal` and `small-caps`
    are supported.

`font-size`
  : The size of the font.  You can use descriptive absolute sizes
    (`xx-small`, `x-small`, `small`, `medium`, `large`, `x-large`,
    and `xx-large`), relative sizes (`larger` and `smaller`), percentage
    (of the expected size), or absolute in terms of points, with
    something like `12px`.

`text-shadow`
  : Add a shadow to the text.  You can use three parameters for
   the shadow (x offset, y offset, and color) or four
   (x offset, y offset, "blur", and color).

`transform`
  : A transformation of the element.  You can use `scale(x,y)`, which will
    scale something horizontally or vertically by some factor,  You
    can use `rotate(angle)`, which will rotate by an angle, typically
    expressed as something like `45deg`.  There are also a variety
    of other transformations available.
{:.indented}

## Additional issues

There are, of course, many more issues that one can consider in building
Web pages with HTML and CSS.  For example, there are a variety of other
tags in the HTML standard and an large set of styles for CSS.  You'll
explore a bit more in [the corresponding lab](/csc151/labs/www.html).  After that,
you can discover more on your own, as needed.

## Additional resources

[W3schools](https://www.w3schools.com) provies [an HTML tutorial](https://www.w3schools.com/html/) at <https://www.w3schools.com/html/> and [a CSS tutorial](https://www.w3schools.com/css/) at <https://www.w3schools.com/css/>.  W3schools also has a useful [list of CSS properties](https://www.w3schools.com/cssref/) at <https://www.w3schools.com/cssref/>.

The [HTML Living Standard](https://html.spec.whatwg.org/multipage/#toc-semantics) is available at <https://html.spec.whatwg.org/multipage/>.

A relatively recent version of the [HTML 5.3 Standard](https://www.w3.org/TR/2018/WD-html53-20181018/) is available at <https://www.w3.org/TR/2018/WD-html53-20181018/>.

CSS has grown enough that the designers publish regular "snapshots" of
a large array of documents.  Those are primarily intended for developers,
rather than authors, but may contain some useful information.  One
recent snapshot is at <https://www.w3.org/TR/CSS/>.

