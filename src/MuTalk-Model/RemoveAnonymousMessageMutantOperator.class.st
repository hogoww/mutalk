Class {
	#name : #RemoveAnonymousMessageMutantOperator,
	#superclass : #RemoveMessageSendMutantOperator,
	#instVars : [
		'selector'
	],
	#category : #'MuTalk-Model-Operators'
}

{ #category : #accessing }
RemoveAnonymousMessageMutantOperator class >> selector: aSelector [
	^ self new selector: aSelector ; yourself
]

{ #category : #accessing }
RemoveAnonymousMessageMutantOperator >> selector [
	^ selector
]

{ #category : #accessing }
RemoveAnonymousMessageMutantOperator >> selector: aSelector [
	selector := aSelector
]
