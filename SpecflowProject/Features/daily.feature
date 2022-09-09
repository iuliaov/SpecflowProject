Feature: Daily Stand-Up 


@daily @recurring @positive
Scenario: User sees all components on the Create New Stand-Up form 
Given  the user is logged in as a manager  
And the user is on Daily Stand-Up page 
When the user clicks "Create Daily-Meeting"
Then user sees all components on the Create New Stand-Up form 



@daily @recurring @positive
Scenario: Edit button is displayed on Daily page only for manager
Given  the user is logged in as a <user_role>
When the user accesses <page>
Then the edit button is <visibility> on the page
Examples:
|  user_role     | page                  | visibility   |
| manager        |    Daily Stand-Up     | visible      |
| staff          |    Daily Stand-Up     | invisible    |

@daily @recurring @positive
Scenario: User can add multiple participant names
Given  the user is logged in as a manager
And the user is on Daily Stand-Up pag> 
When the user clicks "Create Daily-Meeting"
And the user adds a participant name
And the input box becomes empty
Then the user can add a new participant name 


@daily @recurring @positive
Scenario: User can't add an existent participant name
Given  the user is logged in as a manager
And the user is on  Daily Stand-Up page 
When the user clicks "Create Daily-Meeting"
And the user adds a participant name
And the input box becomes empty
And the user writes an existing participant name
Then the user can't add the participant


@daily @recurring @positive
Scenario: User can't add an empty participant name
Given  the user is logged in as a manager
And the user is on Daily Stand-Up page 
When the user clicks "Create Daily-Meeting"
And the user adds a participant name
And the input box becomes empty
And the user writes an empty participant name
Then the user can't add the participant


@daily @recurring @positive
Scenario: User can't add an inexistent participant name
Given  the user is logged in as a manager
And the user is on  Daily Stand-Up page 
When the user clicks "Create Daily-Meeting"
And the user adds a participant name
And the input box becomes empty
And the user writes an inexistent participant name
Then the user can't add the participant


@daily @recurring @positive
Scenario: User can tick timebox and notes feature
Given  the user is logged in as a manager
And the user is on Daily Stand-Up page 
When the user clicks "Create Daily-Meeting"
Then can tick timebox and notes feature
And the timebox duration is 15 mins by default


@daily @recurring @positive
Scenario: Timebox and notes feature are ticked by default
Given  the user is logged in as a manager
And the user is on Daily Stand-Up page 
When the user clicks "Create Daily-Meeting"
Then the timebox and notes feature are ticked on by default
And the timebox duration is 15 mins by default


@daily @recurring @positive
Scenario: User is able to input a name for the daily
Given  the user is logged in as a manager
And the user is on Daily Stand-Up page
When the user clicks "Create Daily-Meeting"
Then the user is able to input a name for the daily


@daily @recurring @positive
Scenario: User is able to input a name no longer than 50 characters for the daily
Given  the user is logged in as a manager
And the user is on Daily Stand-Up page 
When the user clicks "Create Daily-Meeting"
Then the user is able to input a name no longer than 50 characters for the daily


@daily @recurring @positive
Scenario: User is not able to create a daily with an empty name 
Given  the user is logged in as a manager
And the user is on Daily Stand-Up page
When the user clicks "Create Daily-Meeting"
Then the user is not able to create a daily with an empty name 


@daily @recurring @positive
Scenario: User is able to use the chat functionality if included
Given  the user is logged in as a manager
And the user is on Daily Stand-Up page
When the user clicks "Create Daily-Meeting"
And the users ticks the chat checkbox
And the user creates Daily meeting
Then the user joins the meeting
And the user is able to use the chat functionality   


@daily @recurring @positive
Scenario: User is not able to use the chat functionality if not included
Given  the user is logged in as a manager
And the user is on Daily Stand-Up page
When the user clicks "Create Daily-Meeting"
And the users unticks the chat checkbox
And the user creates Daily meeting
Then the user joins the meeting
And the user is not able to use the chat functionality   


@daily @recurring @positive
Scenario: User can click the edit button on Daily page
Given  the user is logged in as a manager
And the user accesses Daily Stand-Up page
And the user creates a daily meeting
When the user clicks edit button for the daily
Then the user is redirected to edit Daily page


@daily @recurring @positive
Scenario: User can edit Daily meeting
Given  the user is logged in as a manager
And the user accesses Daily Stand-Up page
When the user clicks edit button for a daily
And the user changes Daily info
And the user presses Update button
Then the changes are saved
And the user is redirected to Daily Stand-Up 


@daily @recurring @positive
Scenario: User can't update Daily meeting with empty forms 
Given  the user is logged in as a manager
And the user accesses Daily Stand-Up page
And the user clicks edit button for a daily
And the user deletes all Daily info
When the user presses Update button
Then the error messages are displayed


Scenario: User can`t update the date for a serie of meetings that have already start
Given the user is logged in as a manager
And the user accesses Daily Stand-up page
And the user creates a daily meeting
And the user set the today`s date and current time
When the user clicks the edit button for the created daily
Then the date can`t be edited

Scenario: User can update the date for a serie of meetings that haven`t started yet
Given the user is logged in as a manager
And the user accesses Daily Stand-up page
And the user creates a daily meeting
And the user set a future date fot the meeting to start
When the user clicks the edit button for the created daily
Then the user is able to change the date


Scenario: Check the meeting to be active
Given the user is logged in as a manager
And the user accesses Daily Stand-up page
And the user creates a daily meeting 
And the user sets the today date
And the user sets a later time than the current time
When the user clicks [Create] button
And the user is redirected to the main page
Then the create meeting is active
And [Join] button is enable

Scenario: Check the meeting to not be active
Given the user is logged in as a manager
And the user accesses Daily Stand-up page
And the user creates a daily meeting 
And the user sets the tomorrow date
When the user clicks [Create] button
And the user is redirected to the main page
Then the create meeting is not active
And [Join] button is disable
