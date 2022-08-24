Feature: Team Health Check criteria edit

    @tc:79887
    @retro @teamHealthCheck @editCriteria @positive
    Scenario: Edit single criterion
        Given user is logged in with manager credentials
        And joined an active retro meeting
        And is on team health check template
        When user clicks edit button next to <criterion>
        And inserts "lorem ipsum" in the criterion input field
        And clicks <button>
        Then the criterion is <state>

        Examples:
            | criteria             | button | state      |
            | Quality of processes | check  | edited     |
            | Communication        | check  | edited     |
            | Speed of work        | check  | edited     |
            | Goals alignment      | check  | edited     |
            | Product quality      | check  | edited     |
            | Quality of processes | x      | not edited |
            | Communication        | x      | not edited |
            | Speed of work        | x      | not edited |
            | Goals alignment      | x      | not edited |
            | Product quality      | x      | not edited |

    @tc:79888
    @retro @teamHealthCheck @editCriteria @positive
    Scenario: Edit multiple criteria - valid data
        Given user is logged in with manager credentials
        And joined an active retro meeting
        And is on team health check template
        When user edits multiple criteria
        And clicks check button
        Then the criteria are edited

        Examples:
            | Quality of processes | Communication | Speed of work | Goals alignment | Product quality |
            | lorem ipsum          | lorem ipsum   | lorem ipsum   | lorem ipsum     | lorem ipsum     |
            | lorem ipsum          | lorem ipsum   | lorem ipsum   | lorem ipsum     | -               |
            | lorem ipsum          | lorem ipsum   | lorem ipsum   | -               | lorem ipsum     |
            | lorem ipsum          | lorem ipsum   | -             | lorem ipsum     | lorem ipsum     |
            | lorem ipsum          | -             | lorem ipsum   | lorem ipsum     | lorem ipsum     |
            | -                    | lorem ipsum   | lorem ipsum   | lorem ipsum     | lorem ipsum     |

    @tc:79889
    @retro @teamHealthCheck @editCriteria @negative
    Scenario: Edit multiple criteria - invalid data
        Given user is logged in with manager credentials
        And joined an active retro meeting
        And is on team health check template
        When user removes title for multiple criteria
        And clicks check button
        Then the criteria aren't edited

        Examples:
            | Quality of processes | Communication | Speed of work | Goals alignment | Product quality |
            |                      |               |               |                 |                 |
            | Quality of processes | Communication | Speed of work | Goals alignment |                 |
            | Quality of processes | Communication | Speed of work |                 | Product quality |
            | Quality of processes | Communication |               | Goals alignment | Product quality |
            | Quality of processes |               | Speed of work | Goals alignment | Product quality |
            |                      | Communication | Speed of work | Goals alignment | Product quality |

    @tc:79890
    @retro @teamHealthCheck @editCriteria
    Scenario: Edit criteria after first vote
        Given manager user is logged in with manager credentials
        And staff user is logged in with staff credentials
        And staff and manager user joined an active retro meeting
        And are on team health check template
        When staff user votes for all criteria
        Then edit criteria button disapears for manager user
        And the criteria can't be edited

    @tc:79891
    @retro @teamHealthCheck @editCriteria
    Scenario: Vote for edited criteria
        Given manager user is logged in with manager credentials
        And staff user is logged in with staff credentials
        And staff and manager user joined an active retro meeting
        And are on team health check template
        When manager user edits multiple criteria
        And staff user votes for all edited criteria
        Then all votes for the edited criteria are registered
        And are visible for the manager and staff user

        Examples:
            | Quality of processes | Communication | Speed of work | Goals alignment | Product quality |
            | lorem ipsum          | lorem ipsum   | lorem ipsum   | lorem ipsum     | lorem ipsum     |
            | lorem ipsum          | lorem ipsum   | lorem ipsum   | lorem ipsum     | -               |
            | lorem ipsum          | lorem ipsum   | lorem ipsum   | -               | lorem ipsum     |
            | lorem ipsum          | lorem ipsum   | -             | lorem ipsum     | lorem ipsum     |
            | lorem ipsum          | -             | lorem ipsum   | lorem ipsum     | lorem ipsum     |
            | -                    | lorem ipsum   | lorem ipsum   | lorem ipsum     | lorem ipsum     |

    @tc:79892
    @retro @teamHealthCheck @editCriteria
    Scenario: Staff user edit button visibility
        Given user is logged in with staff credentials
        And joined an active retro meeting
        When user is on team health check template
        Then the edit criteria button is not displayed

    @tc:79893
    @retro @teamHealthCheck @editCriteria @View
    Scenario: Edit criteria button presence in View past retro meeting
        Given user is logged in with manager credentials
        And joined an active retro meeting
        And is on team health check template
        When user saves the meeting
        And user views the saved meeting
        Then the edit criteria button is not displayed

    @tc:79894
    @retro @teamHealthCheck @editCriteria @View
    Scenario: Edited criteria presence in View past retro meeting
        Given user is logged in with manager credentials
        And joined an active retro meeting
        And is on team health check template
        And user edits all criteria
            | Quality of processes | Communication | Speed of work | Goals alignment | Product quality |
            | lorem ipsum          | lorem ipsum   | lorem ipsum   | lorem ipsum     | lorem ipsum     |
        When user saves the meeting
        And user views the saved meeting
        Then the edit criteria button is not displayed

@tc:79904
        @retro @teamHealthCheck @editCriteria @negative
    Scenario: Remove criteria
        Given user is logged in with <credentials>
        And joined an active retro meeting
        And is on team health check template
        When user tries to remove criteria
        Then No delete criteria button is displayed
        And criteria can't be removed

        Examples:
            | credentials |
            | manager     |
            | staff       |

@tc:79905
        @retro @teamHealthCheck @editCriteria @negative
    Scenario: Add criteria
        Given user is logged in with <credentials>
        And joined an active retro meeting
        And is on team health check template
        When user tries to add criteria
        Then No add criteria button is displayed
        And criteria can't be added

        Examples:
            | credentials |
            | manager     |
            | staff       |

@tc:79906
        @retro @teamHealthCheck @editCriteria
    Scenario: Edit criteria sync
        Given manager user is logged in with manager credentials
        And staff user is logged in with staff credentials
        And staff and manager user joined an active retro meeting
        And are on team health check template
        When manager user edits multiple criteria
        Then staff user sees the updaded criteria 

        Examples:
            | Quality of processes | Communication | Speed of work | Goals alignment | Product quality |
            | lorem ipsum          | lorem ipsum   | lorem ipsum   | lorem ipsum     | lorem ipsum     |
            | lorem ipsum          | lorem ipsum   | lorem ipsum   | lorem ipsum     | -               |
            | lorem ipsum          | lorem ipsum   | lorem ipsum   | -               | lorem ipsum     |
            | lorem ipsum          | lorem ipsum   | -             | lorem ipsum     | lorem ipsum     |
            | lorem ipsum          | -             | lorem ipsum   | lorem ipsum     | lorem ipsum     |
            | -                    | lorem ipsum   | lorem ipsum   | lorem ipsum     | lorem ipsum     |
