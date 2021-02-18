Class {
	#name : #MutationTestingAnalysisInC,
	#superclass : #MutationTestingAnalysis,
	#category : #'MuTalk-Model'
}

{ #category : #defaults }
MutationTestingAnalysisInC class >> mutantClass [
	^ MutantEvaluationInC 
]

{ #category : #accesing }
MutationTestingAnalysisInC >> modelClasses [
	"we don't filter out tests, we want to change them"
	^ modelClasses

]

{ #category : #accesing }
MutationTestingAnalysisInC >> run [
	"Obtain mutants applying the operators in the classes (or
	methods of
	those classes) and execute all mutants in the set of testClases.
	We obtain a result for each mutant generated"
	| testsFailingInC |
	testsFailingInC := testCases class new.
	testCases do: [ :aTestCase | 
			[ aTestCase run ] 
			on: TestsWithErrorsException 
			do: [ :ex | 
				ex failsInC 
					ifTrue: [ testsFailingInC add: ex test ]
					ifFalse:[
						self halt.
						self inform: 'Your tests have Errors or Failures. Please correct them.'.
						ex return: false ]]].
			
	testsFailingInC do: [ :aTest | testCases remove: aTest ].
	
	logger logAnalysisStartFor:self.
	elapsedTime := Time millisecondsToRun: [
					self generateCoverageAnalysis.
					self generateMutations.
					self generateResults.].
					true
]
