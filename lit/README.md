This is a transcription of the Mizar system using Donald Knuth's WEB
system.

This assumes `WEAVE` is version 4.5; for earlier versions, you may
have to modify the Makefile.

# Build the documentation

**tl;dr**
To build the PDF, simply do the following:

```
~/Mizar-system/lit$ cd img
~/Mizar-system/lit/img$ make
...
~/Mizar-system/lit/img$ cd ..
~/Mizar-system/lit$ make
```

This will produce a 398 page PDF.

# Plans

**Short-term goal:** Right now, I am trying to transcribe the files
needed for the [esmprocessor.dpr](../base/esmprocessor.dpr) program. 

**Long-term goal:** A question lurking in the back of my mind is,
"What does the Mizar system do which is not covered in the
Mizar-in-rust program?" This forces me to study the source code of
Mizar to answer it.

WEB is overspecialized to the Pascal dialect used at Stanford in the
late 1970s, early 1980s, tailored to Knuth's idiosyncratic style of
programming (e.g., Knuth uses one giant file with a `program`,
variables are global, etc.). Consequently it does not adequately index
Object Pascal. If I do this seriously, I may need to hack Weave to
support the adjustments needed. (As it stands, I should add a script
to strip out common types like `integer` and `boolean` from the index...)

# Observations

There is a lot of code in Mizar, not all of it is used. Most of it is
surprisingly well coded.

# Progress

So far I have transcribed and annotated 5780 lines of code (there are
about 13870 lines of code left to be transcribed and annotated). These
are in 557 numbered "chunks" spanning 162 pages. At this rate, we
should expect an additional 389 pages in 1337 chunks for the remainder
of the code. So we should expect this document to be something like
551 pages for the transcription, and 48 pages for the index.

In short, just transcribing `esmprocessor.dpr` and the files needed
for it to compile would yield an approximately 600 page document.

There are 23662 lines of code in the `base` directory, which means
that 4012 lines of code in 6 files are not involved in the
`esmprocessor.dpr`.

This is not even considering the `kernel` directory, which contains
40244 lines of code in 54 files.