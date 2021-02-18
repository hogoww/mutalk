Class {
	#name : #TestsWithErrorsException,
	#superclass : #Error,
	#instVars : [
		'testCase',
		'failsInC'
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
TestsWithErrorsException >> failsInC [
	failsInC := true
]

{ #category : #accessing }
TestsWithErrorsException >> initialize [
	failsInC := false
]

{ #category : #accessing }
TestsWithErrorsException >> signalFor: aTestCase [
	testCase := aTestCase.
	self signal
]

{ #category : #accessing }
TestsWithErrorsException >> testCase [
	^ testCase
]

{ #category : #accessing }
TestsWithErrorsException >> testCase: aTestCase [
	testCase := aTestCase
]
