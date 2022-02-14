---
title: Text and text files
summary: |
  We consider some basic mechanisms for working with files that contain
  unformatted text.
prereqs: |
  [An abbreviated introduction to Racket]({{ "/readings/racket-intro.html" | relative_url }}).
  [Characters and strings]({{ "/readings/strings.html" | relative_url }}).
  [List basics]({{ "/readings/list-basics.html" | relative_url }}).
---
As you likely know from your experience with computers, when we want to keep information on the computer for reuse, we store it in what we usually refer to as a *file*.
There are many different kinds of files.
Some files store images (in many different possible formats).
Some files store formatted text.
Some store data.
Some store what we often refer to as "plain text", text without additional markup or formatting information.

As you might expect, digital humanists often work with both formatted and unformatted text files.
However, they also work with a wide variety of other kinds of files, including images (there's interesting work on the use of broadsides) and geographic data.
Because text-processing algorithms are often more straightforward than image-processing algorithms, in this course we will primarily focus on text-processing algorithms.
However, we will touch upon some other kinds of humanistic data and algorithms later in the semester.

It is often much easier to work with formatted text.
However, creating formatted text is often a labor-intensive process.
Formatting also introduces some additional complexities.
Hence, in many situations, plain (unstructured) text is a more appropriate tool for storing data.

Computer scientists and digital humanists work with text files in a variety of ways.
They might, for example, search for particular words or attempt to rewrite the text in a file into a new form or a new language.
They might look for some statistical properties of the text to try to gain some insight.
We will consider similar issues.

## Reading from plain text files

We will focus on four basic operations for working with text files, some of which are provided as part of Racket and some of which are provided as part of the `csc151` package.

* `file->chars`, which reads the contents of a text file and presents the contents as a list of characters; 
* `file->words`, which reads the contents of a text file and presents the contents as a list of strings, each of which represents one "word" in the file (using a simple metric for "word");
* `file->lines`, which reads the contents of a text file and presents the contents as a list of strings, each of which represents one line of the input file; and
* `file->string`, which reads the contents of a text file and presents the contents as a single string.  

Suppose we had the previous paragraph in [a file called `sample.txt`](../files/sample.txt), and had stored the paragraph in the not-quite-plain-text we tend to use.
Here's what we might get reading it each way.

```drracket
> (take (file->chars "sample.txt") 20)
'(#\C #\o #\m #\p #\u #\t #\e #\r #\space #\s #\c #\i #\e #\n #\t #\i #\s #\t #\s #\space)
>  (take (file->words "sample.txt") 10)
'("Computer" "scientists" "and" "digital" "humanists" "work" "with" "text" "files" "in")
> (take (file->lines "sample.txt") 3)
'("Computer scientists and digital humanists work with text files in"
  "a variety of ways.  They might, for example, search for particular"
  "words or attempt to rewrite the text in a file into a new form or")
> (substring (file->string "sample.txt") 20 120)
"and digital humanists work with text files in\na variety of ways.  They might, for example, search fo"
```

*Note*: These instructions will only work if `sample.txt` is saved in the same directory as your Racket file.

## Writing to plain text files

At times, we'll want to save the text we create to a file.
The `csc151` package currently provides only one procedure for writing text to a file: `(string->file str fname)` writes the given string to the named file.

```drracket
> (file->string "example.txt")
Error! . . ../../Applications/Racket v7.1/collects/racket/private/kw.rkt:1279:57: open-input-file: cannot open input file
Error!   path: example.txt
Error!   system error: No such file or directory; errno=2
> (string->file "This is an example.\n" "example.txt")
> (file->string "example.txt")
"This is an example.\n"
```

*Warning!* The `string->file` procedure will overwrite an existing file, completely eliminating any previous content.

```drracket
> (take (file->lines "exam1.txt") 3)
'("Exam 1" "Random J. Student" "Time required: 10 hours")
> (string->file "I am the 1337 h4x0r. Phear me!" "exam1.txt")
> (file->string "exam1.txt")
"I am the 1337 h4x0r. Phear me!\n"
```

## Naming files

Racket is surprisingly clueless about finding files.
We might say "It's right *there*."
But *there* is not clear to the computer.
For the purposes of this course, we will store files in the same directory as the Racket program.
If you want to try other approaches, please discuss the particulars with the lab staff.

## Self checks

### Check 1: Ways of reading files (‡)

Suppose [the file `scene.txt`](../files/scene.txt) contains the following lines.

```text
Prof: Student, how are you today?
Student: Please don't address me in the generic.
Prof: Stu, how are you today?
Student: I'm pretty well.  Thanks for asking.
```

What output do you expect to get if you call `file->chars`, `file->words`,
`file->lines`, and `file->string` on that file?

Keep in mind that you'll need to `(require csc151)` to call these file-reading functions.
