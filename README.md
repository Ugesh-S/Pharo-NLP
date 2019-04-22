**# Pharo-NLP**

Pharo NLP is Under Development.
Initially started with basic NLP preprocessing functions such as Stop words removal, vocabulary generation, bag of words etc. this library is being continuously developed to include all the NLP functions as in the NLTK and spaCy Libraries built for Python.

You can Clone this repository from your Pharo IDE and begin to use it. 
Optimizations, New functions, classes and improvements are highly appreciated.

Here are few Usage examples for Each of the Functions,

**Stop Words Removal :**


```
nobj := NLP new.

"Creating an Object of NLP class"

text := #('Pharo is a pure object oriented programming language and a powerful environment focused on simplicity and immediate feedback' 'The Pharo environment includes a debugger unlike anything you''ve seen before. It allows you to step through code, restart the execution of methods, create methods on the fly, and much more').

"Array containing the Dataset of Texts, Paragraphs or Sentences"

h := nobj StopWords: text.

"Calling StopWords with argument text"

Transcript show: h.

"Displays the ouput as an array in the Transcript window"
```

**The output in the Transcript window**

```
#('pharo pure object oriented programming language powerful environment focused simplicity immediate feedback' 'pharo environment includes debugger unlike anything seen before. allows step code, restart execution methods, create methods fly, much')
```





**Vocabulary Building:**

```
nobj := NLP new.

"Creating an Object of NLP class"

text := #('Pharo is a pure object oriented programming language and a powerful environment focused on simplicity and immediate feedback' 'The Pharo environment includes a debugger unlike anything you''ve seen before. It allows you to step through code, restart the execution of methods, create methods on the fly, and much more').

"Array containing the Dataset of Texts, Paragraphs or Sentences"

h := nobj VocabBuild: text.

"Calling Vocabulary Building with argument text"

Transcript show: h.
```

**Output :**

```
#('allows' 'anything' 'before.' 'code,' 'create' 'debugger' 'environment' 'execution' 'feedback' 'fly,' 'focused' 'immediate' 'includes' 'language' 'methods' 'methods,' 'much' 'object' 'oriented' 'pharo' 'powerful' 'programming' 'pure' 'restart' 'seen' 'simplicity' 'step' 'unlike')
```


**Bag of Words Feature Generation:**

```
nobj := NLP new.

"Creating an Object of NLP class"

text := #('Pharo is a pure object oriented programming language and a powerful environment focused on simplicity and immediate feedback' 'The Pharo environment includes a debugger unlike anything you''ve seen before. It allows you to step through code, restart the execution of methods, create methods on the fly, and much more' 'Keeping the syntax simple makes learning simple and also the work simple').

"Array containing the Dataset of Texts, Paragraphs or Sentences"

h := nobj BagOfWords: text.

"Calling Bag Of Words Generator with text"

Transcript show:h.
```

**Output for the Below Vocabulary:**

```
#('allows' 'also' 'anything' 'before.' 'code,' 'create' 'debugger' 'environment' 'execution' 'feedback' 'fly,' 'focused' 'immediate' 'includes' 'keeping' 'language' 'learning' 'makes' 'methods' 'methods,' 'much' 'object' 'oriented' 'pharo' 'powerful' 'programming' 'pure' 'restart' 'seen' 'simple' 'simplicity' 'step' 'syntax' 'unlike' 'work')
```

```
an OrderedCollection(#(0 0 0 0 0 0 0 1 0 1 0 1 1 0 0 1 0 0 0 0 0 1 1 1 1 1 1 0 0 0 1 0 0 0 0)
                     #(1 0 1 1 1 1 1 1 1 0 1 0 0 1 0 0 0 0 1 1 1 0 0 1 0 0 0 1 1 0 0 1 0 1 0)
                     #(0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 1 0 0 0 0 0 0 0 0 0 0 0 3 0 0 1 0 1)) 
```


**TF-IDF Vectorization Feature Generation**

```
nobj := NLP new.

"Creating an Object of NLP class"

text := #('Pharo is a pure object oriented programming language and a powerful environment focused on simplicity and immediate feedback' 'The Pharo environment includes a debugger unlike anything you''ve seen before. It allows you to step through code, restart the execution of methods, create methods on the fly, and much more' 'Keeping the syntax simple makes learning simple and also the work simple').

"Array containing the Dataset of Texts, Paragraphs or Sentences"

h := nobj TfIdf: text.

"Calling TF-IDF feature Generation on Text"

Transcript show:h.
```

**Output for the Below Vocabulary:**

```
#('allows' 'also' 'anything' 'before.' 'code,' 'create' 'debugger' 'environment' 'execution' 'feedback' 'fly,' 'focused' 'immediate' 'includes' 'keeping' 'language' 'learning' 'makes' 'methods' 'methods,' 'much' 'object' 'oriented' 'pharo' 'powerful' 'programming' 'pure' 'restart' 'seen' 'simple' 'simplicity' 'step' 'syntax' 'unlike' 'work') 
```


