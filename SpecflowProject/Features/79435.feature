Feature: Feedback 

@tc:79706
@retro @feedback @positive
Scenario: Popup appears after Retrospective meeting for staff
Given  the user is logged in as a <user_role>
And the user is on <page> 
When the user finishes the retrospective meeting
Then a popup for feedback appears 
And user can vote
Examples:
|  user_role   | page                  |
| staff        |    retro meeting      |

@tc:79707
@retro @feedback @positive
Scenario: Popup doesn't appear after Retrospective meeting for manager
Given  the user is logged in as a <user_role>
And the user is on <page> 
When the user finishes the retrospective meeting
Then a popup for feedback doesn't appear
Examples:
|  user_role     | page                  |
| manager        |    retro meeting      |

@tc:79708
@retro @feedback @positive
Scenario: Popup doesn't appear after Daily Stand-Up meeting 
Given  the user is logged in as a <user_role>
And the user is on <page> 
When the user finishes the daily stand-up meeting
Then a popup for feedback doesn't appear
Examples:
|  user_role     | page                   |
| manager        |    daily stand-up      |
| staff          |    daily stand-up      |

@tc:79709
@retro @feedback @positive
Scenario: User can vote a score from 1 to 5
Given  the user is logged in as a <user_role>
And the user is on <page> 
When the user finishes the daily stand-up meeting
Then a popup for feedback appears
And user can vote a <score> from 1 to 5
And user can confirm the vote 
Examples:
|  user_role     | page                   | score   |
| staff          |    daily stand-up      |   2     |
| staff          |    daily stand-up      |   4     |

@tc:79710
@retro @feedback @positive
Scenario: User can change the score selection before submiting it
Given  the user is logged in as a <user_role>
And the user is on <page> 
When the user finishes the daily stand-up meeting
Then a popup for feedback appears
And user can vote a <score> from 1 to 5
And user can change and select another <new_score>
And user can confirm the vote 
Examples:
|  user_role     | page                   | score   | new_score  |
| staff          |    daily stand-up      |   2     |    3       |
| staff          |    daily stand-up      |   4     |    1       |
| staff          |    daily stand-up      |   5     |    2       |
| staff          |    daily stand-up      |   1     |    5       |





