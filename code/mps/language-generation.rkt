#lang racket

(require csc151)
(require csc151/rex)
(require rackunit)

;; CSC 151 (SEMESTER)
;; Mini-Project 5: Language Generation
;; Author: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

; +---------------+--------------------------------------------------
; | Provided code |
; +---------------+

;;; (random-list-element lst) -> any?
;;;   lst : list? (nonempty)
;;; Randomly select an element of `lst`
(define random-list-element
  (lambda (lst)
    (list-ref lst (random (length lst)))))

;;; (list-of-strings? val) -> boolean?
;;;   val : any?
;;; Determines if val is a list of strings.
(define list-of-strings?
  (lambda (val)
    (and (list? val)
         (andmap string? val))))

;;; (split-string str) -> listof string?
;;;   str : string?
;;; Split a string into a list of alternating "words" and "separators".
(define split-string
  (let* ([word-chars "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-'"]
         [word (rex-repeat (rex-char-set word-chars))]
         [separator (rex-repeat (rex-char-antiset word-chars))])
    (lambda (str)
      (rex-find-matches (rex-any-of word separator) str))))

;;; (syllex? val) -> boolean?
;;;   val : any?
;;; Determines if val appears to represent a syllex.
(define syllex?
  (lambda (val)
    (and (list? val)                     ; A list
         (andmap (list-of-strings? val)) ; Containing only lists of strings
         (not (null? val))               ; At least one element
         (not (null? (cdr val)))         ; At least two elements
         (not (null? (cadr val))))))     ; With one-syllable words

;;; csc151-syllex : syllex?
;;; Words related to csc151.  Note that this syllex includes a
;;; "blank entry" for six-syllable words.
(define csc151-syllex
  (list
   ; 0
   (list)
   ; 1
   (list "cons" "car" "list" "pair" "Scheme" "sort" "match" "string"
         "lab" "map" "fold" "test")
   ; 2
   (list "cadr" "cdr" "Racket" "jelly" "sandwich" "syllex"
         "image" "recurse" "eboard" "data" "compose" "lambda" "section"
         "SoLA" "MP")
   ; 3
   (list "recursion" "computer" "digital" "confusing" "programming"
         "CSC" "abstraction" "decompose" "document" "abstraction"
         "boolean" "binary")
   ; 4
   (list "humanities" "exponential" "collaborate" "one-fifty-one"
         "algorithm" "DrRacket" "dictionary" "generalize" "defenestrate")
   ; 5
   (list "collaborative" "experiential" "decomposition" "generality"
         "defenestration")
   ; 6
   (list)
   ; 7
   (list "triskaidekaphobia")))

;;; grinnell-syllex : syllex?
;;; Words related to Grinnell College.
(define grinnell-syllex
  (list
   ; 0
   (list)
   ; 1
   (list "Mears" "Noyce" "husk" "train" "corn" "black" "HSSC")
   ; 2
   (list "self-gov" "Stonewall" "The Bear" "first-year" "scarlet"
         "remote" "Webex" "prairie" "need-blind" "soybeans" "Hopkins"
         "Younker" "Dibble" "cluster" "scurry" "Gremlin")
   ; 3
   (list "liberal" "JRC" "CLS" "advisor" "FYE" "laurel leaf" "Honor G"
         "ARH" "North Campus" "Iowa" "semester" "Women's quad"
         "Grinnellian" "pie-on-ears")
   ; 4
   (list "curriculum" "Mary B. James" "Tutorial" "Green alien"
         "convocation" "education")
   ; 5
   (list "exploratory")
   ; 6
   (list "Congregationalist")))

;;; number-syllex : syllex?
;;; A syllex of numbers, intended primarily for testing how well
;;; `phrase` works when there are gaps in the syllex.
(define number-syllex
  (list
   (list)
   (list "one" "two" "three" "four" "five" "six" "eight" "nine" "ten"
         "twelve")
   (list "seven" "thirteen" "fourteen" "fifteen" "sixteen" "eighteen"
         "nineteen" "twenty")
   (list "eleven" "seventeen" "twenty-one")
   (list)
   (list)
   (list "seventy-seven thousand")
   (list)))

;;; test-syllex : syllex? (more or less)
;;; A fake syllex, used only for testing that `syllables` givs the
;;; right number of syllables.  (string->number x) should give the
;;; claimed number of syllables for x.  See `phrase-syllables` for 
;;; more details (implicit).
(define test-syllex
  (list
   (list)
   (list "1" "01" "0001" "00001" "1+0i")
   (list "2" "02" "0002" "00002" "2+0i")
   (list "3" "03")
   (list "4" "04" "004")
   (list "5" "05")
   (list "6")
   (list "007")
   (list "8")
   (list "9")))
 
