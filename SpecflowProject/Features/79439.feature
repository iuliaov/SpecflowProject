Feature: Feedback 

@tc:79716
@retro @feedback @positive
Scenario: Thank you message is displayed after feedback is sent 
Given  the user is logged in as a <user_role>
And the user is on <page> 
When the user finishes the retrospective meeting
And a popup for feedback appears
And user selects a score
And user sends the feedback
Then a thank you message is displayed
Examples:
|  user_role   | page                  |
| staff        |    retro meeting      |

@tc:79717
@retro @feedback @positive
Scenario: Thank you message dissapears after 15 seconds
Given  the user is logged in as a <user_role>
And the user is on <page> 
When the user finishes the retrospective meeting
And a popup for feedback appears
And user selects a score
And user sends the feedback
Then a thank you message is displayed
And message dissapears after 15 seconds
Examples:
|  user_role   | page                  |
| staff        |    retro meeting      |