Class {
	#name : #RemoveMessageSendMutantOperator,
	#superclass : #MutantOperator,
	#instVars : [
		'expressionToReplace'
	],
	#category : #'MuTalk-Model-Operators'
}

{ #category : #printing }
RemoveMessageSendMutantOperator >> description [
	^ 'Remove message send ' , self selector
]

{ #category : #applying }
RemoveMessageSendMutantOperator >> expressionToReplace [
	"arg names do not matter much as they are removed regardless"
	^ expressionToReplace ifNil: [
		String streamContents: [ :s | 	| argumentCounter |
			s <<  '``@receiver' .
			argumentCounter := 0.
			self selector keywords do: [ :aKeyword |
				s <<  ' '  << aKeyword.
				aKeyword last = $: ifTrue: [ 
					s << ' ``@arg' << argumentCounter printString.
					argumentCounter := argumentCounter + 1 
					]]]]
]

{ #category : #applying }
RemoveMessageSendMutantOperator >> newExpression [
	^ '``@receiver'
]

{ #category : #accessing }
RemoveMessageSendMutantOperator >> selector [
	^ self subclassResponsibility
]
