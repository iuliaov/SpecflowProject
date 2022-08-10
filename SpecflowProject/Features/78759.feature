Feature: Voting Modal
    Description: The purpose of this feature is to test the functionality of the Voting modal

Background: 
Given user1 is logged in as <user_project_role>
Examples:
|user_project_role|
|manager|
And user2 is logged in as <user_project_role>
Examples:
|user_project_role|
|staff|
And user1 is on <page>
And user2 is on <page>
And user1 joins a Retro meeting
And user2 joins the Retro meeting joined by user1
And user1 moves to <template> template
And the user2 is redirected to the <template> template
Examples:
|page                                 | template    |
|http://localhost:3000/project/1/retro| Health_Check|


Scenario: The user closes the voting Modal before voting
And the <user_id> clicks on '+' button
And the Voting modal is opened
When the user presses the 'x' button
Then voting window is closed 
And the user is redirected to the Health_Check template
Examples:
|user_id   |page                                 |
| user1    |http://localhost:3000/project/1/retro|
| user2    |http://localhost:3000/project/1/retro|

Scenario: The user moves to the next page after voting
And the <user_id> user clicks on '+' button
And the Voting modal is opened
And the user chooses 'Good'
And the user clicks on 'Better'
When the <user_id> user presses the 'Next' button
Then the <user_id> user is redirected to the next page in the Voting modal
And the 
Examples:
|user_id   |page                                 |
| user1    |http://localhost:3000/project/1/retro|
| user2    |http://localhost:3000/project/1/retro|

Scenario: The user cannot move to the next page if he didn't vote
And the <user_id> user clicks on '+' button
And the Voting modal is opened
When the <user_id> user presses the 'Next' button
Then nothing happens
And the <user_id> user cannot move to the next page
Examples:
|user_id   |page                                 |
| user1    |http://localhost:3000/project/1/retro|
| user2    |http://localhost:3000/project/1/retro|