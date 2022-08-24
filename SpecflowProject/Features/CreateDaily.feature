Feature: CreateDaily
Create daily stand-up
#steps
Scenario: Create valid Daily Stand-up
	Given User accessed project number "1" in with "manager" credetials
	And User clicks Create Daily-Meeting button
	When User fills in the Create Daily Meeting form with valid data
	| event_name    | notes | timer | hours | minutes | 
	| Framework Test | check | check | 01     | 12      |
	And User selects "User #1" and "User #2" and "User #3" as participants
	And User selects "Monday" and "Tuesday" as occurence
	And User clicks Create
	Then The meeting is created