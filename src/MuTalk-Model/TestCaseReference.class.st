Class {
	#name : #TestCaseReference,
	#superclass : #Object,
	#instVars : [
		'class',
		'selector'
	],
	#category : #'MuTalk-Model'
}

{ #category : #'instance creation' }
TestCaseReference class >> for: aSelector in: aClass [ 
	^self new initializeFor: aSelector in: aClass
]

{ #category : #'instance creation' }
TestCaseReference class >> forTestCase: aTestCase [ 
	^self for: aTestCase selector in: aTestCase class
]

{ #category : #initialize }
TestCaseReference >> initializeFor: aSelector in: aClass [
	class := aClass.
	selector := aSelector.
]

{ #category : #evaluating }
TestCaseReference >> resources [
	^self testCase resources
]

{ #category : #evaluating }
TestCaseReference >> run [
	| result exception |
	result := self testCase run.

	exception := TestsWithErrorsException new failsInC; yourself.
	[ self runInC = 'test passed' 
		ifFalse: [ exception signalFor: self ]
	] on: Exception do: [ exception signalFor: self ].
	(result failuresSize > 0 or: [ result errorsSize > 0])
		ifTrue: [TestsWithErrorsException signalFor: self].
	^ result
]

{ #category : #evaluating }
TestCaseReference >> run: aTestResult [
	^self testCase run: aTestResult
]

{ #category : #running }
TestCaseReference >> runInC [
	[
		[ ^ (class >>  selector) runInC key ] valueWithin: (Duration seconds: 20)  onTimeout: [ TimedOut signal ]
	] on: Exception do:[ :e |
		e class = Notification ifTrue:[ e resume ].
		e class = Halt ifTrue: [ e pass ].
		e class = TimedOut 
			ifTrue: [ ^ 'TimedOut' ]
			ifFalse: [ ^ 'Others' ]].
]

{ #category : #evaluating }
TestCaseReference >> testCase [
	^class selector: selector.
]
