Class {
	#name : #RemoveMessageSendOperator,
	#superclass : #MutantOperator,
	#category : #'MuTalk-Model-Operators'
}

{ #category : #printing }
RemoveMessageSendOperator >> description [
	^ 'Remove message send to ' , self selector , 'for receiver of type' , self receiverType
]

{ #category : #applying }
RemoveMessageSendOperator >> expressionToReplace [
	^ '``@ ' , self receiverType , ' ' , self selector
]

{ #category : #applying }
RemoveMessageSendOperator >> newExpression [
	^ '``@ ' , self receiverType
]

{ #category : #accessing }
RemoveMessageSendOperator >> receiverType [
	^ self subclassResponsibility
]

{ #category : #accessing }
RemoveMessageSendOperator >> selector [
	^ self subclassResponsibility
]
