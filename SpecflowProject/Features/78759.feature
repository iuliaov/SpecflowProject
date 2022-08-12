Feature: Voting Modal

# Background: 
#Given user1 is logged in with manager permissions
#And user2 is logged in with staff permissions
#And user1 joins a Retro meeting
#And user2 joins the Retro meeting joined by user1
#And user1 moves to Health_Check template
#And the user2 is redirected to the <template> template

@tc:79576
Scenario: User can submit the vote
And the <user_type> clicks on '+' button
And the Voting modal is opened
And the <user_type> clicks on <state_1> state button
And the <user_type> clicks on <status_1> status button
And the <user_type> presses the 'Next' button
And the <user_type> is redirected to the next page in the Voting modal
And the <user_type> clicks on <state_1> state button
And the <user_type> clicks on <status_1> status button
And the <user_type> presses the 'Next' button
And the <user_type> is redirected to the next page in the Voting modal
And the <user_type> clicks on <state_1> state button
And the <user_type> clicks on <status_1> status button
And the <user_type> presses the 'Next' button
And the <user_type> is redirected to the next page in the Voting modal
And the <user_type> clicks on <state_1> state button
And the <user_type> clicks on <status_1> status button
And the <user_type> presses the 'Next' button
And the <user_type> is redirected to the last page in the Voting modal
And the <user_type> clicks on <state_1> state button
And the <user_type> clicks on <status_1> status button
When the <user_type> presses the 'Submit' button
Then the <user_type> is redirected to the Health_Check table
And the <user_type> can see his votes in 'You' collumn in the voting table
And the <user_type> can not see '+' button in the table
Examples:
|user_type            |state_1        |status_1           |
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
And the <user_type> clicks on '+' button
And the Voting modal is opened
And the <user_type> clicks on <state_1> state button
And the <user_type> clicks on <status_1> status button
And the <user_type> presses the 'Next' button
And the <user_type> is redirected to the next page in the Voting modal
And the <user_type> clicks on <state_1> state button
And the <user_type> clicks on <status_1> status button
And the <user_type> presses the 'Next' button
And the <user_type> is redirected to the next page in the Voting modal
And the <user_type> clicks on <state_1> state button
And the <user_type> clicks on <status_1> status button
And the <user_type> presses the 'Next' button
And the <user_type> is redirected to the next page in the Voting modal
And the <user_type> clicks on <state_1> state button
And the <user_type> clicks on <status_1> status button
And the <user_type> presses the 'Next' button
And the <user_type> is redirected to the last page in the Voting modal
And the <user_type> does not choose the state and status
When the <user_type> presses the 'Submit' button
Then the user is kept on the last page of the voting modal
And the user can not submit his votes 
Examples:
|user_type            |state_1        |status_1           |
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
And the <user_type> clicks on '+' button
And the Voting modal is opened
When the user presses the 'x' button
Then voting window is closed 
And the user is redirected to the Health_Check template
And the user can see a voting table
And the <user_type> can not see '+' button in the voting table
And the votes results are not displayed in the voting table
Examples:
|user_type       |
| Staff user     |
| Manager        |

@tc:79590
Scenario: Close the voting Modal on page Reload
And the <user_type> clicks on '+' button
And the Voting modal is opened
And the user clicks on 'Good' state button
And the user clicks on 'Improving' status button
And the <user_type> presses the 'Next' button
And the <user_type> is redirected to the next page in the Voting modal
And the name of the criteria changes
And the number of the criteria changes to "2/5"
When the user presses the reloads the page
Then voting window is closed 
And the user is redirected to the Health_Check template
And the the votes added are not displayed in the table
Examples: 
|user_type               |
| Staff user             |
| Manager                |

@tc:79591
Scenario: Move to the next page after voting
And the <user_type> clicks on '+' button
And the Voting modal is opened
And the user clicks on 'Good' status button
And the user clicks on 'Improving' status button
When the <user_type> presses the 'Next' button
Then the <user_type> is redirected to the next page in the Voting modal
And the name of the criteria changes
And the number of the criteria page changes to "2/5"
Examples:
|user_type               |
| Staff user             |
| Manager                |

@tc:79592
Scenario: Close the voting modal by clicking outside the voting modal
And the <user_type> clicks on '+' button
And the Voting modal is opened
And the user clicks on 'Good' status button
And the user clicks on 'Improving' state button
When the <user_type> clicks on the screen, outside the voting window
Then the <user_type> is kept on the same page in the Voting modal
And nothing changes in the voting table
Examples:
|user_type               |
| Staff user             |
| Manager                |

@tc:79593
Scenario: Move to the next page without voting
And the <user_type> clicks on '+' button
And the Voting modal is opened
When the <user_type> presses the 'Next' button
Then nothing happens
And the <user_type> cannot move to the next page
Examples:
|user_type               |
| Staff user             |
| Manager                |

