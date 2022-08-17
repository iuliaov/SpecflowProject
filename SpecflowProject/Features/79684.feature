Feature: Event-Ending Template

@tc:80001
@retro @event-ending @positive
Scenario: User can create a retro template with event ending
Given the user is logged in as a <user_project_role>
And the user is on retro template page
When user clicks on Create Template button
And drags event ending card to the droppable area
And writes <retro_title> in title field
And presses Create button 
Then a retro template with event ending is created
Examples:
|  user_project_role_1   |    retro_title   | 
|   manager              |    Test Retro    |

@tc:80002
@retro @event-ending @positive
Scenario: Event ending template is visible on create retro template page
Given the user is logged in as a <user_project_role>
And the user is on retro template page
When user clicks on Create Template button
Then user see event ending template in the list with available templates
Examples:
|  user_project_role_1   | 
|   manager              |  

@tc:80003
@retro @event-ending @positive
Scenario: User can view a retro template with event ending
Given the user is logged in as a <user_project_role>
And the user is on retro template page
When user clicks on Create Template button
And drags event_ending card to the droppable area
And writes <retro_title> in title field
And presses Create button 
And user open retro template page 
And user clicks view button on the new created retro template
Then retro template with event ending is displayed
Examples:
|  user_project_role_1   |    retro_title   | 
|   manager              |    Test Retro    |

@tc:80004
@retro @event-ending @positive
Scenario: User can reuse a retro template with event ending
Given the user is logged in as a <user_project_role>
And the user is on retro template page
When user clicks on Create Template button
And drags event_ending card to the droppable area
And writes <retro_title> in title field
And presses Create button 
And user open retro template page 
And user clicks use button on the new created retro template
Then reuse template page is displayed
Examples:
|  user_project_role_1   |    retro_title   | 
|   manager              |    Test Retro    |

@tc:80005
@retro @event-ending @positive
Scenario: User can create a retro meeting with event ending
Given the user is logged in as a <user_project_role>
And the user is on retrospective page
When user clicks on Create Retro button
And drags event ending card to the droppable area
And writes <retro_title> in title field
And presses Create button 
Then a retro meeting with event ending is created
Examples:
|  user_project_role_1   |    retro_title   | 
|   manager              |    Test Retro    |

@tc:80006
@retro @event-ending @positive
Scenario: Event ending template is visible on create retro page
Given the user is logged in as a <user_project_role>
And the user is on retrospective page
When user clicks on Create Retro button
Then user see event ending template in the list with available templates
Examples:
|  user_project_role_1   | 
|   manager              |  

@tc:80007
@retro @event-ending @positive
Scenario: User can view a retro meeting with event ending
Given the user is logged in as a <user_project_role>
And the user is on retrospective page
When user clicks on Create Retro button
And drags event_ending card to the droppable area
And writes <retro_title> in title field
And presses Create button 
And user open retrospective page 
And user clicks join button on the new created retro meeting
Then retro meeting with event ending is displayed
Examples:
|  user_project_role_1   |    retro_title   | 
|   manager              |    Test Retro    |
