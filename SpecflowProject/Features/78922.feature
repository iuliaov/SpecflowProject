Feature: Daily Stand-Up


@tc:79223
@standup 
Scenario: Try to add blank messages as a Manager 
Given I am logged in as a Manager
And I am on http://localhost:3000/project/1/daily page
When I join a Stand-Up meeting 
And I write a blank message in the Notes
And I try to send the message
Then the message is not send and displayed in Notes

@tc:79224
@standup 
Scenario: Try to add blank messages as a Staff
Given I am logged in as a Staff
And I am on http://localhost:3000/project/1/daily page
When I join a Stand-Up meeting 
And I write a blank message in the Notes
And I try to send the message
Then the message is not send and displayed in Notes
