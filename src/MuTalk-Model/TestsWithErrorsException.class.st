Class {
	#name : #TestsWithErrorsException,
	#superclass : #Error,
	#instVars : [
		'testCase'
	],
	#category : #'MuTalk-Model'
}

{ #category : #signalling }
TestsWithErrorsException class >> signalFor: aTestCase [
	^ self new
		testCase: aTestCase;
		signal
]

{ #category : #accessing }
TestsWithErrorsException >> testCase [
	^ testCase
]

{ #category : #accessing }
TestsWithErrorsException >> testCase: aTestCase [
	testCase := aTestCase
]
