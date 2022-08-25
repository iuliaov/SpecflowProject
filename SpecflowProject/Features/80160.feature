Feature: Admin Project Management

Scenario: "Create new project" button - visibility
Given the user is logged in as <user_project_role>
When the user accesses the projects page
Then the [Create new project] button is <state>
Examples:
|user_project_role|state      |
|Admin            |visible    |
|Manager          |not visible|


Scenario: Create a new project
Given the user is logged in with admin credentials
And the user is on the projects page
When the user clicks [Create new project]
And the user types "New project" in the project name input
And the user searches for "manager" in the add Delivery Lead searchbox
And the user selects the desired Delivery Lead
And user cliks [Add] button
And the Delivery Lead is added
And the user clicks [Create] button
Then the project is created
And the project is saved on the projects page

Scenario: Create a new project without a name or a DL
Given the user is logged in with admin credentials
And the user is on the projects page
When the user clicks [Create new project]
And the user types <project_name> name in the project name input
And the user searches for <DL_name> in the add Delivery Lead searchbox
And the user selects the desired Delivery Lead
And user cliks [Add] button
And the Delivery Lead is added
And the user clicks [Create] button
Then the project is created
And the project is saved on the projects page
Examples:
|project_name|DL_name  |
|New project |---------|
|------------|manager  |
|------------|---------|

Scenario: Create a new project with an existing name
Given the user is logged in with admin credentials
And the user is on the projects page
And there is a project with "New project" name
When the user clicks [Create new project]
And the user types "New project" name in the project name input
And the user searches for "manager" in the add Delivery Lead searchbox
And the user selects the desired Delivery Lead
And user cliks [Add] button
And the Delivery Lead is added
And the user clicks [Create] button
Then the project is not created
And the error message "Project name already exists" is displayed

@negative
Scenario: Add more users(DLs) to the newly created project
Given the user is logged in with admin credentials
And the user is on the projects page
When the user clicks [Create new project]
And the user types "New project" name in the project name input
And the user searches for "manager" in the add Delivery Lead searchbox
And the user selects the desired Delivery Lead
And user cliks [Add] button
And the Delivery Lead is added
And the user searches for "veacestest" in the add Delivery Lead searchbox
And the user selects the desired Delivery Lead
And user cliks [Add] button
Then the second Delivery Lead is not added
And an error message is displayed

Scenario: The admin user can not access the created project
Given the user is logged in with admin credentials
And the user is on the projects page
And the user clicks [Create new project]
And the user types "New project" name in the project name input
And the user searches for "manager" in the add Delivery Lead searchbox
And the user selects the desired Delivery Lead
And user cliks [Add] button
And the Delivery Lead is added
And the user clicks [Create] button
And the project is created
And the project is saved on the projects page
When the user want to access it 
Then the acess is restricted

Scenario: Project information is saved on page reload
Given the user is logged in with admin credentials
And the user is on the projects page
And the user clicks [Create new project]
And the user types "New project" name in the project name input
And the user searches for "manager" in the add Delivery Lead searchbox
And the user selects the desired Delivery Lead
And user cliks [Add] button
And the Delivery Lead is added
When the user press the [Refresh] button
Then the user remain on the same page
And the info is not changed on the page

Scenario: User is redirected to the main page when press Back button
Given the user is logged in with admin credentials
And the user is on the projects page
And the user clicks [Create new project]
And the user types "New project" name in the project name input
And the user searches for "manager" in the add Delivery Lead searchbox
And the user selects the desired Delivery Lead
And user cliks [Add] button
And the Delivery Lead is added
When the user press the [Back] button
Then the user is redirected to the main page
And the project is not created