Feature: Pagination


@tc:79340
@standup @pagination @positive
Scenario: Verify if link buttons are disabled then the list contains just 10 items
Given  the user is logged in as a <user_role>
And the user is on <page> 
And the list of <meeting_tab> should contain 10 items
When the user presses the <link> button
Then the button is disabled 
And nothing happens
And the same list is displayed
Examples:
|  user_project_role   | meeting_tab  |link     |page                                 |
| manager              |    active    |previous |http://localhost:3000/project/1/daily|
| staff                |    active    |next     |http://localhost:3000/project/1/daily|
| manager              |    past      |previous |http://localhost:3000/project/1/daily|
| staff                |    past      |next     |http://localhost:3000/project/1/daily|
| manager              |    active    |previous |http://localhost:3000/project/1/retro|
| staff                |    active    |previous |http://localhost:3000/project/1/retro|
| staff                |    past      |next     |http://localhost:3000/project/1/retro|
| manager              |    templates |previous |http://localhost:3000/project/1/retro|
| staff                |    templates |next     |http://localhost:3000/project/1/retro|
| manager              |    past      |next     |http://localhost:3000/project/1/retro|


@tc:79341
@standup @pagination @positive
Scenario: Verify if link buttons are displayed then the list contains  0 items
Given  the user is logged in as a <user_role>
And the user is on <page> 
And the list of <meeting_tab> should contain 0 items
Then the user should see a message that there are no items to be displayed
Examples:
|  user_project_role   | meeting_tab  |page                                 |
| manager              |    active    |http://localhost:3000/project/1/daily|
| staff                |    active    |http://localhost:3000/project/1/daily|
| manager              |    past      |http://localhost:3000/project/1/daily|
| staff                |    past      |http://localhost:3000/project/1/daily|
| manager              |    active    |http://localhost:3000/project/1/retro|
| staff                |    active    |http://localhost:3000/project/1/retro|
| staff                |    past      |http://localhost:3000/project/1/retro|
| manager              |    templates |http://localhost:3000/project/1/retro|
| staff                |    templates |http://localhost:3000/project/1/retro|
| manager              |    past      |http://localhost:3000/project/1/retro|

@tc:79342
@standup @pagination @positive
Scenario: Verify if on the page are displayed maximum 10 items
Given  the user is logged in as a <user_role>
And the user is on <page> 
And the list of <meeting_tab> should contain <number_of_items> items
Then the pagination should display that there are pages (number_of_items/10)
And the total items should be <number_of_items>
And on one page should be displayed just 10 items
Examples:
|  user_project_role   | meeting_tab  |page                                 |number_of_items|
| manager              |    active    |http://localhost:3000/project/1/daily|      11       |
| staff                |    past      |http://localhost:3000/project/1/daily|      21       |
| manager              |    active    |http://localhost:3000/project/1/retro|      19       |
| staff                |    past      |http://localhost:3000/project/1/retro|      25       |
| manager              |    templates |http://localhost:3000/project/1/retro|      31       |


@tc:79343
@standup @pagination @positive
Scenario: Verify if the current page is active in the pagination box
Given  the user is logged in as a <user_role>
And the user is on <page> 
And the list of <meeting_tab> should contain more than 10 items
And the first page should be active
And the previous button should be disabled
When the user presses next button
Then the second page shoud be active
And the previous button should be active

Examples:
|  user_project_role   | meeting_tab  |page                                 |
| manager              |    active    |http://localhost:3000/project/1/daily|
| staff                |    past      |http://localhost:3000/project/1/daily|
| manager              |    active    |http://localhost:3000/project/1/retro|
| staff                |    past      |http://localhost:3000/project/1/retro|
| manager              |    templates |http://localhost:3000/project/1/retro|



@tc:79351
@standup @page @positive
Scenario: Verify if the total items displayed is the same as the real number of this items 
Given  the user is logged in as a <user_role>
And the user is on <page> 
And the list of <meeting_tab> should contain <number_of_items> items
Then the <number_of_items> is equal to <real_number> of items

Examples:
|user_project_role| meeting_tab |number_of_items|real_number|
|manager          |   active    |      14       |    14     | 
| staff           |   past      |      27       |    27     | 
| manager         |   active    |      6        |    6      | 
| staff           |   past      |      11       |    11     | 
| manager         |   templates |      35       |    35     | 
