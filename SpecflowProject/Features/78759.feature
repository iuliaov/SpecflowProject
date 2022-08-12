Feature: Voting Modal

# Background: 
#Given user1 is logged in with manager permissions
#And user2 is logged in with staff permissions
#And user1 joins a Retro meeting
#And user2 joins the Retro meeting joined by user1
#And user1 moves to Health_Check template
#And the user2 is redirected to the <template> template

@tc:79576
Scenario: Submit the Votes
And the <user_permissions> clicks on '+' button
And the Voting modal is opened
And the <user_permissions> clicks on <vote_button_1> state button
And the <user_permissions> clicks on <vote_button_2> status button
And the <user_permissions> presses the 'Next' button
And the <user_permissions> is redirected to the next page in the Voting modal
And the <user_permissions> clicks on <vote_button_1> state button
And the <user_permissions> clicks on <vote_button_2> status button
And the <user_permissions> presses the 'Next' button
And the <user_permissions> is redirected to the next page in the Voting modal
And the <user_permissions> clicks on <vote_button_1> state button
And the <user_permissions> clicks on <vote_button_2> status button
And the <user_permissions> presses the 'Next' button
And the <user_permissions> is redirected to the next page in the Voting modal
And the <user_permissions> clicks on <vote_button_1> state button
And the <user_permissions> clicks on <vote_button_2> status button
And the <user_permissions> presses the 'Next' button
And the <user_permissions> is redirected to the last page in the Voting modal
And the <user_permissions> clicks on <vote_button_1> state button
And the <user_permissions> clicks on <vote_button_2> status button
When the <user_permissions> presses the 'Submit' button
Then the <user_permissions> is redirected to the Health_Check table
And the <user_permissions> can see his votes in the table in 'You' collumn
And the <user_permissions> can not see '+' button in the table
Examples:
|user_permissions     |vote_button_1  |vote_button_2      |
|Staff user           | Good          |Improving          |
|Staff user           | Good          |Constant           |
|Staff user           | Good          |Getting Worse      |
|Staff user           | Normal        |Improving          |
|Staff user           | Normal        |Constant           |
|Staff user           | Normal        |Getting Worse      |
|Staff user           | Bad           |Improving          |
|Staff user           | Bad           |Constant           |
|Staff user           | Bad           |Getting Worse      |
|Manager              | Good          |Improving          |
|Manager              | Good          |Constant           |
|Manager              | Good          |Getting Worse      |
|Manager              | Normal        |Improving          |
|Manager              | Normal        |Constant           |
|Manager              | Normal        |Getting Worse      |
|Manager              | Bad           |Improving          |
|Manager              | Bad           |Constant           |
|Manager              | Bad           |Getting Worse      |



@tc:79577
Scenario:Submit the vote before voting
And the <user_permissions> clicks on '+' button
And the Voting modal is opened
And the <user_permissions> clicks on <vote_button_1> state button
And the <user_permissions> clicks on <vote_button_2> status button
And the <user_permissions> presses the 'Next' button
And the <user_permissions> is redirected to the next page in the Voting modal
And the <user_permissions> clicks on <vote_button_1> state button
And the <user_permissions> clicks on <vote_button_2> status button
And the <user_permissions> presses the 'Next' button
And the <user_permissions> is redirected to the next page in the Voting modal
And the <user_permissions> clicks on <vote_button_1> state button
And the <user_permissions> clicks on <vote_button_2> status button
And the <user_permissions> presses the 'Next' button
And the <user_permissions> is redirected to the next page in the Voting modal
And the <user_permissions> clicks on <vote_button_1> state button
And the <user_permissions> clicks on <vote_button_2> status button
And the <user_permissions> presses the 'Next' button
And the <user_permissions> is redirected to the last page in the Voting modal
And the <user_permissions> does not choose the state and status
When the <user_permissions> presses the 'Submit' button
Then the user is kept on the last page of the voting modal
And the user can not submit his votes 
Examples:
|user_permissions     |vote_button_1  |vote_button_2      |
|Staff user           | Good          |Improving          |
|Staff user           | Good          |Constant           |
|Staff user           | Good          |Getting Worse      |
|Staff user           | Normal        |Improving          |
|Staff user           | Normal        |Constant           |
|Staff user           | Normal        |Getting Worse      |
|Staff user           | Bad           |Improving          |
|Staff user           | Bad           |Constant           |
|Staff user           | Bad           |Getting Worse      |
|Manager              | Good          |Improving          |
|Manager              | Good          |Constant           |
|Manager              | Good          |Getting Worse      |
|Manager              | Normal        |Improving          |
|Manager              | Normal        |Constant           |
|Manager              | Normal        |Getting Worse      |
|Manager              | Bad           |Improving          |
|Manager              | Bad           |Constant           |
|Manager              | Bad           |Getting Worse      |

@tc:79578
Scenario: Close the voting Modal before voting
And the <user_permissions> clicks on '+' button
And the Voting modal is opened
When the user presses the 'x' button
Then voting window is closed 
And the user is redirected to the Health_Check template
And the <user_permissions> can not see '+' button in the table
And the votes results are not displayed
Examples:
|user_permissions|
| Staff user     |
| Manager        |

