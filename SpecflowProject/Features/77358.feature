Feature: Anonymous participation

@tc:79963
Scenario: Anonymous checkbox visible and tickable
Given the user is logged in as manager
And is on the <form> form
Then the anonymous checkbox is unticked by default
And the anonymous checkbox is <visability> and <checkability>
Examples:
|form          |visability|checkability|
|Retro meeting |visable   |checkable   |   
|Retro template|visable   |checkable   |

@tc:79964
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

@tc:79965
Scenario: Check if participants name are anonymous on AGILE template retro meeting
Given manager user is logged in with manager credentials
And staff user1 is logged in with staff credentials
And admin user is logged in with admin credentials
Then the manager access the Retro templates page
And manager use and existing template
And create a retro meeting with anonymous participation
And all three user are joined the meeting
And they are on the AGILE template
And <user1> types <message> in <column> column
And <user2> types <message> in <column> colum
And <user3> types <message> in <column> column
Then <user1>, <user2> and <user3> name is hidden
And user name is replaced with an id
Examples: 
|user1   |user2|user3 |message|column  |
|manager |staff|admin |Hello  |Start   |
|manager |staff|admin |Welcome|Stop    |
|manager |staff|admin |Goodbye|Continue|

@tc:79966
Scenario: Check if participants name are anonymous on TEAM_HEALTH_CHECK template retro meeting
Given manager user is logged in with manager credentials
And staff user is logged in with staff credentials
And admin user is logged in with admin credentials
Then the manager access the Retro templates page
And manager use and existing template
And create a retro meeting with anonymous participation
And all three users joined the meeting
And they are on the TEAM_HEALTH_CHECK template
Then their names are hidden in the table
And are replaced with Participant 1 and Participant 2


@tc:79967
Scenario: Check if participants name are not hidden in Notes, when anonymous participation is on
Given manager user is logged in with manager credentials
And staff user is logged in with staff credentials
And admin user is logged in with admin credentials
Then the manager access the Retro templates page
And manager use and existing template
And create a retro meeting with anonymous participation
And all three users joined the meeting
And they open the notes chat
And manager user types "Hello" in chat
And staff user types "Good afternoon" in chat
And admin user types "Welcome" in chat
Then their name are not hidden
And are displayed above their sent message
 

@tc:79968
Scenario: Check if participants name are not hidden on AGILE template when anonymous participation is off
Given manager user is logged in with manager credentials
And staff user is logged in with staff credentials
And admin user is logged in with admin credentials
Then the manager access the Retro templates page
And manager use and existing template
And create a retro meeting with anonymous participation off
And all three users joined the meeting
And they are on Agile template
And <user1> types <message> in <column> column
And <user2> types <message> in <column> colum
And <user3> types <message> in <column> column
Then <user1>, <user2> and <user3> name is visible

Examples: 
|user1   |user2|user3 |message|column  |
|manager |staff|admin |Hello  |Start   |
|manager |staff|admin |Welcome|Stop    |
|manager |staff|admin |Goodbye|Continue|

@tc:79969
Scenario: Check if participants name are not hidden on TEAM_HEALTH_CHECK template when anonymous participation is off
Given manager user is logged in with manager credentials
And staff user is logged in with staff credentials
And admin user is logged in with admin credentials
Then the manager access the Retro templates page
And manager use and existing template
And create a retro meeting with anonymous participation off
And all three users joined the meeting
And they are on the TEAM_HEALTH_CHECK template
Then their names are visible in the table