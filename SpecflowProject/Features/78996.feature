Feature: View functionality for past retro

@tc:79694
Scenario: Check for visibility - view button
Given the user is logged in as a manager
And the user is on the http://localhost:3000/project/1/retro
When the user accesses the past tab on the Retrospective page
Then the View button is visible and clickable for each past retro meeting

@tc:79695
Scenario: Check templates order in the past retro meeting
Given the retro meeting is created
When the user clicks Join next to the created retro meeting
And the retro meeting is accessed and <first_template> template is displayed
And the user clicks Next button 
And the  <second_template> template is displayed
And the user clicks Next button 
And the <third_template> template is displayed
And the user clicks End button
And the user is redirected to the active retro page
And the user accesses the past tab
And the past retro page is displayed
And the user clicks on the View button next to the last past meeting
Then the retro info is accessed 
And the templates order is the following:
|first_template|
|second_template|
|third_template|
And the retro info can be viewed only
Examples:
|first_template   | second_template  | third_template   |
|ICE_BREAKING     | AGILE            | TEAM_HEALTH_CHECK|
|AGILE            | TEAM_HEALTH_CHECK| ICE_BREAKING     |
|TEAM_HEALTH_CHECK| ICE_BREAKING     | AGILE            |

@tc:79696
Scenario: Check the voted states in the ice_breaking template in the past retro meeting
Given the retro meeting is created
When the Manager and staff join the retro meeting
And the retro meeting is accessed from both users 
And the ICE_BREAKING template is displayed
And the Manager clicks Like button next to the <state1> state
And the Staff clicks Like button next to the <state2> state
And the votes are registered
And the Manager clicks Next button 
And the AGILE template is displayed
And the Manager clicks Next button 
And the TEAM_HEALTH_CHECK template is displayed
And the Manager clicks End button
And the Manager and staff are redirected to the active retro page
And the Manager accesses the past tab
And the past retro page is displayed
And the Manager clicks on the View button next to the last past meeting
Then the retro info is accessed
And the <state1> and <state2> states are voted in the ICE_BREAKING template
And the AGILE and TEAM_HEALTH_CHECK are unchanged
And the all retro info can be viewed only
Examples:
|state1    |state2    |
|Happy     |Wondering |
|Wondering |Exhausted |
|Exhausted |Confused  |
|Confused  |Happy     |  

@tc:79697
Scenario: Check the written messages in the Agile template in the past retro meeting   
Given the retro meeting is created
When the Manager and staff join the retro meeting
And the retro meeting is accessed from both users 
And the ICE_BREAKING template is displayed
And the Manager clicks Next button 
And the AGILE template is displayed
And the Manager and Staff insert <message> in the Start column
And the Manager and Staff clicks the Send button
And the Manager and Staff insert <message> in the Stop column
And the Manager and Staff clicks the Send button
And the Manager and Staff insert <message> in the Continue column
And the Manager and Staff clicks the Send button
And the Manager clicks Next button 
And the TEAM_HEALTH_CHECK template is displayed
And the Manager clicks End button
And the Manager and Staff are redirected to the active retro page
And the Manager accesses the past tab
And the past page is displayed
And the Manager clicks on the View button next to the last past meeting
Then the retro info is accessed
And the ICE_BREAKING template is unchanged
And the <message> message is presented twice in all columns in AGILE template
And the TEAM_HEALTH_CHECK template is unchanged
Examples:
|message  |
|Hello    |
|Welcome  |
|Let`s go |


@tc:79698
Scenario: Check the votes in the Team Health check template in the past retro meeting
Given the retro meeting is created
When the Manager and staff join the retro meeting
And the retro meeting is accessed from both users 
And the ICE_BREAKING template is displayed
And the Manager clicks Next button 
And the AGILE template is displayed
And the Manager clicks Next button
And the TEAM_HEALTH_CHECK template is displayed
And Manager and Staff click the + button
And Manager and Staff votes <state> state and <status> status for all criteria
And Manager and Staff click Submit button
And the votes are submitted
And the Manager cliks End button
And the Manager and Staff are redirected to the active retro page
And the Manager accesses the past tab
And the past page is displayed
And the Manager clicks on the View button next to the last past meeting
Then the retro info is accessed
And the ICE_BREAKING template is unchanged
And the AGILE template is unchanged
And the all criteria are voted with <state> state and <status> status in Manager and Staff column
And the Reveal result button is not visible
Examples:
|state ||status       |
|Good  ||Improving    |
|Normal||Getting worse|

@tc:79699
Scenario: Check the right meeting duration to be visible in the past retro meeting
Given the retro meeting is created
And the duration is 1 hour
When the Manager and staff join the retro meeting
And the retro meeting is accessed from both users 
And the ICE_BREAKING template is displayed
And the staff clicks Like button next to the HAPPY state
And the vote is registered
And the time start to count down in the up right corner
And the Manager clicks Next button 
And the AGILE template is displayed
And the Manager clicks Next button 
And the TEAM_HEALTH_CHECK template is displayed
And user Manager wait until <minutes> minutes and <seconds> seconds pass
And the Manager clicks End button
And the Manager and staff are redirected to the active retro page
And the Manager accesses the past tab
And the past retro page is displayed
And the Manager clicks on the View button next to the last past meeting
Then the retro info is accessed 
And the <minutes> minutes and <seconds> seconds duration is visible in the up right corner
|minutes|second |
|01     |00     |
|02     |30     |
|30     |00     |

@tc:79700
Scenario: Check the info in past retro meeting to be read only (Ice_breaking template)
Given the retro meeting is ended
And the Manager is on the past retro page
When the Manager clicks on the View button next to the past meeting
And the retro info is accessed
And the Ice_breaking template is displayed
And the Manager clicks Like button next to the <state> state
Then the Like button is not clickable
Examples:
|state     |
|Happy     |
|Wondering |
|Exhausted |
|Confused  |


@tc:79701
Scenario: Check the info in past retro meeting to be read only (Agile template)
Given the retro meeting is ended
And the Manager is on the past retro page
When the Manager clicks on the View button next to the past meeting
And the retro info is accessed
And the Agile template is displayed
And the Manager inserts "Hello" in the <column> column
Then the Manager can not write any messages
Examples:
|column  |
|Start   |
|Stop    |
|Continue|

@tc:79702
Scenario: Check the info in past retro meeting to be read only (Team_Health_Check template)
Given the retro meeting is ended
And the Manager is on the past retro page
When the Manager clicks on the View button next to the past meeting
And the retro info is accessed
And the Team_Health_Check template is displayed
And the Manager clicks on the Team_Health_Check table components 
Then the Team_Health_Check table components are not clickable