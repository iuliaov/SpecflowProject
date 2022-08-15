Feature: Feedback 

@tc:79713
@retro @feedback @positive
Scenario: User can click close popup button
Given  the user is logged in as a <user_role>
And the user is on <page> 
When the user finishes the retrospective meeting
Then a popup for feedback appears 
And user can click close popup button
Examples:
|  user_role   | page                  |
| staff        |    retro meeting      |

@tc:79714
@retro @feedback @positive
Scenario: User can close popup by clicking anywhere on page
Given  the user is logged in as a <user_role>
And the user is on <page> 
When the user finishes the retrospective meeting
Then a popup for feedback appears 
And user can click anywhere on page except popup
And the popup will close
Examples:
|  user_role   | page                  |
| staff        |    retro meeting      |

