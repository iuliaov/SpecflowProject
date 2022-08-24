Feature: Timer in Retrospective meeting
    @
    Scenario: Check main timer component permissions
        Given manager user is logged in with "manager" credentials
        And staff user is logged in with "staff" credentials
        When manager and staff user joined the same retro meeting
        Then manager and staff can see the main timer
        And take a break button is disabled
        And take a break button is visible only to manager user

    Scenario: Check main timer trigger - Ice Breaking template
        Given manager user is logged in with "manager" credentials
        And staff user is logged in with "staff" credentials
        And manager and staff user joined the same retro meeting
        And manager and staff are on the ice breaking template
        When <user> selects <state>
        Then the main timer is triggered
        And the main timer is synced for manager and staff user
        And the take a break button is enabled
        And take a break button is visible only to manager user

        Examples:
            | user    | state     |
            | manager | happy     |
            | staff   | happy     |
            | manager | wondering |
            | staff   | wondering |
            | manager | exhausted |
            | staff   | exhausted |
            | manager | confused  |
            | staff   | confused  |

    Scenario: Check main timer trigger - Agile template
        Given manager user is logged in with "manager" credentials
        And staff user is logged in with "staff" credentials
        And manager and staff user joined the same retro meeting
        And manager and staff are on the agile template
        When <user> inputs "Lorem ipsum" in <type> chat
        Then the main timer is triggered
        And the main timer is synced for manager and staff user
        And the take a break button is enabled
        And take a break button is visible only to manager user

        Examples:
            | user    | start    |
            | manager | start    |
            | staff   | continue |
            | manager | continue |
            | staff   | stop     |
            | manager | stop     |
    
     Scenario: Check main timer trigger - Team Health check template
        Given manager user is logged in with "manager" credentials
        And staff user is logged in with "staff" credentials
        And manager and staff user joined the same retro meeting
        And manager and staff are on the team health check template
        When <user> votes <state> and <projection> for all criteria
        Then the main timer is triggered
        And the main timer is synced for manager and staff user
        And the take a break button is enabled
        And take a break button is visible only to manager user

        Examples:
            | user    | start    |
            | manager | start    |
            | staff   | continue |
            | manager | continue |
            | staff   | stop     |
            | manager | stop     |