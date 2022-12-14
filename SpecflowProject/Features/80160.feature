Feature: Admin Project Management

@tc:80363
Scenario: "New project" button - visibility
Given the user is logged in as <user_project_role>
When the user accesses the projects page
Then the [New project] button is <state>
Examples:
|user_project_role|state      |
|Admin            |visible    |
|Manager          |not visible|


@tc:80364
Scenario: Create a new project
Given the user is logged in with admin credentials
And the user is on the projects page
And the user clicks [New project]
And the user types "Project1" in the project name input
And the user searches for "manager@amdaris.com" in the add Delivery Lead searchbox
And the user selects the desired Delivery Lead
And the Delivery Lead is added
When the user clicks on [Create] button
Then the project is created
And the following message is displayed: "The project was created successfully!"

@tc:80365
Scenario: Create a new project without adding the name or the email
Given the user is logged in with admin credentials
And the user is on the projects page
And the user clicks on [New project] button
And the user types <project_name> name in the project name input
And the user adds the <DL_name> Delivery Lead name
When the user clicks [Create] button
Then the project is not created
And the following error message <error_message> is displayed on the screen
Examples:
|project_name|DL_name  |error_message                                                      |
|New project |---------|The DL email you provided does not exist!                          |
|------------|manager  |The project name is invalid!                                       |
|------------|---------|The project name is invalid and the email provided does not exist! |

@tc:80366
Scenario: Create a new project with an existing name
Given the user is logged in with admin credentials
And the user is on the projects page
And a project with "Project 1" name already exists
When the user clicks [New project]
And the user types "Project 1" name in the project name input
And the user searches for "manager" in the add Delivery Lead searchbox
And the user selects the desired Delivery Lead
And user cliks [Add] button
And the Delivery Lead is added
And the user clicks [Create] button
Then the error message "A project with this name already exists!" is displayed
And the project is not created

@tc:80367
Scenario: The admin user can not access the created project
Given the user is logged in with admin credentials
And the user is on the projects page
And the user clicks [New project]
And the user types "New project" name in the project name input
And the user adds the Delivery Lead "manager@amdaris.com"
And the user clicks on [Create] button
And the project is created
When the user returns on projects
Then the user can not find "New project" project on projects page

@tc:80372
Scenario: The manager user can access the created project
Given the user1 is logged in with admin credentials
And user2 is logged in with manager credentials
And user2 has the email address "manager@amdaris.com"
And the user1 is on the projects page
And the user1 clicks [New project]
And the user1 types "New project" name in the project name input
And the user1 adds the Delivery Lead "manager@amdaris.com" to the project
And the user clicks on [Create] button
And the project is successfully created
When the user2 moves to projects page
Then the user can find "New project" project on projects page

@tc:80368
Scenario: Press Back button or refresh page while creating a project
Given the user is logged in with admin credentials
And the user is on the projects page
And the user clicks [New project]
And the user types "Project1" name in the project name input
And the user searches for "manager@amdaris.com" in the add Delivery Lead searchbox
And adds the Delivery Lead
When the user press the <button> button
Then the user is redirected to the main page
And the project is not created
And the fields in the create form are reset
Examples:
|button      |
|Back        |
|Reload      | 
|New project |