;;; test-syllex-with-gaps : syllex? (more or less)
;;; Another fake syllex for testing.
(define test-syllex-with-gaps
  (list
   (list)
   (list "1" "01" "0001" "00001" "1+0i")
   (list "2" "02" "0002" "00002" "2+0i")
   (list "3" "03")
   (list)
   (list "5" "05")
   (list)
   (list)
   (list "8")
   (list)))
 
;;; (phrase-syllables-test phrase) -> integer?
;;;   phrase : string? (given by (phrase n test-syllex))
;;; Determine how many syllables are in a phrase generated
;;; from test-syllex or test-syllex-with-gaps.
(define phrase-syllables
  (lambda (phrase)
    (apply + (map string->number (string-split phrase)))))

; +----------------------------+-------------------------------------
; | Part one: Generating Haiku |
; +----------------------------+

; a.

;;; (phrase n syllex) -> 
;;;   n :
;;;   syllex :
;;;
(define phrase
  ???)

; b.

#|
Experiments

|#

; c. 

;;; (haiku syllex) ->
;;;   syllex :
;;;
(define haiku
  ???)

; d.

;;; my-syllex : syllex?
;;; A new syllex.
(define my-syllex
  ???)

#|
Examples

|#

; +----------------------------------+-------------------------------
; | Part two: Randomized replacement |
; +----------------------------------+

; Tests taht end "(SR)" are by SamR

; a. 

;;; (randomly-replace old new lst) ->
(define randomly-replace
  ???)

#|
(test-equal? "randomly-replace/1 (SR)"
             (randomly-replace 'a 'b '(a b a c d))
             '(b b b c d))
|#

; b.

; (randomly-replace-consistently val options lst) -> 
(define randomly-replace-consistently
  ???)


#|
; This first test only gives one option, so the result is predictable
(test-equal? "randomly-replace-consistently/1 (SR)"
             (randomly-replace-consistently 'a '(x) '(a b a c d))
             '(x b x c d))

; We run the next test multiple times to increase the odds of catching an error.
(test-true "randomly-replace-consistently/2a (SR)"
           (member? (randomly-replace-consistently 'a '(x y) '(a a))
                    '((x x) (y y))))
(test-true "randomly-replace-consistently/2b (SR)"
           (member? (randomly-replace-consistently 'a '(x y) '(a a))
                    '((x x) (y y))))
(test-true "randomly-replace-consistently/2c (SR)"
           (member? (randomly-replace-consistently 'a '(x y) '(a a))
                    '((x x) (y y))))
|#

; c.

; (randomly-replace-variably val options lst) -> 
(define randomly-replace-variably
  ???)

#|
; This first test only gives one option, so the result is predictable
(test-equal? "randomly-replace-variably/1 (SR)"
             (randomly-replace-variably 'a '(x) '(a b a c d))
             '(x b x c d))

; We run the next test multiple times to increase the odds of catching an error.
(test-true "randomly-replace-variably/2a (SR)"
           (member? (randomly-replace-variably 'a '(x y) '(a a))
                    '((x x) (x y) (y x) (y y))))
(test-true "randomly-replace-variably/2b (SR)"
           (member? (randomly-replace-variably 'a '(x y) '(a a))
                    '((x x) (x y) (y x) (y y))))
(test-true "randomly-replace-variably/2c (SR)"
           (member? (randomly-replace-variably 'a '(x y) '(a a))
                    '((x x) (x y) (y x) (y y))))

; We are unlikely to choose the same replacement 100 times
(test-false "randomly-replace-variably/3 (SR)"
            (let ([result (randomly-replace-variably 'a '(b c d e f g) (make-list 100 'a))])
              (= 100 (tally-value result (car result)))))
|#

; +---------------------------------+--------------------------------
; | Part three: Slightly angry libs |
; +---------------------------------+

;i a.

;;;
(define replace-characters
  ???)

; b.

;;;
(define replace-words
  ???)

; c.

;;;
(define maddish-libs
  ???)

; d.

#|
Example one


|#

#|
Example two


|#

; +----------------------------+-------------------------------------
; | Part four: Syllabification |
; +----------------------------+

; a.

(define syllables
  ???)

; b.

#|
Examples

|#

; c.

; Nothing to submit.

; d.

(define jane-eyre-syllex
  ???)

; e.

#|
Examples

|#
