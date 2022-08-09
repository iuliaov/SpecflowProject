Feature: View Mode


Scenario: User can View Retro Template
Given  the user is logged in as a <user_project_role>
And the user is on <page> 
And the user moves to <meeting_tab>
And the user clicks on 'Create Template' button
And the user creates a retro template
And the user moves to <meeting_tab>
And the list of <meeting_tab> should contain the created template
When the user clicks on <link> button next to the template
Then the template is open
And the user can see the created template content
And the elements added to the template are present
Examples:
|  user_project_role   | meeting_tab  |link     |page                                 |
|  manager             |  templates   |View     |http://localhost:3000/project/1/retro|


Scenario: User can go back from View Retro Template
Given  the user is logged in as a <user_project_role>
And the user is on <page> 
And the user moves to <meeting_tab>
And the user clicks on 'Create Template' button
And the user creates a retro template
And the user moves to <meeting_tab>
And the list of <meeting_tab> should contain the created template
And the user clicks on <link> button next to the template
And the user can see the created template content
When the user clicks on 'Back' button
Then the user is redirected to <page>
And the template is not updated
Examples:
|  user_project_role   | meeting_tab  |link     |page                                 |
|  manager             |  templates   |View     |http://localhost:3000/project/1/retro|