@tc:79594
Scenario: Change a previous vote
And the <user_type> clicks on '+' button
And the Voting modal is opened
And the <user_type> clicks on 'Good' state
And the <user_type> clicks on 'Improving' status
And the <user_type> presses the 'Next' button
And the <user_type> is redirected to the next page in the Voting modal
And the <user_type> presses the 'Back' button
And the <user_type> is redirected to the previous page in the Voting modal
And the 'Good' state and 'Improving' status are highlighted
When the <user_type> changes the vote on 'Bad' state 
Then the user is allowed to change the vote
Examples:
|user_type               |
| Staff user             |
| Manager                |

@tc:79595
Scenario: Choose status before state
And the <user_type> clicks on '+' button
And the Voting modal is opened
When the user clicks on 'Improving' status button
Then the status button is not highlighted
And the user can not click on 'Next'
Examples:
|user_type               |
| Staff user             |
| Manager                |

@tc:79596
Scenario: Check that previous voting choices are saved
And the <user_type> clicks on '+' button
And the Voting modal is opened
And the <user_type> clicks on <state_1> state button
And the <user_type> clicks on <status_1> status button
And the <user_type> presses the 'Next' button
And the <user_type> is redirected to the next page in the Voting modal
And the <user_type> clicks on <state_2> state button
And the <user_type> clicks on <status_2> status button
And the <user_type> presses on the 'Back' button
And the <user_type> presses the 'Next' button
Then the <user_type> is redirected to the next page in the Voting modal
And the <user_type> can see <state_2> state and <state_2> status chosen 
Examples:
|user_type             |state_1        |status_1           |state_2        |status_2           |
|Staff user            | Good          |Improving          | Bad           |Getting Worse      |
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


Scenario: Vote results are displayed in the table in You collumn
And the <user_type> clicks on '+' button
And the Voting modal is opened
And the <user_type> clicks on <state_1> state button
And the <user_type> clicks on <state_2> status button
And the <user_type> presses the 'Next' button
And the <user_type> is redirected to the next page in the Voting modal
And the <user_type> clicks on <state_1> state button
And the <user_type> clicks on <state_2> status button
And the <user_type> presses the 'Next' button
And the <user_type> is redirected to the next page in the Voting modal
And the <user_type> clicks on <state_1> state button
And the <user_type> clicks on <state_2> status button
And the <user_type> presses the 'Next' button
And the <user_type> is redirected to the next page in the Voting modal
And the <user_type> clicks on <state_1> state button
And the <user_type> clicks on <state_2> status button
And the <user_type> presses the 'Next' button
And the <user_type> is redirected to the last page in the Voting modal
And the <user_type> clicks on <state_1> state button
And the <user_type> clicks on <state_2> status button
When the <user_type> presses the 'Submit' button
Then the <user_type> is redirected to the Health_Check table
And the <user_type> can see his votes in the first collumn of the voting table
And the results are displayed for each criteria in separate lines
And the voting results are <result_1> for each line
Examples:
|user_type            |state_1        |status_1           | result_1                |
|Staff user           | Good          |Improving          | green_circle_arrow_up   |
|Staff user           | Good          |Constant           | green_circle_no_arrow   |
|Staff user           | Good          |Getting Worse      | green_circle_arrow_down |
|Staff user           | Normal        |Improving          | yellow_circle_arrow_up  |
|Staff user           | Normal        |Constant           | yellow_circle_no_arrow  |
|Staff user           | Normal        |Getting Worse      | yellow_circle_arrow_down|
|Staff user           | Bad           |Improving          | red_circle_arrow_up     |
|Staff user           | Bad           |Constant           | red_circle_no_arrow     |
|Staff user           | Bad           |Getting Worse      | red_circle_arow_down    |
|Manager              | Good          |Improving          | green_circle_arrow_up   |
|Manager              | Good          |Constant           | green_circle_no_arrow   |
|Manager              | Good          |Getting Worse      | green_circle_arrow_down |
|Manager              | Normal        |Improving          | yellow_circle_arrow_up  |
|Manager              | Normal        |Constant           | yellow_circle_no_arrow  |
|Manager              | Normal        |Getting Worse      | yellow_circle_arrow_down|
|Manager              | Bad           |Improving          | red_circle_arrow_up     |
|Manager              | Bad           |Constant           | red_Circle_no_arrow     |
|Manager              | Bad           |Getting Worse      | red_circle_arrow_down   |


