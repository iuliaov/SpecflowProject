Feature: Timer in Daily stand-up meeting

@tc:80021
        Scenario: Check main timer component permissions
        Given manager user is logged in with "manager" credentials
        And staff user is logged in with "staff" credentials
        When manager and staff user joined the same daily meeting
        Then manager and staff can see the main timer
        And take a break button is disabled
        And take a break button is visible only to manager user

@tc:80022
        Scenario: Check main timer trigger
        Given manager user is logged in with "manager" credentials
        And staff user is logged in with "staff" credentials
        And manager and staff user joined the same daily meeting
        When manager clicks the spin button
        Then the main timer is triggered
        And the main timer is synced for manager and staff user

@tc:80023
        Scenario: Check break timer component permissions
        Given manager user is logged in with "manager" credentials
        And staff user is logged in with "staff" credentials
        And manager and staff user joined the same daily meeting
        When manager clicks the spin button
        And manager clicks the take a break button
        Then only the manager user sees the break timer components

@tc:80024
        Scenario: Check Break functionality
        Given manager user is logged in with "manager" credentials
        And staff user is logged in with "staff" credentials
        And manager and staff user joined the same daily meeting
        When manager clicks the spin button
        And manager clicks the take a break button
        And manager selects a <break time> minute break
        And manager clicks the Start break button
        Then the break timer is triggered
        And the break time is synced for manager and staff user
        And only the manager user sees the Continue button
        And the spin button is disabled
        And the end meeting button is disabled
        And the reset button is disabled
        And the edit button is disabled
        Examples:
            | break time |
            | 5          |
            | 10         |
            | 15         |
            | 20         |
            | 25         |
            | 30         |

@tc:80025
        Scenario: Check Continue button functionality
        Given manager user is logged in with "manager" credentials
        And staff user is logged in with "staff" credentials
        And manager and staff user joined the same daily meeting
        When manager clicks the spin button
        And manager clicks the take a break button
        And manager selects a <break time> minute break
        And manager clicks the Start break button
        And manager clicks on Continue button <break status> break is over
        Then the break timer is stopped for manager and staff users
        And the main timer displays the correct meeting time left for manager and staff users
        And the spin button is enabled
        And the end meeting button is enabled
        And the reset button is enabled
        And the edit button is enabled
        Examples:
            | break time | break status |
            | 5          | before       |
            | 5          | after        |
            | 10         | before       |
            | 10         | after        |


@tc:80026
        Scenario: Check main timer after refresh
        Given manager user is logged in with "manager" credentials
        And staff user is logged in with "staff" credentials
        And manager and staff user joined the same daily meeting
        When manager clicks the spin button
        And <user> refreshes the page
        Then the main timer displays the correct time left in meeting for manager and staff users
        Examples:
            | user    |
            | staff   |
            | manager |

@tc:80027
        Scenario: Check break timer after refresh
        Given manager user is logged in with "manager" credentials
        And staff user is logged in with "staff" credentials
        And manager and staff user joined the same daily meeting
        When manager clicks the spin button
        And manager clicks the take a break button
        And manager selects a <break time> minute break
        And manager clicks the Start break button
        And <user> refreshes the page
        Then the break timer displays the correct time left in meeting for manager and staff users
        Examples:
            | user    |
            | staff   |
            | manager |

@tc:80028
        Scenario: Check the main timer when the countdown is over
        Given manager user is logged in with "manager" credentials
        And staff user is logged in with "staff" credentials
        And manager and staff user joined the same daily meeting
        When manager clicks the spin button
        And manager and staff users wait until the meeting is over
        Then 5 min before the end of meeting an end of meeting pop-up is displayed
        And the main timer stops at 00:00 for manager and staff users

@tc:80029
        Scenario: Check the main timer when the countdown is over & refresh
        Given manager user is logged in with "manager" credentials
        And staff user is logged in with "staff" credentials
        And manager and staff user joined the same daily meeting
        When manager clicks the spin button
        And the main timer countdown is over
        And <user> refreshes the page
        Then the main timer displays 00:00 for manager and staff users
        Examples:
            | user    |
            | staff   |
            | manager |

@tc:80030
        Scenario: Check Break timer when the countdown is over
        Given manager user is logged in with "manager" credentials
        And staff user is logged in with "staff" credentials
        And manager and staff user joined the same daily meeting
        When manager clicks the spin button
        And manager clicks the take a break button
        And manager selects a "5" minute break
        And manager clicks the Start break button
        And the break countdown is over
        Then the break timer stops at 00:00 for manager and staff users

@tc:80031
        Scenario: Check Break timer when the countdown is over & refresh
        Given manager user is logged in with "manager" credentials
        And staff user is logged in with "staff" credentials
        And manager and staff user joined the same daily meeting
        When manager clicks the spin button
        And manager clicks the take a break button
        And manager selects a "5" minute break
        And manager clicks the Start break button
        And the break countdown is over
        And <user> refreshes the page
        Then the break timer displays 00:00 for manager and staff users
        Examples:
            | user    |
            | staff   |
            | manager |

@tc:80032
        Scenario: Check break functionality after the main timer countdown is over
        Given manager user is logged in with "manager" credentials
        And staff user is logged in with "staff" credentials
        And manager and staff user joined the same daily meeting
        When manager clicks the spin button
        And the main timer countdown is over
        And manager clicks the take a break button
        And manager selects a "5" minute break
        And manager clicks the Start break button
        Then the break is not launched



