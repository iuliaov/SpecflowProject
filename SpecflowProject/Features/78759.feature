Feature: Voting Modal
    Description: The purpose of this feature is to test the functionality of the Voting modal in Team Health Checking template

Background: 
Given user1 is logged in as <user_project_role>
Examples:
|user_project_role|
|manager|
And user2 is logged in as <user_project_role>
Examples:
|user_project_role|
|staff|
And user1 is on <page>
And user2 is on <page>
And user1 joins a Retro meeting
And user2 joins the Retro meeting joined by user1
And user1 moves to <template> template
And the user2 is redirected to the <template> template
Examples:
|page                                 | template    |
|http://localhost:3000/project/1/retro| Health_Check|



Scenario: Submit the Votes
And the <user_id> user clicks on '+' button
And the Voting modal is opened
And the <user_id> user clicks on <vote_button_1> state
And the <user_id> user clicks on <vote_button_2> status
And the <user_id> user presses the 'Next' button
And the <user_id> user is redirected to the next page in the Voting modal
And the <user_id> user clicks on <vote_button_1> state
And the <user_id> user clicks on <vote_button_2> status
And the <user_id> user presses the 'Next' button
And the <user_id> user is redirected to the next page in the Voting modal
And the <user_id> user clicks on <vote_button_1> state
And the <user_id> user clicks on <vote_button_2> status
And the <user_id> user presses the 'Next' button
And the <user_id> user is redirected to the next page in the Voting modal
And the <user_id> user clicks on <vote_button_1> state
And the <user_id> user clicks on <vote_button_2> status
And the <user_id> user presses the 'Next' button
And the <user_id> user is redirected to the last page in the Voting modal
And the <user_id> user clicks on <vote_button_1> state
And the <user_id> user clicks on <vote_button_2> status
When the <user_id> user presses the 'Submit' button
Then the <user_id> user is redirected to the Health_Check table
And the <user_id> user can see his votes in the table in 'You' collumn
And 
Examples:
|user_id |vote_button_1  |vote_button_2      |
|user1   | Good          |Improving          |
|user1   | Good          |Constant           |
|user1   | Good          |Getting Worse      |
|user1   | Normal        |Improving          |
|user1   | Normal        |Constant           |
|user1   | Normal        |Getting Worse      |
|user1   | Bad           |Improving          |
|user1   | Bad           |Constant           |
|user1   | Bad           |Getting Worse      |
|user2   | Good          |Improving          |
|user2   | Good          |Constant           |
|user2   | Good          |Getting Worse      |
|user2   | Normal        |Improving          |
|user2   | Normal        |Constant           |
|user2   | Normal        |Getting Worse      |
|user2   | Bad           |Improving          |
|user2   | Bad           |Constant           |
|user2   | Bad           |Getting Worse      |


Scenario: Submit the vote before voting
And the <user_id> user clicks on '+' button
And the Voting modal is opened
And the <user_id> user clicks on <vote_button_1> state
And the <user_id> user clicks on <vote_button_2> status
And the <user_id> user presses the 'Next' button
And the <user_id> user is redirected to the next page in the Voting modal
And the <user_id> user clicks on <vote_button_1> state
And the <user_id> user clicks on <vote_button_2> status
And the <user_id> user presses the 'Next' button
And the <user_id> user is redirected to the next page in the Voting modal
And the <user_id> user clicks on <vote_button_1> state
And the <user_id> user clicks on <vote_button_2> status
And the <user_id> user presses the 'Next' button
And the <user_id> user is redirected to the next page in the Voting modal
And the <user_id> user clicks on <vote_button_1> state
And the <user_id> user clicks on <vote_button_2> status
And the <user_id> user presses the 'Next' button
And the <user_id> user is redirected to the last page in the Voting modal
And the <user_id> user does not choose the state and status
When the <user_id> user presses the 'Submit' button
Then the user is kept on the page
And the <user_id> user can see his votes in the table in 'You' collumn
And 
Examples:
|user_id |vote_button_1  |vote_button_2      |
|user1   | Good          |Improving          |
|user1   | Good          |Constant           |
|user1   | Good          |Getting Worse      |
|user1   | Normal        |Improving          |
|user1   | Normal        |Constant           |
|user1   | Normal        |Getting Worse      |
|user1   | Bad           |Improving          |
|user1   | Bad           |Constant           |
|user1   | Bad           |Getting Worse      |
|user2   | Good          |Improving          |
|user2   | Good          |Constant           |
|user2   | Good          |Getting Worse      |
|user2   | Normal        |Improving          |
|user2   | Normal        |Constant           |
|user2   | Normal        |Getting Worse      |
|user2   | Bad           |Improving          |
|user2   | Bad           |Constant           |
|user2   | Bad           |Getting Worse      |

