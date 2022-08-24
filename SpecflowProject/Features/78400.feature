Feature: Retro Notes

@tc:79551
        @retro @notes @sendButton
    Scenario: Check notes button functionality
        Given  the user is logged with <user_email> and <user_password>
        And the user is on "http://localhost:3000/project/1/retro"
        When the user joins an active meeting
        And the user clicks on the notes button
        Then the notes window is displayed
        Examples:
            | user_email          | user_password |
            | manager@amdaris.com | amdaris       |
            | staff@amdaris.com   | amdaris       |

@tc:79552
        @retro @notes @sendButton
    Scenario: Check send notes button functionality
        Given  the user is logged with <user_email> and <user_password>
        And the user is on "http://localhost:3000/project/1/retro"
        When the user joins an active meeting
        And the user clicks on the notes button
        And the user writes <input> in the notes input field
        Then the send button is <send_button_state>
        Examples:
            | user_email          | user_password | input       | send_button_state |
            | manager@amdaris.com | amdaris       | a           | enabled           |
            | staff@amdaris.com   | amdaris       | a           | enabled           |
            | admin@amdaris.com   | amdaris       | a           | enabled           |
            | manager@amdaris.com | amdaris       |             | disabled          |
            | staff@amdaris.com   | amdaris       |             | disabled          |
            | admin@amdaris.com   | amdaris       |             | disabled          |
            | manager@amdaris.com | amdaris       | Лорем ипсум | disabled          |
            | staff@amdaris.com   | amdaris       | Лорем ипсум | disabled          |
            | admin@amdaris.com   | amdaris       | Лорем ипсум | disabled          |

@tc:79553
        @retro @notes @positive
    Scenario: Check if manager, admin and staff users can write notes in an active retro meeting
        Given  the user is logged with <user_email> and <user_password>
        And the user is on "http://localhost:3000/project/1/retro"
        When the user joins an active meeting
        And the user clicks on the notes button
        And the user writes <input> in the notes input field
        And clicks the send button
        Then the message is displayed in the notes section
        And the time of sending matches the current time
        Examples:
            | user_email          | user_password | input                                                                        |
            | manager@amdaris.com | amdaris       | a                                                                            |
            | staff@amdaris.com   | amdaris       | a                                                                            |
            | admin@amdaris.com   | amdaris       | a                                                                            |
            | manager@amdaris.com | amdaris       | #$%^&*()_-+=/?.,<>;:"'{}[]~`\|                                               |
            | staff@amdaris.com   | amdaris       | #$%^&*()_-+=/?.,<>;:"'{}[]~`\|                                               |
            | admin@amdaris.com   | amdaris       | #$%^&*()_-+=/?.,<>;:"'{}[]~`\|                                               |
            | manager@amdaris.com | amdaris       | A sentence is the basic unit of language which expresses a complete thought. |
            | staff@amdaris.com   | amdaris       | A sentence is the basic unit of language which expresses a complete thought. |
            | admin@amdaris.com   | amdaris       | A sentence is the basic unit of language which expresses a complete thought. |

@tc:79554
        @retro @notes @positive
    Scenario: Check if manager, admin and staff users can write 700 chars notes in an active retro meeting
        Given  the user is logged with <user_email> and <user_password>
        And the user is on "http://localhost:3000/project/1/retro"
        When the user joins an active meeting
        And the user clicks on the notes button
        And the user writes "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi in pharetra tortor. Sed suscipit justo metus, finibus mattis sem suscipit sit amet. Nam porta, ipsum et ornare ullamcorper, erat elit maximus arcu, et fermentum elit nulla vel sem. Ut condimentum mattis erat id commodo. Curabitur tincidunt at orci non porttitor. Mauris dignissim rhoncus augue in pretium. In volutpat sit amet dolor in hendrerit. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec vel eleifend dui. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Praesent in justo ut massa rutrum sodales sit amet id enim. Phasellus lacinia tellus." in the notes input field
        And clicks the send button
        Then the message is displayed in the notes section
        And the time of sending matches the current time
        Examples:
            | user_email          | user_password |
            | manager@amdaris.com | amdaris       |
            | staff@amdaris.com   | amdaris       |
            | admin@amdaris.com   | amdaris       |

@tc:79555
        @retro @notes @negative
    Scenario: Check if manager, admin and staff users can write notes in an active stand-up meeting - negative
        Given  the user is logged with <user_email> and <user_password>
        And the user is on "http://localhost:3000/project/1/retro"
        When the user joins an active meeting
        And the user clicks on the notes button
        And the user writes <input> in the notes input field
        Then the user can't send the message
        Examples:
            | user_email          | user_password | input       |
            | manager@amdaris.com | amdaris       | "  "        |
            | staff@amdaris.com   | amdaris       | "  "        |
            | admin@amdaris.com   | amdaris       | "  "        |
            | manager@amdaris.com | amdaris       |             |
            | staff@amdaris.com   | amdaris       |             |
            | admin@amdaris.com   | amdaris       |             |
            | manager@amdaris.com | amdaris       | Лорем ипсум |
            | staff@amdaris.com   | amdaris       | Лорем ипсум |
            | admin@amdaris.com   | amdaris       | Лорем ипсум |

