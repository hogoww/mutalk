Class {
	#name : #RemoveFullGC,
	#superclass : #RemoveMessageSendOperator,
	#category : #'MuTalk-Model-Operators'
}

{ #category : #applying }
RemoveFullGC >> receiverType [
	^ #Spur32BitCoMemoryManager
]

{ #category : #applying }
RemoveFullGC >> selector [
	^ #fullGC
]
