Feature: Team Health Check reveal button

@tc:79638
        @retro @teamHealthCheck @revealButton
    Scenario: Check reveal results button visibility for all project role types
        Given  the user is logged with <user_email> and <user_password>
        And the user joined an active retro meeting
        And the user is on the team health check template page
        When the user views the team health check page
        And the user clicks on reveal results button
        Then the reveal results button is <visibility>
        And the reveal results button is <clickability>
        Examples:
            | user_email          | user_password | visibility    | clickability  |
            | manager@amdaris.com | amdaris       | displayed     | clickable     |
            | staff@amdaris.com   | amdaris       | not displayed | not clickable |

@tc:79639
        @retro @teamHealthCheck @liveVotes @sync
    Scenario: Check if manager sees the voting live
        Given Manager is logged in with "manager@amdaris.com" email and "amdaris" password
        And Staff user 1 is logged in with "staff@amdaris.com" email and "amdaris" password
        And Staff user 2 is logged in with "olivia@amdaris.com" email and "amdaris" password
        And Manager, Staff user 1 and Staff user 2 join the same active retro meeting
        And Manager, Staff user 1 and Staff user 2 are on the team health check template page
        When Staff User 1 votes for all criteria
        And Staff User 2 votes for all criteria
        Then Manager sees Staff User's 1 and User's 2 votes
        And Staff user 2 doesn't see Staff User's 1 votes
        And Staff user 1 doesn't see Staff User's 2 votes
        Examples:
            | criterion 1 | criterion 2 | criterion 3 | criterion 4 | criterion 5 | projection |
            | Good        | Normal      | Bad         | Good        | Normal      | improving  |
            | Normal      | Bad         | Good        | Normal      | Normal      | constant   |

@tc:79640
        @retro @teamHealthCheck @revealButton @sync
    Scenario: Check reveal results synchronization for all users in meeting
        Given Manager is logged in with "manager@amdaris.com" email and "amdaris" password
        And Staff user 1 is logged in with "staff@amdaris.com" email and "amdaris" password
        And Staff user 2 is logged in with "olivia@amdaris.com" email and "amdaris" password
        And Manager, Staff user 1 and Staff user 2 join the same active retro meeting
        And Manager, Staff user 1 and Staff user 2 are on the team health check template page
       When Staff User 1 votes for all criteria
        And Staff User 2 votes for all criteria
        And Manager votes for all criteria
        And Manager clicks reveal results button
        Then Manager sees all submited votes correct sequence
        And Staff user 2 sees all submited votes in correct sequence
        And Staff user 1 sees all submited votes in correct sequence
        Examples:
            | criterion 1 | criterion 2 | criterion 3 | criterion 4 | criterion 5 | projection |
            | Good        | Normal      | Bad         | Good        | Normal      | improving  |
            | Normal      | Bad         | Good        | Normal      | Normal      | constant   |