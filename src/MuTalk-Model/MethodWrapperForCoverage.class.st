Class {
	#name : #MethodWrapperForCoverage,
	#superclass : #TestCoverage,
	#instVars : [
		'tests',
		'coverageAnalysis'
	],
	#category : #'MuTalk-Model'
}

{ #category : #'instance creation' }
MethodWrapperForCoverage class >> on: aMethodReference for: aCoverageAnalysis [
	^ self new initializeOn: aMethodReference for: aCoverageAnalysis
]

{ #category : #initialization }
MethodWrapperForCoverage >> initializeOn: aMethodReference for: aCoverageAnalysis [
	self initializeOn: aMethodReference.
	coverageAnalysis := aCoverageAnalysis.
	tests := Set new.
	
	"If the mutation is on a test, it'll need to know that the test itself is part of the mutation"
	aMethodReference compiledMethod ast isTest 
		ifTrue: [ tests add: (TestCaseReference for: aMethodReference selector in: aMethodReference methodClass) ].
]

{ #category : #private }
MethodWrapperForCoverage >> mark [
	|currentTest|
	super mark.
	currentTest := coverageAnalysis currentTest.
	currentTest ifNotNil: [tests add: currentTest]. 
	

]

{ #category : #accessing }
MethodWrapperForCoverage >> run: aSelector with: anArray in: aReceiver [
	self mark.
	^ aReceiver withArgs: anArray executeMethod: method
]

{ #category : #accessing }
MethodWrapperForCoverage >> tests [
	^tests
]
