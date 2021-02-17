Class {
	#name : #ReplaceIntegerObjectOfWithIntegerValueOf,
	#superclass : #SelectorReplacementMutantOperator,
	#category : #'MuTalk-Model-Operators'
}

{ #category : #accessing }
ReplaceIntegerObjectOfWithIntegerValueOf >> newSelector [
	^ #integerValueOf:
]

{ #category : #accessing }
ReplaceIntegerObjectOfWithIntegerValueOf >> oldSelector [
	^ #integerObjectOf:
]
