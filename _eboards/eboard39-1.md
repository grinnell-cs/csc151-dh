---
title: "EBoard 39 (Section 1): Sorting algorithms"
number: 39
section: eboards
held: 2022-05-11
link: true
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [~20 min]
* Questions [~10 min]
* Lab [~50 min]

Administrivia
-------------

### Introductory notes

* Goodbye to those of you who will not be here on Friday.  We will miss you.
    * Get notes from your classmates. 
    * Identify someone to pick up Friday handouts for you.
    * Fill out the EOCE after class on Friday.
* We have a variety of things to do on Friday.  I hope everyone who can make
  it to class will make it.

### Reminders

* We will continue to wear masks until the end of the semester.  
* Please say your name when you ask or answer a question (even if I've
  just called you by name).  Say your partner's name, too!
* Evening tutors are available 7--10 p.m. Sunday through Thursday as
  well as 3--5 p.m. on Sunday.
* Our final mentor session is Monday at 8pm.

### Upcoming work

* Thursday, May 12, 10:30 p.m.: SoLA 4
    * Released 2:30 p.m. TODAY
    * NOT our last SoLA
    * However, SoLA 5 is optional

### Upcoming Token-Generating Activities

* Mentor session Monday of Finals Week (8pm)

### Other Upcoming Activities

Lab notes
---------

### Binary Search

Binary search is not constant time, but it's also much faster than a
linear search.

Suppose we had 1000 elements to look at

* 1000 -> 500 -> 250 -> 125 -> 62 -> 31 -> 15 -> 7 -> 3 -> 1 -> 0
* Ten calls for a failed search

Suppose we had 1,000,000 elements to look at

* 1,000,000 -> 500,000 -> 250,000 -> 125,000 -> 62,500 ->
  31,250 -> 16,000 -> 8,000 -> 4,000 -> 2,000 -> 1,000 -> ten more steps
* Twenty calls for a failed search

### Alphabetically first

```
;;; (alphabetically-first string) -> string
;;;   strings: both (listof string?) nonempty?
;;; Find the alphabetically first string in the list.
(define alphabetically-first-1
  (lambda (strings)
    (cond
      [(null? (cdr strings))
       (car strings)]
      [(string-ci<=? (car strings) (alphabetically-first-1 (cdr strings)))
       (car strings)]
      [else
       (alphabetically-first-1 (cdr strings))])))

(define alphabetically-first-2
  (lambda (strings)
    (counter-increment! AFC 'alphabetically-first-2)
    (if (null? (cdr strings))
        (car strings)
        (first-of-two (car strings)
                      (alphabetically-first-2 (cdr strings))))))

;;; (first-of-two str1 str2) -> string?
;;;   str1 : string?
;;;   str2 : string?
;;; Find the alphabetically first of str1 and str2.
(define first-of-two
  (lambda (str1 str2)
    (if (string-ci<=? str1 str2)
        str1
        str2)))
```

_TPS_

`alphabetically-first-1` behaves surprisingly badly (that is, makes way
too make recursive calls) on some inputs.

Which inputs?

Why does it make so many recursive calls?

### Reversing

```
;;; (list-append l1 l2) -> list?
;;;   l1, l2 : list?
;;; Returns the list formed by placing the elements of l2 after the elements
;;; of l1, preserving the order of the elements of l1 and l2.
(define list-append
  (lambda (l1 l2)
    (cond
      [(null? l1)
       l2]
      [else
       (cons (car l1)
             (list-append (cdr l1) l2))])))

;;; (list-reverse l) -> list?
;;;   l : list?
;;; Returns l with the elements in the opposite order.
(define list-reverse-1
  (lambda (l)
    (match l
      ['()
       null]
      [(cons x tail)
       (list-append (list-reverse-1 tail) (list x))])))

(define list-reverse-2
  (lambda (l)
    (letrec ([helper
              (lambda (l so-far)
                (match l
                  ['() 
                   so-far]
                  [(cons x tail)
                   (helper tail (cons x so-far))]))])
      (helper l null))))
```

Sorting
-------
