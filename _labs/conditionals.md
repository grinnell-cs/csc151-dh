---
title: Booleans values, predicates, and conditionals
summary: |
  In this lab, you will have the opportunity to explore the use of
  predicates as well as Scheme's three primary conditional control
  operations, `if`, `when`, and `cond`.
preimg: true
notes: |
  We've eliminated a "median of three without conditionals" problem,
  which is fun to mention, but not necessary.  This lab is likely
  still on the long side.  And we should also add a "trace a more
  complex conditional" problem.  Maybe there was one before.
---
We may have reached the point in which you need fewer instructions.  So
let's gve it a try.

{% if site.online %} 
Your team should decide who will take the A-side and B-sides of the lab.
Each member should make a copy of the appropriate code:

+ [conditionals-a.rkt]({{ "/code/labs/conditionals-a.rkt" | relative_url }})
+ [conditionals-b.rkt]({{ "/code/labs/conditionals-b.rkt" | relative_url }})

And follow the instructions in your respective files!
When you are done, combine the files, rename the result to `conditionals.rkt`, and upload the completed lab to Gradescope.
Make sure to include your partner as a pair!
And make sure to send the final code to your partner.
{% else %}
We will use the now-standard approach for this lab.
The person who arrived at the computer first is side A.
The other person is side B.  

Start by making a copy of the code.

* [conditionals.rkt]({{ "/code/labs/conditionals.rkt" | relative_url }})

Then follow the instructions in the file.

The note "`#| A |#`" in the code file means that A should become driver.
The note "`#| B |#`" in the code file means that B should become driver.
The note "`#| AB |#`" usually designates a section that both sides should read and/or think about.

Don't forget to submit the file on Gradescope, to include your partner when submitting, and to email the code to your partner.
{% endif %}
