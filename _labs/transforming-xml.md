---
title: Transforming XML
summary: |
  We consider some techniques for transforming XML documents. 
---

## Preparation

a. Have the traditional start-of-lab discussion.  That is, introduce
yourselves; discuss working strategies, strengths, and weakness; and
review the reading.

b. You'll need a variety of packages for this lab.  If you haven't
done so already, install the following packages in DrRacket using
File -> Install Package....

* `html-parsing`
* `html-writing`
* `sxml`
* `https://github.com/grinnell-cs/csc151www.git#main`

c. Make a copy of [excerpt.html](../files/sample-web/excerpt.html)
and [excerpt.css](../files/sample-web/excerpt.css), which you may
recall from [a recent lab](../labs/www).

d. Download the starter code for this lab.

* [transforming-xml.rkt](../code/labs/transforming-xml.rkt)

e. Review the self-checks from [the corresponding reading](../readings/transforming-xml) with your partner.

## Acknowledgements

This lab was newly written for Fall 2021.

The `csc151www` libraries to support these exercises on on the [Racket SXML libraries](https://docs.racket-lang.org/sxml/), and on Neil Van Dyke's [html-parsing](https://docs.racket-lang.org/html-parsing/) and [html-writing](https://docs.racket-lang.org/html-writing/) libraries.
