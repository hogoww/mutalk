Extension { #name : #TestCase }

{ #category : #'*MuTalk-Model' }
TestCase >> asTestCaseReference [
	^ TestCaseReference for: testSelector in: self class
]
