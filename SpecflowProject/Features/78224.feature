@retro @positive
Scenario: Verify that the DL can see the number of voters
Given  the user is logged in as a <user_role>
And the user is on <page> 
And the user joins a retro meeting
And the user moves to ICE_BREAKING template
When the user votes in the ICE_BREAKING template
Then the number of votes increments by 1 next to 'Like' button
And the user can see the number of voters

Examples:
|  user_project_role   |page                                 |
| manager              |http://localhost:3000/project/1/retro|


@retro @negative
Scenario: Verify that the staff can not see the number of voters
Given  the user is logged in as a <user_role>
And the user is on <page> 
And the user joins a retro meeting
And the user moves to ICE_BREAKING template
When the user votes in the ICE_BREAKING template
Then the number of votes increments by 1 next to 'Like' button
And the user can not see the number of voters in the header

Examples:
|  user_project_role   |page                                 |
| staff                |http://localhost:3000/project/1/retro|