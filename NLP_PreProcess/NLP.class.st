Class {
	#name : #NLP,
	#superclass : #Object,
	#classInstVars : [
		'count'
	],
	#category : #'NLP_PreProcess-PreProcess'
}

{ #category : #'as yet unclassified' }
NLP >> BagOfWords: text [

	| a baglist vlist btext siz zarr stext zar vsiz | 
	
	stext := self StopWords: text.
	btext := self VocabBuild: text.
	siz := btext size.
	vlist := stext collect: [ :i | [ :each | each isSeparator ] split: i ].
	vsiz := vlist size.
	baglist := SortedCollection new.
	zarr := OrderedCollection new.
	btext do: [ :b | baglist add: b].
	vlist do: [ :k | zar:= baglist deepCopy. k do: [ :j |  zar add:j ]. zarr add:zar]. 
	a := zarr collect: [ :c | btext collect: [ :e | (c occurrencesOf:e)-1 ] ].
	^a.
]

{ #category : #'as yet unclassified' }
NLP >> EditDistBetween: str1 and: str2 [

	| mat m s1 s2 |
	

	s1 := str1 size.
	s2 := str2 size.
	m := Matrix rows:(s1+1)  columns:(s2+1).
	(1 to: (s1+1)) do: [ :i | (1 to:(s2+1)) do: [ :j | m at:i at:j put:0 ] ].
	(1 to:(s1+1)) do: [ :i | m at:i at:1 put: i-1 ].
	(1 to:(s2+1)) do: [ :i | m at:1 at:i put: i-1 ].
	(2 to: (s1+1)) do: [ :i | (2 to: (s2+1)) do: [ :j | (str1 at:i-1) = (str2 at:j-1) ifTrue:[ mat := (((m at:(i-1) at:j)+1) min:(m at:(i-1) at:(j-1))) min:((m at:i at:(j-1))+1).      	m at:i at:j put: mat. ] ifFalse: [ mat:= mat := (((m at:(i-1) at:j)+1) min:(m at:(i-1) at:(j-1))+1) min:((m at:i at:(j-1))+1). m at:i at:j put:mat. ]  ] ].
	
	^(m at:s1 at:s2).
]

{ #category : #'as yet unclassified' }
NLP >> HammingDistBetween: str1 and: str2 [

	| s1 s2 dist |
	
	s1 := str1 size.
	s2 := str2 size.
	self assert: s1 equals:s2.
	dist := 0.
	
	(1 to: s1) do: [ :i | ((str1 at:i) = (str2 at:i)) ifFalse: [ dist := dist + 1. ] ].
	 
	^dist.
	
	
]

{ #category : #'as yet unclassified' }
NLP >> NgramFor: text Nsize: n [

	| stword vlist temp arr |
	
	stword := self StopWords: text.
	vlist := stword collect: [ :i | [ :each | each isSeparator ] split: i ].
	
	temp := OrderedCollection new.
	arr := OrderedCollection new.
	
	vlist do: [ :i | i doWithIndex: [ :j :idx | ((idx+(n-1)) > (i size)) ifFalse: [ temp add:(i copyFrom:idx to:(idx + (n-1))) ] ]].
	
	^temp.
]

{ #category : #'as yet unclassified' }
NLP >> StopWords: text [

	|st ftext prtext rtext|
	
	st := Array withAll: #( 'i' 'me' 'my' 'myself' 'we' 'our' 'ours' 'ourselves' 'you' 'you''re' 'you''ve' 'you''ll' 'you''d' 'your' 'yours' 'yourself' 'yourselves' 'he' 'hey' 'him' 'his' 'himself' 'she' 'she''s' 'her' 'hers' 'herself' 'it' 'it''s' 'its' 'itself' 'they' 'them' 'their' 'theirs' 'themselves' 'what' 'which' 'who' 'whom' 'this' 'that' 'that''ll' 'these' 'those' 'am' 'is' 'are' 'was' 'were' 'be' 'been' 'being' 'have' 'has' 'had' 'having' 'do' 'does' 'did' 'doing' 'a' 'an' 'the' 'and' 'but' 'if' 'or' 'because' 'as' 'until' 'while' 'of' 'at' 'by' 'for' 'with' 'about' 'between' 'into' 'through' 'during' 'before' 'after' 'above' 'below' 'to' 'from' 'up' 'down' 'in' 'out' 'on' 'off' 'over' 'under' 'again' 'further' 'then' 'once' 'here' 'there' 'when' 'where' 'why' 'how' 'all' 'any' 'both' 'each' 'few' 'more' 'most' 'other' 'some' 'such' 'no' 'nor' 'not' 'only' 'own' 'same' 'so' 'than' 'too' 'very' 's' 't' 'can' 'will' 'just' 'don' 'don''t' 'should' 'should''ve' 'now' 'd' 'll' 'm' 'o' 're' 've' 'y' 'ain' 'aren' 'aren''t' 'couldn' 'couldn''t' 'didn' 'didn''t' 'doesn' 'doesn''t' 'hadn' 'hadn''t' 'hasn' 'hasn''t' 'haven' 'haven''t' 'isn' 'isn''t' 'ma' 'mightn' 'mightn''t' 'mustn' 'mustn''t' 'needn' 'needn''t' 'shan' 'shan''t' 'shouldn' 'shouldn''t' 'wasn' 'wasn''t' 'weren' 'weren''t' 'won' 'won''t' 'wouldn' 'wouldn''t'  ).
	prtext := text collect: [ :i | i asLowercase ].
	rtext := prtext  collect: [ :j | [ :each | each isSeparator ] split: j ].
	ftext := rtext  collect: [ :k | k reject: [ :each | st includes: each ] ].
	^ftext collect: [ :l | String streamContents: [ :stream | l asStringOn: stream delimiter: ' ' ] ].
	 
]

{ #category : #'as yet unclassified' }
NLP >> TfIdf: text [

	| idf tfidf cnts ttext stext tf vlist vocab cnt t |
	
	stext := self StopWords: text.
	vocab := self VocabBuild: text.
	vlist := stext collect: [ :i | [ :each | each isSeparator ] split: i ].
	ttext := self BagOfWords: text.
	tf := OrderedCollection new.
	vlist doWithIndex: [ :i :idx | ttext doWithIndex: [ :j :idb | idb == idx ifTrue: [ tf add: (j / i size)  ] ] ].
	cnt := OrderedCollection new.
	vocab do: [ :i | vlist do: [ :j | (j includes: i) ifTrue:  [ cnt add: i ] ] ].
	"2.303"
	cnts := vocab collect: [ :i | cnt occurrencesOf: i ].
	idf := OrderedCollection new.
	vocab doWithIndex: [ :j :idx | idf add:(( text size / (cnts at:idx)) ln) ].
	tfidf := OrderedCollection new.	
	tf do: [ :j | t := OrderedCollection new. idf doWithIndex: [ :i :idx | t add: (j at: idx)*i ]. tfidf add: t].
	^tfidf.
]

{ #category : #'as yet unclassified' }
NLP >> VocabBuild: text [

	| stword vlist aset |
	
	stword := self StopWords: text.
	vlist := stword collect: [ :i | [ :each | each isSeparator ] split: i ].
	aset := Set new.
	vlist do: [ :j |j collect: [ :k | aset add: k ] ].
	^aset sorted.  
	
]