Scenario: The user closes the voting Modal before voting
And the <user_id> clicks on '+' button
And the Voting modal is opened
When the user presses the 'x' button
Then voting window is closed 
And the user is redirected to the Health_Check template
Examples:
|user_id   |
| user1    |
| user2    |

Scenario: Close the voting Modal on page Reload
And the <user_id> clicks on '+' button
And the Voting modal is opened
And the user clicks on 'Good' state
And the user clicks on 'Improving' status
And the <user_id> user presses the 'Next' button
And the <user_id> user is redirected to the next page in the Voting modal
And the name of the criteria changes
And the number of the criteria changes to "2/5"
When the user presses the reloads the page
Then voting window is closed 
And the user is redirected to the Health_Check template
And the the votes added are not displayed in the table
Examples:
|user_id   |
| user1    |
| user2    |

Scenario: The user moves to the next page after voting
And the <user_id> user clicks on '+' button
And the Voting modal is opened
And the user clicks on 'Good' status
And the user clicks on 'Improving' status
When the <user_id> user presses the 'Next' button
Then the <user_id> user is redirected to the next page in the Voting modal
And the name of the criteria changes
And the number of the criteria changes to "2/5"
Examples:
|user_id   |
| user1    |
| user2    |

Scenario: The user clicks outside the voting modal
And the <user_id> user clicks on '+' button
And the Voting modal is opened
And the user clicks on 'Good' status button
And the user clicks on 'Improving' state button
When the <user_id> user clicks on the screen, outside the voting window
Then the <user_id> user is kept on the same page in the Voting modal
And nothing changes
Examples:
|user_id   |
| user1    |
| user2    |

Scenario: The user cannot move to the next page if he didn't vote
And the <user_id> user clicks on '+' button
And the Voting modal is opened
When the <user_id> user presses the 'Next' button
Then nothing happens
And the <user_id> user cannot move to the next page
Examples:
|user_id   |
| user1    |
| user2    |

Scenario: Change a previous vote
And the <user_id> user clicks on '+' button
And the Voting modal is opened
And the <user_id> user clicks on 'Good' state
And the <user_id> user clicks on 'Improving' status
And the <user_id> user presses the 'Next' button
And the <user_id> user is redirected to the next page in the Voting modal
And the <user_id> user presses the 'Back' button
And the <user_id> user is redirected to the previous page in the Voting modal
And the 'Good' state and 'Improving' status are highlighted
When the <user_id> user changes the vote on 'Bad' state 
Then the user is allowed to change the vote
Examples:
|user_id   |
| user1    |
| user2    |

Scenario: Choose status before state
And the <user_id> clicks on '+' button
And the Voting modal is opened
When the user clicks on 'Improving' status
Then the status button is not highlighted
And the user can not click on 'Next'
Examples:
|user_id   |
| user1    |
| user2    |

Scenario: Previous choices are saved
And the <user_id> user clicks on '+' button
And the Voting modal is opened
And the <user_id> user clicks on <vote_button_1> state
And the <user_id> user clicks on <vote_button_2> status
And the <user_id> user presses the 'Next' button
And the <user_id> user is redirected to the next page in the Voting modal
And the <user_id> user clicks on <vote_button_3> state
And the <user_id> user clicks on <vote_button_4> status
And the <user_id> user presses on the 'Back' button
And the <user_id> user presses the 'Next' button
Then the <user_id> user is redirected to the next page in the Voting modal
And the <user_id> user can see <vote_button_3> state and <vote_button_3> status choices
And 
Examples:
|user_id |vote_button_1  |vote_button_2      |vote_button_3  |vote_button_4      |
|user1   | Good          |Improving          | Bad           |Getting Worse      |
|user1   | Good          |Constant           | Bad           |Constant           |
|user1   | Good          |Getting Worse      | Bad           |Improving          |
|user1   | Normal        |Improving          | Good          |Getting Worse      |
|user1   | Normal        |Constant           | Good          |Constant           |
|user1   | Normal        |Getting Worse      | Good          |Improving          |
|user1   | Bad           |Improving          | Normal        |Getting Worse      |
|user1   | Bad           |Constant           | Normal        |Constant           |
|user1   | Bad           |Getting Worse      | Normal        |Improving          |
|user2   | Good          |Improving          | Bad           |Getting Worse      |
|user2   | Good          |Constant           | Bad           |Constant           |
|user2   | Good          |Getting Worse      | Bad           |Improving          |
|user2   | Normal        |Improving          | Good          |Getting Worse      |
|user2   | Normal        |Constant           | Good          |Constant           |
|user2   | Normal        |Getting Worse      | Good          |Improving          |
|user1   | Bad           |Improving          | Normal        |Getting Worse      |
|user1   | Bad           |Constant           | Normal        |Constant           |
|user1   | Bad           |Getting Worse      | Normal        |Improving          |


