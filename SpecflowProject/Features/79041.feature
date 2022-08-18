Feature: Request NPS


@tc:79925
@standup @nps @positive
Scenario: Pop-up appears after user exits a DS
Given  the user is logged in as a <user_role>
And the user is on <page>
And the user joins a Daily Stand-Up meeting for 5 times
When the user exits the DS for the 5th time
Then a feedback pop-up appears
And the voting pop-up has the following question: 'How likely are you to recommend DL ToolKit to a friend ?'
Examples:
|  user_role           |page                                 |
| manager              |http://localhost:3000/project/1/daily|
| staff                |http://localhost:3000/project/1/daily|

@tc:79926
@standup @nps @positive
Scenario: Submit the vote in DS feedback pop-up
Given  the user is logged in as a <user_role>
And the user is on <page>
And the user joins a Daily Stand-Up meeting for 5 times
And the user exits the DS for the 5th time
And a pop-up appears
And the user votes with <score> stars
When user clicks on [Confirm] button
Then the user is redirected to the main page
And the following message appears on the screen "Thank you for your feedback !"
Examples:
|  user_role           |page                                 | score       |
| manager              |http://localhost:3000/project/1/daily| 5           |
| staff                |http://localhost:3000/project/1/daily| 5           |
| manager              |http://localhost:3000/project/1/daily| 4           |
| staff                |http://localhost:3000/project/1/daily| 4           |
| manager              |http://localhost:3000/project/1/daily| 3           |
| staff                |http://localhost:3000/project/1/daily| 3           |
| manager              |http://localhost:3000/project/1/daily| 2           |
| staff                |http://localhost:3000/project/1/daily| 2           |
| manager              |http://localhost:3000/project/1/daily| 1           |
| staff                |http://localhost:3000/project/1/daily| 1           |

@tc:79927
@standup @nps @positive
Scenario: Change the selected score
Given  the user is logged in as a <user_role>
And the user is on <page>
And the user joins a Daily Stand-Up meeting for 5 times
And the user exits the DS for the 5th time
And a feedback pop-up appears
And the user votes with 5 stars
When the user changes the score to 4 stars
Then 4 stars are highlighted
And the user clicks on [Confirm]
And the user successfully submits the feedback
Examples:
|  user_role           |page                                 |
| manager              |http://localhost:3000/project/1/daily|
| staff                |http://localhost:3000/project/1/daily|

@tc:79928
@standup @nps
Scenario: User abandons selection in feedback pop-up
Given  the user is logged in as a <user_role>
And the user is on <page>
And the user joins a Daily Stand-Up meeting for 5 times
And the user exits the DS for the 5th time
And a pop-up appears
And the user votes with <score> stars
When user clicks outside the feedback pop-up
Then the user is redirected to the main page
And the feedback is not sent
And no message appears on the screen
Examples:
|  user_role           |page                                 | score       |
| manager              |http://localhost:3000/project/1/daily| 5           |
| staff                |http://localhost:3000/project/1/daily| 5           |


@tc:79929
@standup @nps @positive
Scenario: Close the voting pop-up without voting
Given  the user is logged in as a <user_role>
And the user is on <page>
And the user joins a Daily Stand-Up meeting for 5 times
And the user exits the DS for the 5th time
And a pop-up appears
And the user does not vote
When user clicks on [x] button in the feedback pop-up
Then the user is redirected to the main page
And the feedback is not sent
And no message appears on the screen
Examples:
|  user_role           |page                                 |
| manager              |http://localhost:3000/project/1/daily|
| staff                |http://localhost:3000/project/1/daily|

@tc:79930
@standup @nps
Scenario: Click on Confirm without voting
Given  the user is logged in as <user_role>
And the user is on <page>
And the user joins a Daily Stand-Up meeting for 5 times
And the user exits the DS for the 5th time
And a feedback pop-up appears
And the user does not vote in the feedback pop-up
When user clicks on [Confirm] button in the feedback pop-up
Then nothing changes in the pop-up
And the feedback pop-up remains opened
And no rating is chosen
Examples:
|  user_role           |page                                 |
| manager              |http://localhost:3000/project/1/daily|
| staff                |http://localhost:3000/project/1/daily|

@tc:79931
@standup @nps @positive
Scenario: Close the voting pop-up without voting
Given  the user is logged in as a <user_role>
And the user is on <page>
And the user joins a Daily Stand-Up meeting for 5 times
And the user exits the DS for the 5th time
And a pop-up appears
And the user votes with <score> nr_of_stars
When user clicks on [x] button in the feedback pop-up
Then the user is redirected to the main page
And the feedback is not sent
And no message appears on the screen
Examples:
|  user_role           |page                                 | score       |
| manager              |http://localhost:3000/project/1/daily| 5           |
| staff                |http://localhost:3000/project/1/daily| 5           |