```
an OrderedCollection(
an OrderedCollection(0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.033788759009013694 0.0 0.0915510240556758 0.0 0.0915510240556758 0.0915510240556758 0.0 0.0 0.0915510240556758 0.0 0.0 0.0 0.0 0.0 0.0915510240556758 0.0915510240556758 0.033788759009013694 0.0915510240556758 0.0915510240556758 0.0915510240556758 0.0 0.0 0.0 0.0915510240556758 0.0 0.0 0.0 0.0) 
an OrderedCollection(0.06103401603711721 0.0 0.06103401603711721 0.06103401603711721 0.06103401603711721 0.06103401603711721 0.06103401603711721 0.022525839339342466 0.06103401603711721 0.0 0.06103401603711721 0.0 0.0 0.06103401603711721 0.0 0.0 0.0 0.0 0.06103401603711721 0.06103401603711721 0.06103401603711721 0.0 0.0 0.022525839339342466 0.0 0.0 0.0 0.06103401603711721 0.06103401603711721 0.0 0.0 0.06103401603711721 0.0 0.06103401603711721 0.0) 
an OrderedCollection(0.0 0.12206803207423442 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.12206803207423442 0.0 0.12206803207423442 0.12206803207423442 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.3662040962227032 0.0 0.0 0.12206803207423442 0.0 0.12206803207423442) )
```

**Leveshtein Distance Function:** "for finding distance between two strings (also Hamming Distance)"

```
nobj := NLP new.

"Creating an Object of NLP class"

dst := nobj EditDistBetween:'Test' and:'text'.

"Calculating distance between the words test and text"

"Can replace EditDistBetween with HammingDistBetween (for hamming distance - faster than Levenshtein but can be used only with strings of equal length"

Transcript show: dst.
```

**Output:**
```
1

```

**N-Gram Feature Generation:**

```
nobj := NLP new.

"Creating an Object of NLP class"

text := #('Pharo is a pure object oriented programming language and a powerful environment focused on simplicity and immediate feedback' 'The Pharo environment includes a debugger unlike anything you''ve seen before. It allows you to step through code, restart the execution of methods, create methods on the fly, and much more' 'Keeping the syntax simple makes learning simple and also the work simple').

"Array containing the Dataset of Texts, Paragraphs or Sentences"

gram := nobj NgramFor: text Nsize: 3.

Transcript show:gram.

```

**Output:**

```
an OrderedCollection(

an OrderedCollection(
an OrderedCollection('pharo' 'pure' 'object')
an OrderedCollection('pure' 'object' 'oriented') 
an OrderedCollection('object' 'oriented' 'programming') 
an OrderedCollection('oriented' 'programming' 'language')
an OrderedCollection('programming' 'language' 'powerful') 
an OrderedCollection('language' 'powerful' 'environment')
an OrderedCollection('powerful' 'environment' 'focused')
an OrderedCollection('environment' 'focused' 'simplicity') 
an OrderedCollection('focused' 'simplicity' 'immediate')
an OrderedCollection('simplicity' 'immediate' 'feedback')
)

an OrderedCollection(

an OrderedCollection('pharo' 'environment' 'includes')
an OrderedCollection('environment' 'includes' 'debugger') 
an OrderedCollection('includes' 'debugger' 'unlike')
an OrderedCollection('debugger' 'unlike' 'anything') 
an OrderedCollection('unlike' 'anything' 'seen') 
an OrderedCollection('anything' 'seen' 'before.')
an OrderedCollection('seen' 'before.' 'allows')
an OrderedCollection('before.' 'allows' 'step') 
an OrderedCollection('allows' 'step' 'code,') 
an OrderedCollection('step' 'code,' 'restart') 
an OrderedCollection('code,' 'restart' 'execution') 
an OrderedCollection('restart' 'execution' 'methods,') 
an OrderedCollection('execution' 'methods,' 'create') 
an OrderedCollection('methods,' 'create' 'methods')
an OrderedCollection('create' 'methods' 'fly,')
an OrderedCollection('methods' 'fly,' 'much')
)

an OrderedCollection(

an OrderedCollection('keeping' 'syntax' 'simple')
an OrderedCollection('syntax' 'simple' 'makes')
an OrderedCollection('simple' 'makes' 'learning')
an OrderedCollection('makes' 'learning' 'simple') 
an OrderedCollection('learning' 'simple' 'also') 
an OrderedCollection('simple' 'also' 'work') 
an OrderedCollection('also' 'work' 'simple')
)
)
```
The Features from the functions can be used with the ML libraries, DataFrame Libraries, Keras Bridge and lot more tasks related to Data Analysis and Machine Learning.

Thanks :-)