@tc:79556
@retro @notes @positive @sync
    Scenario: Check if messages in retro meeting are synchronised
        Given User 1 is logged in with <user_email1> and <user_password1>
        And User 2 is logged in with <user_email2> and <user_password2>
        And User 3 is logged in with <user_email3> and <user_password3>
        And User 1, User 2 and User 3 join the same active retro meeting
        When User 1 clicks on the notes button
        And User 1 inserts "Lorem ipsum" in the notes input field
        And User 1 clicks the send button
        Then The message is displayed in the notes section for User 2 and User 3
        And The name of the author matches User's 1 name

        Examples:
            | user_email1         | user_password1 | user_email2         | user_password2 | user_email3       | user_password3 |
            | admin@amdaris.com   | amdaris        | manager@amdaris.com | amdaris        | staff@amdaris.com | amdaris        |
            | manager@amdaris.com | amdaris        | staff@amdaris.com   | amdaris        | admin@amdaris.com | amdaris        |
            | staff@amdaris.com   | amdaris        | manager@amdaris.com | amdaris        | admin@amdaris.com | amdaris        |

@tc:79557
@retro @notes @positive @sync @notification
    Scenario: Check if users recieve notifications when notes window is opened
        Given User 1 is logged in with <user_email1> and <user_password1>
        And User 2 is logged in with <user_email2> and <user_password2>
        And User 3 is logged in with <user_email3> and <user_password3>
        And User 1, User 2 and User 3 join the same active retro meeting
        And User 2 and User 3 clicked on the notes button
        When User 1 sends in notes "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi in pharetra tortor. Sed suscipit justo metus, finibus mattis sem suscipit sit amet. Nam porta, ipsum et ornare ullamcorper, erat elit maximus arcu, et fermentum elit nulla vel sem. Ut condimentum mattis erat id commodo." twice
        Then The messages are displayed in the notes section for User 2 and User 3
        And User 2 and User 3 recieve a new message notification

        Examples:
            | user_email1         | user_password1 | user_email2         | user_password2 | user_email3       | user_password3 |
            | admin@amdaris.com   | amdaris        | manager@amdaris.com | amdaris        | staff@amdaris.com | amdaris        |
            | manager@amdaris.com | amdaris        | staff@amdaris.com   | amdaris        | admin@amdaris.com | amdaris        |
            | staff@amdaris.com   | amdaris        | manager@amdaris.com | amdaris        | admin@amdaris.com | amdaris        |

@tc:79558
@retro @notes @positive @sync @notification
    Scenario: Check if users recieve notifications when notes window is closed
        Given User 1 is logged in with <user_email1> and <user_password1>
        And User 2 is logged in with <user_email2> and <user_password2>
        And User 3 is logged in with <user_email3> and <user_password3>
        And User 1, User 2 and User 3 join the same active retro meeting
        When User 1 sends in notes "Lorem ipsum dolor sit amet, consectetur adipiscing elit." 
        Then User 2 and User 3 recieve a new message notification
        And The message is displayed after clicking the notes button

        Examples:
            | user_email1         | user_password1 | user_email2         | user_password2 | user_email3       | user_password3 |
            | admin@amdaris.com   | amdaris        | manager@amdaris.com | amdaris        | staff@amdaris.com | amdaris        |
            | manager@amdaris.com | amdaris        | staff@amdaris.com   | amdaris        | admin@amdaris.com | amdaris        |
            | staff@amdaris.com   | amdaris        | manager@amdaris.com | amdaris        | admin@amdaris.com | amdaris        |

@tc:79559
@retro @notes @positive @sync @notification
    Scenario: Check if notes are present upon switching the retro template
        Given User 1 is logged in with <user_email1> and <user_password1>
        And User 2 is logged in with <user_email2> and <user_password2>
        And User 3 is logged in with <user_email3> and <user_password3>
        And User 1, User 2 and User 3 join the same active stand-up meeting
        When User 1 sends in notes "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        And Manager user moves to the next retro template 
        Then the note is present in the current retro template for all users

        Examples:
            | user_email1         | user_password1 | user_email2         | user_password2 | user_email3       | user_password3 |
            | admin@amdaris.com   | amdaris        | manager@amdaris.com | amdaris        | staff@amdaris.com | amdaris        |
            | manager@amdaris.com | amdaris        | staff@amdaris.com   | amdaris        | admin@amdaris.com | amdaris        |
            | staff@amdaris.com   | amdaris        | manager@amdaris.com | amdaris        | admin@amdaris.com | amdaris        |