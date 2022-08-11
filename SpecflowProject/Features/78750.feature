Feature: Retro Template 

@tc:79627
@retro @use @positive
Scenario: Verify if use button works.
Given  the user is logged in as a <user_role>
And the user is on <page> 
When the user presses the Use Template button
Then reuse retrospective template page is accessed 
Examples:
|  user_role   | page                  |
| manager      |    retro templates    |

@tc:79628
@retro @use @positive
Scenario: Verify if user can create retrospective from template.
Given  the user is logged in as a <user_role>
And the user is on <page> 
When the user presses the Use Template button
And the user writes "RetroTest" as retro template name
And the user sets timer at <timer>
And the user chooses <date> and <time>
And the user presses Create button
Then retrospective meeting is created 
Examples:
|  user_role   | page                  |timer   | date      |     time | 
| manager      |    retro templates    | 4:00   |2022-08-11 |    16:00 |


@tc:79629
@retro @use @positive
Scenario: Verify if user is required to add event name, time and date.
Given  the user is logged in as a <user_role>
And the user is on <page> 
When the user presses the Use Template button
And the user presses Create button
Then retrospective meeting is not created 
Examples:
|  user_role   | page                  | 
| manager      |    retro templates    | 


@tc:79630
@retro @use @positive
Scenario: Verify if user is required to add event name.
Given  the user is logged in as a <user_role>
And the user is on <page> 
When the user presses the Use Template button
And the user sets timer at <timer>
And the user chooses <date> and <time>
And the user presses Create button
Then retrospective meeting is not created 
Examples:
|  user_role   | page                  |timer   | date      |     time | 
| manager      |    retro templates    | 4:00   |2022-08-11 |    16:00 |

@tc:79631
@retro @use @positive
Scenario: Verify if user is required to add time.
Given  the user is logged in as a <user_role>
And the user is on <page> 
When the user presses the Use Template button
And the user writes "RetroTest" as retro template name
And the user sets timer at <timer>
And the user chooses <date> 
And the user presses Create button
Then retrospective meeting is not created 
Examples:
|  user_role   | page                  |timer   | date      |   
| manager      |    retro templates    | 4:00   |2022-08-11 | 


@tc:79632
@retro @use @positive
Scenario: Verify if user is required to add date. 
Given  the user is logged in as a <user_role>
And the user is on <page> 
When the user presses the Use Template button
And the user writes "RetroTest" as retro template name
And the user sets timer at <timer>
And the user chooses <time>
And the user presses Create button
Then retrospective meeting is created 
Examples:
|  user_role   | page                  |timer   |     time | 
| manager      |    retro templates    | 4:00   |    16:00 |