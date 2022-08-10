Feature: Timer 


@tc:79546
@retro @timer @positive
Scenario: Verify if a new retrospective template timer is saved
Given  the user is logged in as a <user_role>
And the user is on <page> 
When the user presses the Create Template button
And the user writes the template name
And drags template card contents to the drop area
And sets the timer at <set_time>
And clicks Create button
Then the template is saved
And the template timer is set at <real_time>
Examples:
|  user_project_role   | page                  |set_time |real_time |
| manager              |    retro templates    |  00:45  |  00:45   |
| manager              |    retro templates    |  01:45  |  01:45   |
| manager              |    retro templates    |  02:15  |  02:15   |
| manager              |    retro templates    |  04:00  |  04:00   |


@tc:79547
@retro @timer @positive
Scenario: Verify if new retrospective template timer is updated
Given  the user is logged in as a <user_role>
And the user is on <page> 
When the user presses on a retrospective template
And sets the timer at <set_time>
And clicks Update button
Then the template is saved
And the template timer is set at <real_time>
Examples:
|  user_project_role   | page                  |set_time |real_time |
| manager              |    retro templates    |  00:45  |  00:45   |
| manager              |    retro templates    |  01:45  |  01:45   |
| manager              |    retro templates    |  02:15  |  02:15   |
| manager              |    retro templates    |  04:00  |  04:00   |

