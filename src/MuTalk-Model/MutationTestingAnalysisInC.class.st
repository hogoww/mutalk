Class {
	#name : #MutationTestingAnalysisInC,
	#superclass : #MutationTestingAnalysis,
	#category : #'MuTalk-Model'
}

{ #category : #defaults }
MutationTestingAnalysisInC class >> mutanClass [
	^ MutantEvaluationInC 
]

{ #category : #accesing }
MutationTestingAnalysisInC >> modelClasses [
	"we don't filter out tests, we want to change them"
	^ modelClasses

]
