Class {
	#name : #RemoveNotOperatorTest,
	#superclass : #MutantOperatorTest,
	#category : #'MuTalk-Tests'
}

{ #category : #accessing }
RemoveNotOperatorTest >> methodWithNoSenders [
	^ 1 + 2
]

{ #category : #accessing }
RemoveNotOperatorTest >> methodWithOneSender [
	^ true not
]

{ #category : #accessing }
RemoveNotOperatorTest >> methodWithOneSenderModified [

	^ true
]

{ #category : #accessing }
RemoveNotOperatorTest >> methodWithTwoSenders [
	^ true not and: [ false not ]
]

{ #category : #accessing }
RemoveNotOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ true and: [ false not ]
]

{ #category : #accessing }
RemoveNotOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ true not and: [ false ]
]

{ #category : #accessing }
RemoveNotOperatorTest >> operator [
	^ RemoveNotOperator new
]

{ #category : #testing }
RemoveNotOperatorTest >> operatorDescription [
	^ self operator description
]
