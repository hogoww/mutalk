Class {
	#name : #RemoveFullGC,
	#superclass : #MutantOperator,
	#category : #'MuTalk-Model-Operators'
}

{ #category : #printing }
RemoveFullGC >> description [
	^ 'Removing call to FullGC'
]

{ #category : #applying }
RemoveFullGC >> expressionToReplace [
	^'``@Spur32BitCoMemoryManager fullGC'
]

{ #category : #applying }
RemoveFullGC >> newExpression [
	^ ''
]
