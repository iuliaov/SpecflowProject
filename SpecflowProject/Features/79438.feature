Feature: Feedback page UI

@tc:79655
        Scenario: Check feedback page icon accessibility
        Given user is logged with <user_email> and <user_password>
        When user inspects the sidebar
        Then the feedback page icon is <visibility>
        And the feedback page icon is <clickability>

        Examples:
            | user_email          | user_password | visibility  | clickability  |
            | manager@amdaris.com | amdaris       | visible     | clickable     |
            | staff@amdaris.com   | amdaris       | not visible | not clickable |
            | admin@amdaris.com   | amdaris       | visible     | clickable     |

@tc:79656
        Scenario: Check feedback page components
    Given user is logged with <user_email> and <user_password>
    When user clicks on the feedback page icon 
    Then user is redirected to feedback's page active tab 
    And user is able to switch to past tab

     Examples:
            | user_email          | user_password |
            | manager@amdaris.com | amdaris       |
            | admin@amdaris.com   | amdaris       |