Scenario: Vote results are displayed in the table for Staff user
And the <user_type_1> clicks on '+' button
And the Voting modal is opened
And the <user_type_1> votes with <state_1> state and <status_1> status for all the criterias
And the <user_type_1> submits the votes
And the <user_type_2> clicks on '+' button in Health_Check template
And the Voting modal is opened
And the <user_type_2> votes with <state_1> state and <status_1> status for all the criterias
And the <user_type_2> submits the votes
And the <user_type_1> is redirected to the voting table
And the <user_type_1> can see only his votes in the first collumn of the voting table
And the <user_type_2> is redirected to the voting table
And the <user_type_2> can see <user_type_1> votes in <user_type_1> collumn in the voting table
And the <user_type_2> can see his votes in the first collumn of the voting table
When the <user_type_2> clicks on 'Reveal Results' button
Then the <user_type_1> can see his votes in the first collumn of the voting table
And the <user_type_1> can see <user_type_2> votes in <user_type_2> collumn in the voting table
And the voting results are <result_1> for each line
Examples:
|user_type_1            |user_type_2            |state_1       |status_1           | result_1                |
|Staff user             | Manager               |Good          |Improving          | green_circle_arrow_up   |
|Staff user             | Manager               |Good          |Constant           | green_circle_no_arrow   |
|Staff user             | Manager               |Good          |Getting Worse      | green_circle_arrow_down |
|Staff user             | Manager               |Normal        |Improving          | yellow_circle_arrow_up  |
|Staff user             | Manager               |Normal        |Constant           | yellow_circle_no_arrow  |
|Staff user             | Manager               |Normal        |Getting Worse      | yellow_circle_arrow_down|
|Staff user             | Manager               |Bad           |Improving          | red_circle_arrow_up     |
|Staff user             | Manager               |Bad           |Constant           | red_circle_no_arrow     |
|Staff user             | Manager               |Bad           |Getting Worse      | red_circle_arrow_down   |

Scenario: Vote results are displayed in the table for Manager user
And the <user_type_1> clicks on '+' button
And the Voting modal is opened
And the <user_type_1> votes with <state_1> state and <status_1> status for all the criterias
And the <user_type_1> submits the votes
And the <user_type_2> clicks on '+' button in Health_Check template
And the Voting modal is opened
And the <user_type_2> votes with <state_1> state and <status_1> status for all the criterias
And the <user_type_2> submits the votes
And the <user_type_1> is redirected to the voting table
And the <user_type_1> can see only his votes in 'You' collumn in the voting table
And the <user_type_2> is redirected to the voting table
And the <user_type_2> can see <user_type_1> votes in <user_type_1> collumn in the voting table
And the <user_type_2> can see his votes in 'You' collumn in the voting table
When the <user_type_2> clicks on 'Reveal Results' button
Then the <user_type_2> can see his votes in 'You' collumn in the voting table
And the <user_type_2> can see <user_type_1> votes in <user_type_1> collumn in the voting table
And the voting results are <result_1> for each line
Examples:
|user_type_1            |user_type_2            |state_1       |status_1           | result_1                |
|Staff user             | Manager               |Good          |Improving          | green_circle_arrow_up   |
|Staff user             | Manager               |Good          |Constant           | green_circle_no_arrow   |
|Staff user             | Manager               |Good          |Getting Worse      | green_circle_arrow_down |
|Staff user             | Manager               |Normal        |Improving          | yellow_circle_arrow_up  |
|Staff user             | Manager               |Normal        |Constant           | yellow_circle_no_arrow  |
|Staff user             | Manager               |Normal        |Getting Worse      | yellow_circle_arrow_down|
|Staff user             | Manager               |Bad           |Improving          | red_circle_arrow_up     |
|Staff user             | Manager               |Bad           |Constant           | red_circle_no_arrow     |
|Staff user             | Manager               |Bad           |Getting Worse      | red_circle_arrow_down   |


