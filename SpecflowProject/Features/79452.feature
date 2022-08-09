Feature: Retro meeting sync


Scenario: Retro template order doesn't change on page reload
Given the user1 is logged in as a <user_project_role_1>
And the user1 is on <page> 
And the user1 joins a meeting
And the user2 is logged in as a <user_project_role_2> in a new incognito tab
And the user2 is on <page> 
And the user2 joins the same meeting as user1
And user1 moves to the second template
And user2 is redirected to the second template
When user1 reloads the browser page
Then nothing changes in user1 window
And nothing changes in user2 window
Examples:
|  user_project_role_1   |  user_project_role_2   | meeting_tab  |              page                   |
|  manager               |  staff                 |  active      |http://localhost:3000/project/1/retro|

Scenario: Retro template information is saved on page reload
GGiven the user1 is logged in as a <user_project_role_1>
And the user1 is on <page> 
And the user1 joins a meeting
And the user2 is logged in as a <user_project_role_2> in a new incognito tab
And the user2 is on <page> 
And the user2 joins the same meeting as user1
And the user1 moves to the Agile template
And the user1 adds a line <chat_line> in the Notes
And user2 is redirected to the Agile template
When user1 reloads the browser page
Then nothing changes in user1 window
And nothing changes in user2 window
And the chat line <chat_line> is present in Notes in user1 window
And the chat line <chat_line> is present in Notes in user2 window
Examples:
|  user_project_role_1   |  user_project_role_2   | meeting_tab  |              page                   |chat_line             |
|  manager               |  staff                 |  active      |http://localhost:3000/project/1/retro|Welcome to the jungle!|