@tc:79932
@standup @nps @positive
Scenario: Feedback pop-up does not reapear when user did not submit the vote
Given  the user is logged in as a <user_role>
And the user is on <page>
And the user joins a Daily Stand-Up meeting for 5 times
And the user exits the DS for the 5th time
And the user closes the feedback pop-up without sending feedback
And the user joins a DS meeting again
When the user exits the meeting
Then the user is redirected to the main page
And no pop-up appears on the screen
Examples:
|  user_role           |page                                 | score       |
| manager              |http://localhost:3000/project/1/daily| 5           |
| staff                |http://localhost:3000/project/1/daily| 5           |
| manager              |http://localhost:3000/project/1/daily| 4           |
| staff                |http://localhost:3000/project/1/daily| 4           |
| manager              |http://localhost:3000/project/1/daily| 3           |
| staff                |http://localhost:3000/project/1/daily| 3           |
| manager              |http://localhost:3000/project/1/daily| 2           |
| staff                |http://localhost:3000/project/1/daily| 2           |
| manager              |http://localhost:3000/project/1/daily| 1           |
| staff                |http://localhost:3000/project/1/daily| 1           |


@tc:79933
@standup @nps @positive
Scenario: Feedback pop-up does not reapear when user submited the vote
Given  the user is logged in as a <user_role>
And the user is on <page>
And the user joins a Daily Stand-Up meeting for 5 times
And the user exits the DS for the 5th time
And the user succesfully sends the feedback
And the user joins <nr_of_meetings> DS meeting
When the user exits the <nr_of_meetings> meeting
Then the user is redirected to the main page
And no pop-up appears on the screen
Examples:
|  user_role           |page                                 |nr_of_meetings|
| manager              |http://localhost:3000/project/1/daily|1             |
| staff                |http://localhost:3000/project/1/daily|1             |
| manager              |http://localhost:3000/project/1/daily|2             |
| staff                |http://localhost:3000/project/1/daily|2             |
| manager              |http://localhost:3000/project/1/daily|3             |
| staff                |http://localhost:3000/project/1/daily|3             |
| manager              |http://localhost:3000/project/1/daily|4             |
| staff                |http://localhost:3000/project/1/daily|4             |

@tc:79934
@standup @nps @positive
Scenario: Feedback pop-up reapears 5 meetings after the user submited the vote
Given  the user is logged in as a <user_role>
And the user is on <page>
And the user joins a Daily Stand-Up meeting for 5 times
And the user exits the DS for the 5th time
And a pop-up appears
And the user succesfully sends the feedback
And the user joins a Daily Stand-Up meeting for 5 times
When the user exits the DS for the 5th time
Then a feedback pop-up appears
Examples:
|  user_role           |page                                 |
| manager              |http://localhost:3000/project/1/daily|
| staff                |http://localhost:3000/project/1/daily|
| manager              |http://localhost:3000/project/1/daily|
| staff                |http://localhost:3000/project/1/daily|
| manager              |http://localhost:3000/project/1/daily|
| staff                |http://localhost:3000/project/1/daily|
| manager              |http://localhost:3000/project/1/daily|
| staff                |http://localhost:3000/project/1/daily|
| manager              |http://localhost:3000/project/1/daily|
| staff                |http://localhost:3000/project/1/daily|

@tc:79935
@standup @nps @positive
Scenario: Close the "Thank you" pop up
Given  the user is logged in as a <user_role>
And the user is on <page>
And the user joins a Daily Stand-Up meeting for 5 times
And the user exits the DS for the 5th time
And the feedback pop-up appears
And the user succesfully submits his votes
And the user is redirected to the main page
And the following message appears on the screen "Thank you for your feedback !"
When the user clicks on [x] button next to the "Thank you..." message
Then the feedback window is closed
Examples:
|  user_role           |page                                 |
| manager              |http://localhost:3000/project/1/daily|
| staff                |http://localhost:3000/project/1/daily|
| manager              |http://localhost:3000/project/1/daily|
| staff                |http://localhost:3000/project/1/daily|
| manager              |http://localhost:3000/project/1/daily|
| staff                |http://localhost:3000/project/1/daily|
| manager              |http://localhost:3000/project/1/daily|
| staff                |http://localhost:3000/project/1/daily|
| manager              |http://localhost:3000/project/1/daily|
| staff                |http://localhost:3000/project/1/daily|

@tc:79940
@standup @nps @positive
Scenario: Pop-up stays on the page after page reload
Given  the user is logged in as a <user_role>
And the user is on <page>
And the user joins a Daily Stand-Up meeting for 5 times
And the user exits the DS for the 5th time
And a feedback pop-up appears
When the user reloads the web page
Then the feedback pop-up remains on the page
Examples:
|  user_role           |page                                 |
| manager              |http://localhost:3000/project/1/daily|
| staff                |http://localhost:3000/project/1/daily|


@tc:79941
@standup @nps @positive
Scenario: Submit the vote in DS feedback pop-up with DS meetings in different projects
Given  the user is logged in as a <user_role>
And the user is on <page>
And the user joins 2 Daily Stand-Up meetings in Project 1
And the user joins 2 Daily Stand-Up meetings in Project 2
And the user exits the DS for the 5th time
And a pop-up appears
And the user votes with <score> nr_of_stars
When user clicks on [Confirm] button
Then the user is redirected to the main page
And the following message appears on the screen "Thank you for your feedback !"
Examples:
|  user_role           |page                         | score       |
| manager              |http://localhost:3000/project| 5           |
| manager              |http://localhost:3000/project| 4           |
| manager              |http://localhost:3000/project| 3           |
| manager              |http://localhost:3000/project| 2           |
| manager              |http://localhost:3000/project| 1           |



