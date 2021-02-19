Class {
	#name : #RemoveNotOperator,
	#superclass : #RemoveMessageSendOperator,
	#category : #'MuTalk-Model-Operators'
}

{ #category : #accessing }
RemoveNotOperator >> receiverType [
	^ #Boolean
]

{ #category : #accessing }
RemoveNotOperator >> selector [
	^ #not
]
