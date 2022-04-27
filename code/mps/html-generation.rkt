#lang racket
(require csc151)
(require csc151www)

;;; html-generation.rkt
;;; Samuel A. Rebelsky
;;; A sample solution to the HTML generation MP (I hope).
;;; Acknowledgements:
;;; * random-list-element probably comes from the reading on randomness.

;;; (build-page data template result) -> void?
;;;   data : string? (names a file)
;;;   template : string? (names a file)
;;;   result : string? (names a file)
;;; Build a new page by filling in template with data from data.
(define build-page
  (lambda (data template result)
    (xml->file (build-xml (file->xml data)
                          (file->xml template))
               result)))

;;; (build-xml data template) -> sxml?
;;;    data : sxml?
;;;    template : sxml?
;;; Build a new Web page by filling in template with data.
(define build-xml
  (lambda (data template)
    (replace-random-tags data
                         (replace-element-tags data template))))

;;; (replace-random-tags data template) -> sxml?
;;;   data : sxml?
;;;   template : sxml?
;;; Replace all of the <random ...> tags in the template
;;; with corresponding information from data.
(define replace-random-tags
  (lambda (data template)
    template))

;;; (replace-element-tags data template) -> sxml?
;;;   data : sxml?
;;;   template : sxml?
;;; Replace all of the <element ...> tags in the template
;;; with corresponding information from data.
(define replace-element-tags
  (lambda (data template)
    (sxpath-replace "//element"
                    template
                    (lambda (element)
                      "???"))))

;;; (element-id element) -> string? or false?
;;;   element : sxml?
;;; Extracts the id from element.  If there is no id, returns false.
(define element-id
  (lambda (element)
    "prof"))

;;; (element-class element) -> string? or false?
;;;    element : sxml?
;;; Extracts the class attribute from element.  If there is no such
;;; attribute, returns false.
(define element-class
  (lambda (element)
    "name"))

;;; (element-field element) -> string? or false?
;;;   element : sxml?
;;; Extracts the field attribute from element.  If there is no such
;;; attribute, returns false.
(define element-field
  (lambda (element)
    "nickname"))

;;; (elements-with-tag data tag) -> listof sxml?
;;;   data : sxml?
;;;   tag : string?
;;; Extract all of the elements with the given tag.
(define elements-with-tag
  (lambda (data tag)
    '()))

;;; (elements-with-class data class) -> listof sxml?
;;;   data : sxml?
;;;   tag : string?
;;; Extract all of the elements with the given class.
(define elements-with-class
  (lambda (data class)
    '()))

;;; (element-with-id data id) -> sxml? or false?
;;;   data : sxml?
;;;   id : string?
;;; Extract the element with the given id.  If there
;;; is no such element, returns false.
(define element-with-id
  (lambda (data id)
    #f))

;;; (replacement data element) -> sxml?
;;;    data : sxml?
;;;    element : sxml?
;;; Find a replacement for element, which has the form
;;; `'(element (@ (id "ID") @(field "FIELD")))` or
;;; `'(element (@ (id "ID")))`.  If it can't find an appropriate
;;; replacement, returns "???".
(define replacement
  (lambda (data element)
    "???"))

;;; (random-replacement data element) -> sxml?
;;;   data : sxml?
;;;   element : sxml?
;;; Find a replacement for element, which has a form something like
;;; `'(random (@ (class "CLASS") (tag "TAG") (field "FIELD")))`.  If
;;; not such element can be found, returns "???".
(define random-replacement
  (lambda (data element)
    "???"))

;;; (random-list-element lst) -> any?
;;;    lst : list? (nonempty)
;;; Randomly select an element of `lst`.
(define random-list-element
  (lambda (lst)
    (list-ref lst (random (length lst)))))

;;; (sxml-contents xml) -> listof sxml?
;;;   xml : sxml? (list, not string)
;;; Find the contents of an xml tag.
(define sxml-contents
  (lambda (xml)
    (if (null? (cdr xml))
        '()
        (if (and (pair? (cadr xml)) (equal? (caadr xml) '@))
            (cddr xml)
            (cdr xml)))))

; +-------------+----------------------------------------------------
; | Sample Data |
; +-------------+

(define sample-data
  (string->xml "
    <data>
      <name id=\"prof\" class=\"professor\"><first>Samuel</first> <middle>Alexander</middle> <last>Rebelsky</last> <nickname>SamR</nickname></name>
      <name id=\"river\" class=\"mentor\"><first>River</first> <middle>B</middle> <last>Lake</last> <nickname>River</nickname></name>
      <name id=\"elle\" class=\"mentor\"><first>Lindsey</first> <middle>L</middle> <last>Lasty</last> <nickname>Elle</nickname></name>
      <topic id=\"recursion\" class=\"fun\">Recursion</topic>
      <topic id=\"vectors\" class=\"mutable\">Vectors</topic>
    </data>"))
   
(define sample-template
  (string->xml "
    <p>I\'m taking CSC-151 from Professor <element id=\"prof\" field=\"last\"/>.
    Our mentors are <element id=\"elle\" field=\"nickname\"/> and
    <element id=\"river\" field=\"nickname\"/>.
    When <element id=\"prof\" field=\"nickname\"/>'s presentation of
    <random tag=\"topic\"/> is too confusing, I go to 
    <random class=\"mentor\" field=\"nickname\"/> for help.</p>"))

;;; (make-files!) -> void?
;;; Create sample-data.xml and sample-template.xml
(define make-files!
  (lambda ()
    (xml->file sample-data "sample-data.xml")
    (xml->file sample-template "sample-template.xml")))

;;; (experiment!) -> void?
