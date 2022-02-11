---
title: "EBoard 09 (Section 1): Lists, Continued"
number: 9
section: eboards
held: 2022-02-14
link: false
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [~10 min]
* Questions [?? min]
* Discussion [Approximately 60 min]

Administrivia
-------------

### Reminders

* Please say your name when you ask or answer a question (even if I've
  just called you by name).
* Evening tutors are available 7--10 p.m. Sunday through Thursday as
  well as 3--5 p.m. on Sunday.
* Mentor sessions are Wednesday, 8--9 p.m., Sunday 4--5 p.m., Monday 8--9 p.m.
    * No Mentor Session next Wednesday (SoLA 1)

### Introductory notes

### Racket notes

Here's one version of the code from last lab.

```
(define string->integer
  (lambda (str)
    (apply +
           (map *
                (string->digits str)
                (reverse (map (section expt 10 <>) 
                              (range (string-length str))))))))
```

People who have programmed before tend to want to use `string-ref`
or `list-ref` and try to deal with the characters individually.  One
nice things about Scheme (and most functional languages) is that you can
process the digits _en masse_.

### Upcoming work

* Readings for Wednesday due Tuesday at 10:00 p.m.
* Lab writeup from today due Tuesday at 10:30 p.m.
    * Let's hope we can finish in class today.
* SoLA 1 to be released next Wednesday at 2:30 p.m.  Due Thursday
  at 10:30 p.m.
* Quiz 4 Friday: Style
* Mini-Project 1 redo due Sunday the 20th at 10:30 p.m. (sooner is better)
* Mini-Project 2 redo due Sunday the 20th at 10:30 p.m. (sooner is better)

### Upcoming Token-Generating Activities

* Mentor sessions.
* CS Study Break, Tuesday, 8:30pm, CS Commons.
* Visit the current exhibit in the Grinnell Art Museum.  (At least 15 min.)

### Other Upcoming Activities

* Neuroscience Journal Club, Thursday, February 17, Noon, Noyce 2517.

Being more efficient
--------------------

### In readings

### In mini-projects

Questions
---------

### From the readings

### Other questions

Lab
---

### Preliminaries

* There should only be four exercises on today's lab.  If you see five
  exercises, you have an old version.  Please reload.
* I have a list of helpful procedures on the eboard (and on the screen,
  unless the screen saver starts).

### During Lab

* Some helpful procedures for exercise 3
    * `map` - Do something to each element in a list
    * `expt` - You should know this
    * `char->integer` - Get the collating sequence number
    * `string->list` - Convert a string to a list of its component chars
    * `reverse` - Give a list in the opposite order
* Other notes
    * Here's "the three-parameter `map`".
      `(map * '(2 3 4) '(5 6 7))` -> `'(10 18 28)`

### Wrapup

* If you got through exercise 3, write the following after exercise 3
  and submit.  Then glance at exercise 4.

        ; SAM SAID WE COULD STOP HERE

* If you did not get through exercise 3, plan to meet with your partner
  to finish exercise 3 (and, optionally, exercise 4).
