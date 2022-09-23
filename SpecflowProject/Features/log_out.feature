Feature: Logging Out

@LoggingOut @positive
Scenario: User is logged out after pressing log out button
Given I am logged in as <User>
When I press log out button on the left side panel
Then I am logged out and redirected to the main login page
|   User   |
| Manager  |
| Admin    |    

@LoggingOut @positive
Scenario: User can log into another account after logging out
Given I am logged in as <User>
When I press log out button on the left side panel
And I get redirected to the main login page
Then I can enter another account credentials and log in
|  User   |
| Manager |
| Admin   |

@LoggingOut @positive
Scenario: User is not logged in after pressing log out and back button
Given I am logged in as <User>
When I press log out button on the left side panel
And I get redirected to the main login page
And I press back button in the left corner of the browser 
Then I won't be able to access the page
And an authentification will be required
|  User   |
| Manager |
| Admin   |