@tc:79590
Scenario: Close the voting Modal on page Reload
And the <user_permissions> clicks on '+' button
And the Voting modal is opened
And the user clicks on 'Good' state button
And the user clicks on 'Improving' status button
And the <user_permissions> presses the 'Next' button
And the <user_permissions> is redirected to the next page in the Voting modal
And the name of the criteria changes
And the number of the criteria changes to "2/5"
When the user presses the reloads the page
Then voting window is closed 
And the user is redirected to the Health_Check template
And the the votes added are not displayed in the table
Examples:
|user_permissions        |
| Staff user             |
| Manager                |

@tc:79591
Scenario: Move to the next page after voting
And the <user_permissions> clicks on '+' button
And the Voting modal is opened
And the user clicks on 'Good' status button
And the user clicks on 'Improving' status button
When the <user_permissions> presses the 'Next' button
Then the <user_permissions> is redirected to the next page in the Voting modal
And the name of the criteria changes
And the number of the criteria page changes to "2/5"
Examples:
|user_permissions        |
| Staff user             |
| Manager                |

@tc:79592
Scenario: Close the voting modal by clicking outside the voting modal
And the <user_permissions> clicks on '+' button
And the Voting modal is opened
And the user clicks on 'Good' status button
And the user clicks on 'Improving' state button
When the <user_permissions> clicks on the screen, outside the voting window
Then the <user_permissions> is kept on the same page in the Voting modal
And nothing changes
Examples:
|user_permissions        |
| Staff user             |
| Manager                |

@tc:79593
Scenario: Move to the next page without voting
And the <user_permissions> clicks on '+' button
And the Voting modal is opened
When the <user_permissions> presses the 'Next' button
Then nothing happens
And the <user_permissions> cannot move to the next page
Examples:
|user_permissions        |
| Staff user             |
| Manager                |

@tc:79594
Scenario: Change a previous vote
And the <user_permissions> clicks on '+' button
And the Voting modal is opened
And the <user_permissions> clicks on 'Good' state
And the <user_permissions> clicks on 'Improving' status
And the <user_permissions> presses the 'Next' button
And the <user_permissions> is redirected to the next page in the Voting modal
And the <user_permissions> presses the 'Back' button
And the <user_permissions> is redirected to the previous page in the Voting modal
And the 'Good' state and 'Improving' status are highlighted
When the <user_permissions> changes the vote on 'Bad' state 
Then the user is allowed to change the vote
Examples:
|user_permissions        |
| Staff user             |
| Manager                |

@tc:79595
Scenario: Choose status before state
And the <user_permissions> clicks on '+' button
And the Voting modal is opened
When the user clicks on 'Improving' status button
Then the status button is not highlighted
And the user can not click on 'Next'
Examples:
|user_permissions        |
| Staff user             |
| Manager                |

@tc:79596
Scenario: Check that previous voting choices are saved
And the <user_permissions> clicks on '+' button
And the Voting modal is opened
And the <user_permissions> clicks on <vote_button_1> state button
And the <user_permissions> clicks on <vote_button_2> status button
And the <user_permissions> presses the 'Next' button
And the <user_permissions> is redirected to the next page in the Voting modal
And the <user_permissions> clicks on <vote_button_3> state button
And the <user_permissions> clicks on <vote_button_4> status button
And the <user_permissions> presses on the 'Back' button
And the <user_permissions> presses the 'Next' button
Then the <user_permissions> is redirected to the next page in the Voting modal
And the <user_permissions> can see <vote_button_3> state and <vote_button_3> status choices
And 
Examples:
|user_permissions      |vote_button_1  |vote_button_2      |vote_button_3  |vote_button_4      |
|Staff user            | Good          |Improving          | Bad           |Getting Worse      |
|Staff user            | Good          |Constant           | Bad           |Constant           |
|Staff user            | Good          |Getting Worse      | Bad           |Improving          |
|Staff user            | Normal        |Improving          | Good          |Getting Worse      |
|Staff user            | Normal        |Constant           | Good          |Constant           |
|Staff user            | Normal        |Getting Worse      | Good          |Improving          |
|Staff user            | Bad           |Improving          | Normal        |Getting Worse      |
|Staff user            | Bad           |Constant           | Normal        |Constant           |
|Staff user            | Bad           |Getting Worse      | Normal        |Improving          |
|Manager               | Good          |Improving          | Bad           |Getting Worse      |
|Manager               | Good          |Constant           | Bad           |Constant           |
|Manager               | Good          |Getting Worse      | Bad           |Improving          |
|Manager               | Normal        |Improving          | Good          |Getting Worse      |
|Manager               | Normal        |Constant           | Good          |Constant           |
|Manager               | Normal        |Getting Worse      | Good          |Improving          |
|Manager               | Bad           |Improving          | Normal        |Getting Worse      |
|Manager               | Bad           |Constant           | Normal        |Constant           |
|Manager               | Bad           |Getting Worse      | Normal        |Improving          |