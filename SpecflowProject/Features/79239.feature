Feature: Retro meeting
Background: Logging and access retro meeting form
Given the user is logged in with <user_email> and <user_passowrd>
And the user is on the http://localhost:3000/project/1/retro
When the user clicks the Create button
And Retro meeting form is displayed
Examples:
|user_email         ||user_passowrd|
|manager@amdaris.com||amdaris|


Scenario: Verify if manager can create and save a retro meeting
And the user types "Test meeting" in the Retro template name field
And the user ticks on the notes checkbox
And the user drags and drops all templates in the droppable area
And the user sets timer for 00:45 minutes
And the user selects today`s date
And the user selects  a later time than the current time
And the user clicks Ok button to save the time
And click the Create button
Then the Retro meeting is saved in the active tab
And user is redirected to the active retro page

Scenario: Verify if meeting saves after meeting form is completed and user clicks back button
And the user types "Test meeting" in the Retro template name field
And the user ticks on the notes checkbox
And the user drags and drops all templates in the droppable area
And the user sets timer for 00:45 minutes
And the user selects today`s date
And the user selects  a later time than the current time
And the user clicks Ok button to save the time
And the user clicks Back button
Then the user is redirected to the active retro page
And the meeting is not saved 

Scenario: Verify if can save the meeting without a name
And the user left the Retro template name field empty
And the user ticks on the notes checkbox
And the user drags and drops all templates in the droppable area
And the user sets timer for 00:45 minutes
And the user selects today`s date
And the user selects a later time than the current time
And the user clicks Ok button to save the time
And the user clicks Create button
Then the error message "Retro template name is requierd" is displayed
And the meeting is not saved 

Scenario: Verify if can save the meeting with more than 49 characters for name input
And the user types <name> in the Retro template name field
And the user ticks on the notes checkbox
And the user drags and drops all templates in the droppable area
And the user sets timer for 00:45 minutes
And the user selects today`s date
And the user selects a later time than the current time
And the user clicks Ok button to save the time
And the user clicks Create button
Then the error message "Length of the name is not valid!" is displayed
And the meeting is not saved 
Examples:
|name|
|Lorem ipsum dolor sit amet, consectetur erat curae.|
|Lorem ipsum dolor sit amet, consectetur erat curaet sit aimet dolor.|

Scenario: Verify if can save a meeting with a past date and time
And the user selects a <past_date> date
And user selects the <time> time
And the user clicks Ok button to save the time
And the user complete all the rest components with valid data
And the user clicks Create button
Then the error message "Date and time are not valid!" is displayed
And the meeting is not saved 
Examples:
|past_date ||time|
|2021-01-01||05:00:00|
|1955-08-31||05:00:00|
|2022-10-08||15:00:00|
|2022-10-08||00:00:00|

Scenario: Verify if can save a meeting with today`s date but a past time
And the user selects today`s date
And user selects the <time> time
And the user clicks Ok button to save the hour
And the user complete all the rest components with valid data
And the user clicks Create button
Then the error message "Date and time are not valid!" is displayed
And the meeting is not saved 
Examples:
|hour|
|09:00:00|
|09:59:00|
|09:59:59|

Scenario: Verify if can save a meeting without setting the date and time
And the user selects <date> date
And user selects <time> time
And the user clicks Ok button to save the hour
And the user complete all the rest components with valid data
And the user clicks Create button
Then the error message "Date and time are not valid!" is displayed
And the meeting is not saved 
Examples:
|date|      |hour|
|2022-08-11||         |
|          ||15:00:00 |
|          ||         |

Scenario: Verify if can save a meeting without adding any templates in the droppable area
And the user left the droppable area empty
And the user complete all the rest components with valid data
And the user clicks Create button
Then the error message "At least one retro template must be provided!" is displayed
And the meeting is not saved 

Scenario: Verify if can save a meeting without setting a valid timer duration
And the user set timer <duration> minutes
And the user complete all the rest components with valid data
And the user clicks Create button
Then the error message "Timer duration size is not valid!" is displayed
And the meeting is not saved 
Examples:
|duration|
|00:00|
|00:15|
|00:30|
|  :  |
|04:45|