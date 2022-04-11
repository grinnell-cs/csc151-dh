---
title: Writing Web pages
summary: |
  We consider techniques for building and styling Web pages.
---
## Preliminaries

_Side A_

Note: The person logged in to the MathLAN machine must be the same as
the person whose CPanel site you will be using.

a. In a Web browser, open [the reading on HTML and CSS](../readings/www).

b. In a Web browser, open [some instructions for working with sites.grinnell.edu](../files/sites.grinnell.edu.pdf).

c. Using the File Manager (the icon that looks like a blue file cabinet),
create a directory for this lab on the desktop.  We'd suggest 
`csc151-www-lab` or something similar.  (We'll use that name in the
further instructions.)

d. Right click on each of the following and save them to the folder
you just created.

* [company.css](../files/sample-web/company.css)
* [excerpt.css](../files/sample-web//excerpt.css)
* [excerpt.html](../files/sample-web/excerpt.html)
* [index.html](../files/sample-web/index.html)
* [mabob.css](../files/sample-web/mabob.css)
* [spare.css](../files/sample-web/spare.css)
* [thingy.css](../files/sample-web/thingy.css)
* [thingy.html](../files/sample-web/thingy.html)

e. In your Web browser, navigate to <https://sites.grinnell.edu>,
click on "cPanel Dashboard", log in to cPanel, find the File Manager
icon, and click on that.  (There are some pictures in the instructions
you opened in step b.)

f. Click on `public_html` in the left column and, in your `public_html`
folder, create a `csc151` subfolder.  (You should be able to figure
this out.  But there are also pictures in the instructions you opened
in step b.)

g. Take a deep breath.

## Exercises

### Exercise 1: Exploring a Web page

_Side B_

Let's start by looking at the ThingymabobCoInc Web site from
[the reading](../readings/www).

a. If you have not already done so, use the File Manager to navigate
to your `cusc151-www-lab directory on our local computer.

b. Right click on the file named `thingy.html` and select
**Open with "Text Editor"**.  An editor window should appear showing 
the HTML, perhaps colored to show the different parts of the code.

c. Scan through the page, identifying the different tags that are
being used.  You may want to note them down on a piece of paper.

d. In your Web browser, select File -> Open File... (or hit Ctrl-O),
then navigate to `thingy.html` and open it.  You might also be able to
use <file:///home/USERNAME/Desktop/csc151-www-lab/thingy.html>.  If all
goes well, you should see a Web page that corresponds to the text you
just read.  (Yes, the page is intentionally hideous.)  If you can't load
the page in one of those ways, get help from one of the class assistants.

e. In your text editor, make some changes to the page.  You might,
for example, add something like 

```xml
<p>
  We are proud to have acquired our long-term rival, 
  <strong class="company">Whatchamacallit</strong> and will
  soon be disposing of their useless products.
</p>
```

f. Reload the page to verify that the changes have taken effect.

### Exercise 2: Uploading a Web page

_Side A_

So far, we've just looked at the page on our local machine.  We'd rather see
the page on the World-Wide Web.  

a. Using the cPanel File Manager, upload both `thingy.html` and
`thingy.css` to the `csc151` folder on your personal Web site.
(Check the instructions from part b of the preliminaries if you
can't figure out how to do that.)

b. In your Web browser, navigate to
<http://yoursite.sites.grinnell.edu/csc151/thingy.html>, substituting
your own site name.  If all goes well, you should once again see a
Web page that corresponds to the text you just read.  If you can't
load the page in that way get help from one of the class assistants.

c. How do we make changes?  Good practice is to make changes locally
and then upload.  So make another change to `thingy.html`.

d. Reload the local (file) version to verify that it has changed.

e. Reload the remote (sites.grinnell.edu) version to verify that it
has *not* changed.

f. Upload the changed file.

g. Reload the remote page to verify that the changes have taken
effect.

h. Ask a nearby group for the URL for their page and verify that
you can view their page as well as your own.

### Exercise 3: Exploring styles

_Side B_

As we noted, the design of the page is particularly hideous.  You can
read the details of the design in the file `thingy.css`.

a. If you have not already done so, use the File Manager to navigate
to the directory you created in the preliminaries.

b. Right click on the file named `thingy.css` and select
**Open with "Text Editor"**.  A GEdit window should appear showing the
CSS, colored to show the different parts of the code.

c. Change the background color to something else.  You might try
`gray` or `yellow` or `white`.  You can find a large list of possible
colors at <https://www.w3schools.com/cssref/css_colors.asp>.
Don't forget to save your changes.

d. Check the changes locally by reloading the local version
of the page in your Web
browser.  If you don't see a change, try
<kbd>Shift</kbd>-<kbd>Ctrl</kbd>-<kbd>R</kbd> in the Web browser.

e. Upload the file and reload the remote version of page in
the Web browser.  

f. Spend no more than five minutes making the page less hideous.

### Exercise 4: Changing styles

_Side A_

In our description of CSS, we noted that one advantage of CSS is that
it lets you quickly change the appearance of a page.  Let's try 
that.

a. Open the file `mabob.css` and read through it, making note of the
design decisions.  Sketch what you expect the page to look like with
this style sheet.

b. If it's not already open, open the file `thingy.html`.

c. At the top of the file, there's a line that specifies that the CSS
comes from `thingy.css`.  Replace `thingy.css` with `mabob.css`.

d. Save `thingy.html`.

e. Reload the local version of `thingy.html` in your Web browser
to see how it's changed.

f. Upload the modified `thingy.html` to your Web site.

g. Reload the remote `thingy.html` in your Web browser.

h. You've probably noticed that all the styling disappeared.  Why?
Because we didn't upload `mabob.css`.  Upload `mabob.css` and
reload the remote `thingy.html` in your Web browser.

### Exercise 5: Reflection

_Side B_

_If you are color deficient or have other vision issues, you may choose
to skip this exercise._

You may have noted that gedit, our text editor, uses different colors for
different parts of your HTML and CSS.

a. What do the colors represent in the HTML document?  For example, in
my version of gedit, it appears that green represents tags.

b. What do the colors represent in the CSS document?

### Exercise 6: Building a new style sheet

_Side A_

a. Open `excerpt.html` and `excerpt.css` in the text editor (gedit).

b. Skim through `excerpt.html`, making note of the tags and styles you
see.

c. Skim through `excerpt.css`, making note of any styles that are
defined.  (You should find only one.)

d. Load the local version of `excerpt.html` in your Web browser to
see how it appears.

e. One benefit of electronic documents over printed documents is that
color is much easier to use (or at least much cheaper).  Update
`excerpt.css` to assign different colors to the different people
who are quoted (the king, the white queen, and Alice).  I used
red for the king, gray for the queen, and cornflowerblue for Alice,
but you can use any colors you'd like.  Reload the page to view your
updates.

f. As you may recall from [our discussion of XML](../readings/xml),
a typographer might choose to make different kinds of quoted material
appear differently.  That is, spoken text might appear different
than written text, and both might appear different than introspective
text (thoughts to oneself).  Change those three kinds of text.  You
might use `font-weight`, `font-style`, `font-variant`, `transform`,
`text-shadow`, or anything else you decide is appropriate.
Reload the page to view your updates.

g. The designers of most modern Web pages don't extend text to the
left and right edges of the browser.  Instead, they use `margin-left`
and `margin-right` to add some visual whitespace.  Update the style
for the `body` tag to provide one-inch margins.  Reload the page
to view your updates.

h. As long as we're dealing with margins, it would be useful to indent
the continued lines in Jabberwocky.  Add a `margin-left` on those lines.
I'd suggest the value `1em`, which is the width of the letter "m".
Reload the page to view your updates.

i. The default font family for the page is somewhat bland.  Let's
experiment a bit.  Try adding `font-family: Helvetica, Sans;` to
the style for the body.  This tells the browser to try Helvetica, 
if it's available, and, if not, use some simple sans-serif font.
Reload the page to view your updates.

j. You may have noted that the line spacing in the poem is inappropriate.
That's because each paragraph has a top and bottom margin.  Update
the `.line` class to use 0 for the top and bottom margins.
Reload the page to view your updates.

k. At this point, the stanzas all run together.  Add top and bottom
margins to the stanza to achieve some separation.

l. At present, the title of Jabberwocky does not stand out.  Some
versions of the poem format it in all caps.  However, modern typographers
would probably prefer small caps.  Update the title to use the following.

```css
font-variant: small-caps;
```

You can also make any other changes you'd like.

m. The source information is not strictly necessary.  Let's hide it.
Update the style for `p.source` to use

```css
display: none;
```

As before, save and reload.

n. We've come a long way since the original version of the page, haven't
we?  Identify one or two other things you might like to update and then
move on to the next exercise.

o. Upload the modified files to your remote Web site and verify
that you can view them.

### Exercise 7: Your own story

_Side B_

Using the tags and styles from the excerpt, create your own short story
(with quotations) about Alice, the king, and the queen.  (The goal of
the exercise is primarily for you to get used to including tags and
styles in the text you write.)  Spend no more than ten minutes writing.

Upload this file to your Web site

## What to submit

You will just submit a link to your Web site.

## For those with extra time

### Extra 1: Fun with fonts

i. Grinnell's [visual identiy
guidelines](https://www.grinnell.edu/about/offices-services/communications/brand/visual-identity)
suggest that we use Futura and Freight Text Pro as our primary
fonts] However, both are expensive commercial fonts and the College
has chosen not to purchase a site license.  As alternatives, our
Communications department suggests that we use Arial and Georgia.
Unfortunately, neither of those is available on most Linux workstations.

Fortunately, there are a wide variety of open-licensed fonts available
to us.  My preferred alternative to Freight Text Pro is [Besley](https://indestructibletype.com/Besley.html) and my preferred alternative to Futura is [Jost](https://indestructibletype.com/Jost.html).

Using other fonts can be a bit more difficult.  First, we have to tell
the browser where to find information on those fonts.  Then we update the
`font-family` tag as you did earlier.

a. Add the following line to the head of `excerpt.html` and save the file.

```xml
<link rel="stylesheet" href="https://indestructibletype.com/fonts/Besley.css" type="text/css" charset="utf-8" />
```

b. Reload the page.  Do you see any differences?  (You shouldn't.)

c. In `excerpt.css`, update the style for the body to use the
following entry for the font family.  Then save the CSS file.

```
  font-family: Besley, Georgia, Serif;
```

d. Reload the page.  Do you see any differences?  (You should.)

e. Google generously provides a wide variety of open fonts at
<https://fonts.google.com>.  Browse through the fonts, choose one,
and figure out how to add it to your page.


### Extra 2: Developing your own style sheet

You've now seen two style sheets for the same page and the signficant
effects a style sheet can have on the appearance of the page.  It's
now time to design your own style sheet.  The file `company.css`
contains blank entries for the primary selectors you would use for
the ThingymabobCoInc Web site.

