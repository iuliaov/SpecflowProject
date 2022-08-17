Feature: Anonymous participation


Scenario: Anonymous checkbox visible and tickable
Given the user is logged in as manager
When manager is on the <form> form
Then the anonymous checkbox is unticked by default
And the anonymous checkbox is <visability> and <checkability>
Examples:
|form          |visability|checkability|
|Retro meeting |visable   |checkable   |   
|Retro template|visable   |checkable   |


Scenario: Manager can create a retro template with anonymous participation on
Given the user is logged in as manager
And the user is on retrospective templates page
When the user clicks on Create Tenplate
And Retro template form is displayed
And the user types "Retro meeting" in Retro template name
And the user ticks on the notes checkbox
And the user ticks on the anonymous checkbox
And the user drags and drops <template> template in droppable area
And the user sets the timer for 00:45 minutes
And user clicks on Create button
Then the Retro template is created
And saved in templates tab with anonymous participation on


Scenario: Check if participants name are anonymous on AGILE template retro meeting
Given manager user is logged in with manager credentials
And staff user is logged in with staff credentials
And the manager access the Retro templates page
And manager use and existing template
And create a retro meeting with anonymous participation
When staff user joins the meeting
And manager and staff are on the AGILE template
And manager and staff types <message> in Start column
And manager and staff types <message> in Stop column
And manager and staff types <message> in Continue column
Then manager and staff name is hidden
And user name is replaced with an id
Examples: 
|message|
|Hello  |
|Welcome|


Scenario: Check if participants name are anonymous on TEAM_HEALTH_CHECK template retro meeting
Given manager user is logged in with manager credentials
And staff user is logged in with staff credentials
And the manager access the Retro templates page
And manager use and existing template
And create a retro meeting with anonymous participation
When staff user joins the meeting
And they are on the TEAM_HEALTH_CHECK template
Then their names are hidden in the table header
And are replaced with Participant 1 and Participant 2


Scenario: Check if participants name are not hidden in Notes, when anonymous participation is on
Given manager user is logged in with manager credentials
And staff user is logged in with staff credentials
And the manager access the Retro templates page
And manager use and existing template
And create a retro meeting with anonymous participation
When staff user joins the meeting
And manager and staff open the notes chat
And manager user types "Hello" in chat
And staff user types "Good afternoon" in chat
Then their name are not hidden
And are displayed above their sent message
 

Scenario: Check if participants name are not hidden on AGILE template when anonymous participation is off
Given manager user is logged in with manager credentials
And staff user is logged in with staff credentials
And the manager access the Retro templates page
And manager use and existing template
And create a retro meeting with anonymous participation off
When staff user joins the meeting
And manager and staff are on Agile template
And manager and staff types <message> in Start column
And manager and staff types <message> in Stop column
And manager and staff types <message> in Continue column
Then manager and staff name is visible

Examples: 
|message|
|Hello  |
|Welcome|


Scenario: Check if participants name are not hidden on TEAM_HEALTH_CHECK template when anonymous participation is off
Given manager user is logged in with manager credentials
And staff user is logged in with staff credentials
And the manager accessed the Retro templates page
And manager used and existing template
And created a retro meeting with anonymous participation off
When staff user joins the meeting
And manager and staff are on the TEAM_HEALTH_CHECK template
Then their names are visible in the table

Scenario: Check if participants name are saved anonymously in past retro when anonymous participation is on
Given manager user is logged in with manager credentials
And staff user is logged in with staff credentials
And the manager accessed the Retro templates page
And manager used and existing template
And created a retro meeting with anonymous participation off
When staff user joins the meeting
And manager and staff are on the AGILE template
And manager and staff types <message> in Start column
And manager and staff types <message> in Stop column
And manager and staff types <message> in Continue column
And manager switches to TEAM_HEALTH_CHECK template
And manager and staff are on the TEAM_HEALTH_CHECK template
And manager and staff names are hidden in the table header
And manager and staff votes for all criteria
And manager end the meeting
And manager and staff are redirected to the active retro page
And manager access the past tab
And manager clicks View button on last past retro meeting
And the retro info is displayed
Then the user names are anonymous on all templates
Examples: 
|message|
|Hello  |
|Welcome|
