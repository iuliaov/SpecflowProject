Feature: Event-ending Template 

@tc:79994
@retro @event-ending @positive
Scenario: Voting results are updated in real-life
Given the user1 is logged in as a <user_project_role_1>
And the user1 joins a <retro_meeting>
And the user2 is logged in as a <user_project_role_2> in a new incognito tab
And the user2 joins the same <retro_meeting> as user1
And user1 and user2 are on event-ending template 
When user1 votes an <I_feel1> category
And user2 votes an <I_feel2> category
Then the voting results are updated for both users in real-life
Examples:
|  user_project_role_1   |  user_project_role_2   |           retro_meeting                           | I_feel1           | I_feel2               |
|  manager               |  staff                 |http://localhost:3000/project/1/retro/29/meeting/81|  Full of energy   |  Exhausted            | 
|  manager               |  staff                 |http://localhost:3000/project/1/retro/29/meeting/81|There is still life|  Dead                 | 


@tc:79995
@retro @event-ending @positive
Scenario: User can choose from 4 voting options
Given the user1 is logged in as a <user_project_role_1>
And the user1 joins a <retro_meeting>
And the user2 is logged in as a <user_project_role_2> in a new incognito tab
And the user2 joins the same <retro_meeting> as user1
When user1 and user2 are on event-ending template 
Then user1 and user2 have 4 voting options available
Examples:
|  user_project_role_1   |  user_project_role_2   |           retro_meeting                           | 
|  manager               |  staff                 |http://localhost:3000/project/1/retro/29/meeting/81|

@tc:79996
@retro @event-ending @positive
Scenario: Only 1 vote per person is allowed 
Given the user is logged in as a <user_project_role>
And the user joins a <retro_meeting>
When user votes an <I_feel1> category
And user votes another <I_feel2> category
Then previous vote is discarded and the new vote is registered
Examples:
|  user_project_role_1   |           retro_meeting                           | I_feel1           | I_feel2               |
|  manager               |http://localhost:3000/project/1/retro/29/meeting/81|  Full of energy   |  Exhausted            | 
|  manager               |http://localhost:3000/project/1/retro/29/meeting/81|There is still life|  Dead                 |

@tc:79997
@retro @event-ending @positive
Scenario: User can vote each of the 4 options
Given the user is logged in as a <user_project_role>
And the user joins a <retro_meeting>
When user votes an <I_feel1> category
And user votes another <I_feel2> category
And user votes another <I_feel3> category
And user votes another <I_feel4> category
Then each previous vote is discarded and the new vote is registered
Examples:
|  user_project_role_1   |           retro_meeting                           | I_feel1           | I_feel2               | I_feel3           | I_feel4               |
|  manager               |http://localhost:3000/project/1/retro/29/meeting/81|  Full of energy   |  Exhausted            |There is still life|  Dead                 | 
|  manager               |http://localhost:3000/project/1/retro/29/meeting/81|There is still life|  Dead                 |  Full of energy   |  Exhausted            |