Scenario: Submit the vote with various voting combinations
And the <user_type> clicks on '+' button
And the Voting modal is opened
And the <user_type> clicks on <state_1> state button
And the <user_type> clicks on <status_1> status button
And the <user_type> presses the 'Next' button
And the <user_type> is redirected to the next page in the Voting modal
And the <user_type> clicks on <state_2> state button
And the <user_type> clicks on <status_2> status button
And the <user_type> presses the 'Next' button
And the <user_type> is redirected to the next page in the Voting modal
And the <user_type> clicks on <state_3> state button
And the <user_type> clicks on <status_3> status button
And the <user_type> presses the 'Next' button
And the <user_type> is redirected to the next page in the Voting modal
And the <user_type> clicks on <state_4> state button
And the <user_type> clicks on <status_4> status button
And the <user_type> presses the 'Next' button
And the <user_type> is redirected to the next page in the Voting modal
And the <user_type> clicks on <state_5> state button
And the <user_type> clicks on <status_5> status button
When the <user_type> presses the 'Submit' button
Then the <user_type> is redirected to the Health_Check template page
And the <user_type> can see his votes in 'You' collumn in the following order: <result_1>, <result_2>, <result_1>, <result_3>, <result_4>, <result_5>
Examples:
|user_type_1            |user_type_2            |state_1       |status_1           | result_1                |state_2       |status_2           | result_2                |state_3       |status_3           | result_3                |state_4       |status_4           | result_4                |state_5       |status_5           | result_5                |
|Staff user             | Manager               |Good          |Improving          | green_circle_arrow_up   |Good          |Constant           | green_circle_no_arrow   |Good          |Getting Worse      | green_circle_arrow_down |Bad           |Improving          | red_circle_arrow_up     |Normal        |Improving          | yellow_circle_arrow_up  |
|Staff user             | Manager               |Good          |Improving          | green_circle_arrow_up   |Good          |Constant           | green_circle_no_arrow   |Good          |Getting Worse      | green_circle_arrow_down |Bad           |Improving          | red_circle_arrow_up     |Normal        |Constant           | yellow_circle_no_arrow  |
|Staff user             | Manager               |Good          |Improving          | green_circle_arrow_up   |Good          |Constant           | green_circle_no_arrow   |Good          |Getting Worse      | green_circle_arrow_down |Normal        |Constant           | yellow_circle_no_arrow  |Normal        |Improving          | yellow_circle_arrow_up  |
|Staff user             | Manager               |Normal        |Constant           | yellow_circle_no_arrow  |Good          |Constant           | green_circle_no_arrow   |Normal        |Constant           | yellow_circle_no_arrow  |Bad           |Improving          | red_circle_arrow_up     |Normal        |Improving          | yellow_circle_arrow_up  |
|Staff user             | Manager               |Good          |Improving          | green_circle_arrow_up   |Good          |Constant           | green_circle_no_arrow   |Bad           |Constant           | red_circle_no_arrow     |Bad           |Improving          | red_circle_arrow_up     |Normal        |Improving          | yellow_circle_arrow_up  |
|Staff user             | Manager               |Good          |Improving          | green_circle_arrow_up   |Good          |Constant           | green_circle_no_arrow   |Good          |Getting Worse      | green_circle_arrow_down |Bad           |Improving          | red_circle_arrow_up     |Bad           |Constant           | red_circle_no_arrow     |
|Staff user             | Manager               |Good          |Improving          | green_circle_arrow_up   |Bad           |Improving          | red_circle_arrow_up     |Good          |Getting Worse      | green_circle_arrow_down |Normal        |Constant           | yellow_circle_no_arrow  |Normal        |Improving          | yellow_circle_arrow_up  |
|Staff user             | Manager               |Good          |Improving          | green_circle_arrow_up   |Good          |Constant           | green_circle_no_arrow   |Normal        |Constant           | yellow_circle_no_arrow  |Bad           |Improving          | red_circle_arrow_up     |Normal        |Improving          | yellow_circle_arrow_up  |
|Staff user             | Manager               |Good          |Improving          | green_circle_arrow_up   |Bad           |Constant           | red_circle_no_arrow     |Good          |Getting Worse      | green_circle_arrow_down |Normal        |Getting Worse      | yellow_circle_arrow_down|Normal        |Improving          | yellow_circle_arrow_up  |
|Staff user             | Manager               |Good          |Improving          | green_circle_arrow_up   |Good          |Constant           | green_circle_no_arrow   |Good          |Getting Worse      | green_circle_arrow_down |Bad           |Improving          | red_circle_arrow_up     |NGood         |Getting Worse      | green_circle_arrow_down |
|Staff user             | Manager               |Good          |Improving          | green_circle_arrow_up   |Good          |Constant           | green_circle_no_arrow   |Good          |Getting Worse      | green_circle_arrow_down |Normal        |Constant           | yellow_circle_no_arrow  |Normal        |Constant           | yellow_circle_no_arrow  |
|Staff user             | Manager               |Bad           |Improving          | red_circle_arrow_up     |Good          |Constant           | green_circle_no_arrow   |Normal        |Constant           | yellow_circle_no_arrow  |Bad           |Improving          | red_circle_arrow_up     |Bad           |Constant           | red_circle_no_arrow     |


Scenario: Reveal Results after closing the window
And the <user_type> clicks on '+' button
And the Voting modal is opened
And the <user_type> clicks on <state_1> state button
And the <user_type> clicks on <status_1> status button
And the <user_type> presses the 'Next' button
And the <user_type> is redirected to the next page in the Voting modal
And the <user_type> clicks on <state_1> state button
And the <user_type> clicks on <status_1> status button
And the <user_type> clicks on 'x' button
And the <user_type> presses the 'Submit' button
When the Manager presses on 'Reveal Results' button
Then the <user_type> does not see any results in 'You' collumn and in <user_type> collumn
Examples:
|user_type            |state_1        |status_1           |
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