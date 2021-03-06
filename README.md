# What is this?

The point of this program is to generate random QSOs given a partial alphabet,
as would be useful when learning morse code with the Koch method.

Using functions from this program, we can generate random callsigns; word-level
similar texts; letter-level similar texts; texts that resemble the original,
but are created with a subset of the original alphabet; and random QSOs given a
partial alphabets.

This is my first Lisp program, so expect it to be horrible. I'd love to learn
the idioms of the language better. I had a lot a lot of fun learning Lisp so
far.

# Fun Things

Here are some fun things you can do with it. Open "qso-generate.rkt" and run
it. Then run some of these commands.

Generate new, 20-word long, text in the style of the included QSO corpus, using
a typical word-level Markov-chain (size 2).

```racket
(display (string-join (generate-similar-corpus 2 (string-split (file->string
"corpora/qso.txt") " ") 20) " "))
```

Generate new text in the style of three different texts using a typical
word-level Markov-chain (size 2).

```racket
(display (string-join (generate-similar-corpus 2 (string-split (string-append
(file->string "corpora/navy-seal-copypasta.txt") (file->string
"corpora/dont-copy-that-floppy.txt") (file->string "corpora/bel-air.txt")) " ")
200) " "))
```

Generate a line that is similar to any line from a text file, but without using
the letter E or e, using hierarchical Markov chains.

```racket
(display (generate-random-text
 (build-hierarchical-markov-chain-from-file "corpora/king-lear.txt")
 '(#\A #\B #\C #\D #\F #\G #\H #\I #\J #\K #\L #\M #\N #\O #\P #\Q #\R #\S #\T
 #\U #\V #\W #\X #\Y #\Z #\a #\b #\c #\d #\f #\g #\h #\i #\j #\k #\l #\m #\n
 #\o #\p #\q #\r #\s #\t #\u #\v #\w #\x #\y #\z #\. #\, #\' #\; #\? #\!
 #\space)
 200
 ))
```

Aside from all those other fun things, here's the main point of this program.
Generate a random QSO-like message with a few differently sized alphabets. The
alphabets are in N1IRZ's learning order.

```racket
(display (generate-random-qso '(#\K #\M)))
```

```racket
(display (generate-random-qso '(#\K #\M #\R #\S #\U #\A #\P #\T #\L #\O)))
```

```racket
(display (generate-random-qso '(#\K #\M #\R #\S #\U #\A #\P #\T #\L #\O #\W #\I
#\. #\N #\J #\E #\F #\0 #\Y #\V)))
```

```racket
(display (generate-random-qso '(#\K #\M #\R #\S #\U #\A #\P #\T #\L #\O #\W #\I
#\. #\N #\J #\E #\F #\0 #\Y #\V #\, #\G #\5 #\/ #\Q #\9 #\Z #\H #\3 #\8)))
```

```racket
(display (generate-random-qso '(#\K #\M #\R #\S #\U #\A #\P #\T #\L #\O #\W #\I
#\. #\N #\J #\E #\F #\0 #\Y #\V #\, #\G #\5 #\/ #\Q #\9 #\Z #\H #\3 #\8 #\B #\?
#\4 #\2 #\7 #\C #\1 #\D #\6 #\X)))
```

```racket
(display (generate-random-qso '(#\K #\M #\R #\S #\U #\A #\P #\T #\L #\O #\W #\I
#\. #\N #\J #\E #\F #\0 #\Y #\V #\, #\G #\5 #\/ #\Q #\9 #\Z #\H #\3 #\8 #\B #\?
#\4 #\2 #\7 #\C #\1 #\D #\6 #\X #\# #\@ #\! #\$)))
```

# Thanks

Thanks to Lisp In Summer Projects of the LispNYC for getting me off my butt and
finally taking the time to learn a Lispy language.

A special thanks goes out to Dave Finley, N1IRZ, for the QSO corpus and for
helping me to learn morse code.
