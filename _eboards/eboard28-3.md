---
title: "EBoard 28 (Section 3): Marking Text"
number: 28
section: eboards
held: 2022-04-13
link: true
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [~10 min]
* Questions [~10 min]
* Lab [~60 min]

Administrivia
-------------

### Introductory notes

* Warning!  Friday the 13th falls on a Wednesday this month.
* My computer will remain broken for the near future.
    * Online meetings will be on my iPad
    * My efficiency will be compromised
    * There will be no recordings.  If that creates accessibility issues
      for you, please let me know and I'll figure something out for next
      week.
* Don't forget that we will have admitted students over the next 
  few weeks.  Be prepared to ask them questions and to answer their 
  questions.
* Note that we will not have a mentor session tonight since SoLA 3
  will be live.
* It appears that not everyone knows how to read the comments I make
  on your LAs (and readings, and labs).  We'll do a demo.
* Let me know if you have any questions on the grade sheets you
  received.  (General questions in a few minutes; individual questions
  via Teams DM, email, or in-person conversation.)

### Class mask policy

* We will continue to wear masks until at least the next course survey
  (that is, through Friday the 15th).

### Reminders

* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* Evening tutors are available 7--10 p.m. Sunday through Thursday as
  well as 3--5 p.m. on Sunday.
* Mentor sessions are generally Monday 8--9 p.m.  Wednesday, 8--9 p.m., 
  Sunday 4--5 p.m.

### Upcoming work

* Thursday, April 14, 10:30 p.m.: SoLA 3
    * Distributed Wednesday at 2:30 pm
    * Don't forget that there are sample questions on the LAs page.
* Thursday 10:30 p.m.: Today's lab
    * Today is "Sam says stop here"
* **No reading for Thursday**

### Upcoming Token-Generating Activities

* TODAY all day: Scarlett and Give Back Day
    * Token for donating.  (Equity: You can grab $5 from me to donate.)
        * Recommend: Food Pantry, Student Mental Health, Accessibility,
          Student group, ...
    * Token for participating in an activity.
* TODAY 8pm, Writers@Grinnell: Jerald Walker, 
  <https://grinnellcollege.zoom.us/j/85126108306>
* Thursday, April 14, 11am, Convocation: Kaushik Basu
* Friday, April 15, 2pm: Baseball vs. Monmouth
* Friday, APril 15, ?pm: Talk
* Saturday, April 16, 11:00 am, Baseball vs. Monmouth
* Saturday, April 16, 1:30 pm, Baseball vs. Monmouth

### Other Upcoming Activities

* Thursday April 21, 3:00 pm, Softball vs. Simpson
* Thursday April 21, 5:00 pm, Softball vs. Simpson
* Saturday, April 16, 9:00 am, Men's Tennis vs. Monmouth
* Saturday, April 16, 3:00 pm, Men's Tennis vs. Beloit

### Today's fun technology study 

_Or perhaps one of many._

* Let's consider a simplified model of the approximate architecture of 
  video chat applications, such as Webex.
* (See whiteboard.)
    * High level: There is a centralized network of video chat servers
      (for the particular application).  Each computer connects to that
      network via some Intereb infrastructure.  When you transmit
      something, the servers share it with each other and then send
      it to each machine.
    * Individual computer: The operating system OS on your computer 
      gather information from the camera and microphone.  The video chat
      application reads that information, processes it as appropriate,
      sends it back to the OS with instructions to send it to the network,
      and the OS does so.
* What do you expect to have happen when you click the "Mute" button?
* <https://uwmadison.app.box.com/v/popets2022-mutebutton> 
* Other cool things about this research ...

Questions
---------

### Racket questions

### Reading questions

_We're not going to use `match` today, so we'll take `match` questions
on Friday._

Why can't I use the following for nested emphasis?

```
(rex-concat (rex-string "<em>")
            (rex-repeat (rex-any-char))
            (rex-string "<em>")
            (rex-repeat (rex-any-char))
            (rex-string "</em>")
            (rex-repeat (rex-any-char))
            (rex-string "</em>"))
```

How would you solve the two Xpath problems?

> Write an expression that counts how many paragraphs in a document
contain an emphasis tag.

> `(length (sxpath-match "//p//em[1]" (string->xml str)))`

> Write an expression that counts how many paragraphs in a document contain 
mlitple emphasis tags. 

> `(length (sxpath-match "//p//em[2]" (string->xml str)))`

How do I find all of the Xpath patterns?

> Web searches!

> Official specs: <https://www.w3.org/TR/1999/REC-xpath-19991116/>

> I like this page from the W3schools Tutorial:
  <https://www.w3schools.com/xml/xpath_syntax.asp>

Why do I get two values back for the following?

```
> (sxpath-match "//p//em[1]" (string->xml "<p><em>Hello</em> <q>or <em>goodbye</em>, I <em>think</em></q></p>"))
'((em "Hello") (em "goodbye"))
```

> Because the `<em>goodbye</em>` is the first `<em>` within a `<q>` tag.

How do I deal with that?

> Um ... I'm not sure how to do it with Xpath.  I normally write my
  own procedures to process XML.  We'll leave that as an open problem.

Why do I get the strange result for this one?  Isn't `"goodbye"` the
second piece of emphasized text?

```
> (sxpath-match "//p//em[2]" (string->xml "<p><em>Hello</em> <q>or <em>goodbye</em>, I <em>think</em></q></p>"))
'((em "think"))
```

> Similar reasoning: The `<em>think</em>` is the second `<em>` section
  within the `<q>`.

Are there other implications of this?

> Sure.  Think how easy it was for us to make this mistake (or at least
  for me to make this mistake, even after 30 years programming).  What
  if we'd been looking for words to use in assessing someone's performance
  or whether or not they get a loan?

How do we avoid such issues?

> That's an open question.  

> Some things that help: Testing.  More eyes on what we do.  Different
  perspectives.

> And I still have copies of _Weapons of Math Destruction_ if you want
  to think more about the issue.

### Other issues

I realized that I'm missing a bunch of labs and reading responses.
Can I turn in "really late" labs and responses.

> Yes.  You must email them to me.  It costs two tokens for each really
  late lab or response.

Do I have to tell you when I'm spending tokens?

> Nope; I try to take them off automatically.  If I don't, treat it as
  a gift.

I've gone negative on tokens.  What happens if I'm still negative at
the end of the semester?

> Negative 1-5 tokens: Final grade drops by 1/3 letter.  Negative 6-10
  tokens: Final grade drops by 2/3 letter.  Negative 11-15: Final grade
  drops by 1 letter.  And so on and so forth.

Baseball games are long.  How long do I have to stay and watch?

> Thirty minutes.

Do you make up some of these questions?

> Yes.

Lab
---

### Preparation

* Have the normal start-of-lab discussion.
* Add a bunch more packages.

### During Lab

### Wrapup

* `; SAM SAID I CAN STOP HERE`
