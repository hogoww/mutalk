Class {
	#name : #MutantEvaluationInC,
	#superclass : #MutantEvaluation,
	#category : #'MuTalk-Model'
}

{ #category : #private }
MutantEvaluationInC >> runTests [
	"Collect all suite test and execute them."
	| suite pRes cRes res |
	res := TestResult new. 
	(strategy testCasesToEvaluate: mutation for: self) do: [ :aTest | . 
		suite := TestSuite named: 'MutationEvaluation'.
		suite addTests: {aTest testCase}.
		[ pRes := suite runStoppingOnFirstFailOrError ] 
			on: Error
			do: [ :ex | nil ].
		cRes := aTest runInC.

		"passing means it's failing in this case"
		pRes hasPassed & cRes ~= 'test passed'  ifTrue: [ res addPass: aTest testCase. ]
			ifFalse:[	
				(pRes hasErrors | pRes hasFailures) & cRes = 'test passed' ifTrue: [ res addPass: aTest testCase. ]
				ifFalse: [ res addFailure: aTest testCase. ]] 

		].
	^ pRes

]
