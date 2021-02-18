Class {
	#name : #ReplaceAssertEqualWithDenyEqual,
	#superclass : #SelectorReplacementMutantOperator,
	#category : #'MuTalk-Model-Operators'
}

{ #category : #accessing }
ReplaceAssertEqualWithDenyEqual >> newSelector [
	^ #deny:equals:
]

{ #category : #accessing }
ReplaceAssertEqualWithDenyEqual >> oldSelector [
	^ #assert:equals:
]
