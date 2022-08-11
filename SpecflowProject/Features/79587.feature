Feature: Keep selected user after refresh


Scenario: Keep selected user after refresh
Given the user1 is logged in as a <user_project_role_1>
And the user1 joins a DS meeting
And the user2 is logged in as a <user_project_role_2> in a new incognito tab
And the user2 joins the same DS meeting as user1
And user1 spins the wheel
And the same participant is chosen for both users 
When user2 reloads the browser page
Then the same number of participants is on the wheel in user2 browser window
And the same participant as before refresh is chosen on the wheel
And nothing changes in user1 window
Examples:
|  user_project_role_1   |  user_project_role_2   |              page                   |
|  manager               |  staff                 |http://localhost:3000/project/1/daily|