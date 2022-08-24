Feature: Stand-up Notes

@tc:79464
        @standup @notes @sendButton
    Scenario: Check send notes button functionality
        Given  the user is logged with <user_email> and <user_password>
        And the user is on "http://localhost:3000/project/1/daily"
        When the user joins an active meeting
        And the user writes <input> in the notes input field
        Then the send button is <send_button_state>
        Examples:
            | user_email          | user_password | input       | send_button_state |
            | manager@amdaris.com | amdaris       | a           | enabled           |
            | staff@amdaris.com   | amdaris       | a           | enabled           |
            | admin@amdaris.com   | amdaris       | a           | enabled           |
            | manager@amdaris.com | amdaris       | "  "        | disabled          |
            | staff@amdaris.com   | amdaris       | "  "        | disabled          |
            | admin@amdaris.com   | amdaris       | "  "        | disabled          |
            | manager@amdaris.com | amdaris       |             | disabled          |
            | staff@amdaris.com   | amdaris       |             | disabled          |
            | admin@amdaris.com   | amdaris       |             | disabled          |
            | manager@amdaris.com | amdaris       | Лорем ипсум | disabled          |
            | staff@amdaris.com   | amdaris       | Лорем ипсум | disabled          |
            | admin@amdaris.com   | amdaris       | Лорем ипсум | disabled          |

@tc:79465
        @standup @notes @positive
    Scenario: Check if manager, admin and staff users can write notes in an active stand-up meeting
        Given  the user is logged with <user_email> and <user_password>
        And the user is on "http://localhost:3000/project/1/daily"
        When the user joins an active meeting
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

@tc:79466
        @standup @notes @positive
    Scenario: Check if manager, admin and staff users can write 700 chars notes in an active stand-up meeting
        Given  the user is logged with <user_email> and <user_password>
        And the user is on "http://localhost:3000/project/1/daily"
        When the user joins an active meeting
        And the user writes "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi in pharetra tortor. Sed suscipit justo metus, finibus mattis sem suscipit sit amet. Nam porta, ipsum et ornare ullamcorper, erat elit maximus arcu, et fermentum elit nulla vel sem. Ut condimentum mattis erat id commodo. Curabitur tincidunt at orci non porttitor. Mauris dignissim rhoncus augue in pretium. In volutpat sit amet dolor in hendrerit. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec vel eleifend dui. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Praesent in justo ut massa rutrum sodales sit amet id enim. Phasellus lacinia tellus." in the notes input field
        And clicks the send button
        Then the message is displayed in the notes section
        And the time of sending matches the current time
        Examples:
            | user_email          | user_password |
            | manager@amdaris.com | amdaris       |
            | staff@amdaris.com   | amdaris       |
            | admin@amdaris.com   | amdaris       |

@tc:79467
        @standup @notes @positive @sync
    Scenario: Check if messages in stand-up meeting are synchronised
        Given User 1 is logged in with <user_email1> and <user_password1>
        And User 2 is logged in with <user_email2> and <user_password2>
        And User 3 is logged in with <user_email3> and <user_password3>
        And User 1, User 2 and User 3 join the same active stand-up meeting
        When User 1 inserts "Lorem ipsum" in the notes input field
        And User 1 clicks the send button
        Then The message is displayed in the notes section for User 2 and User 3
        And The name of the author matches User's 1 name

        Examples:
            | user_email1         | user_password1 | user_email2         | user_password2 | user_email3       | user_password3 |
            | admin@amdaris.com   | amdaris        | manager@amdaris.com | amdaris        | staff@amdaris.com | amdaris        |
            | manager@amdaris.com | amdaris        | staff@amdaris.com   | amdaris        | admin@amdaris.com | amdaris        |
            | staff@amdaris.com   | amdaris        | manager@amdaris.com | amdaris        | admin@amdaris.com | amdaris        |

@tc:79468
        @standup @notes @positive @sync @notification
    Scenario: Check if users recieve notifications for new messages
        Given User 1 is logged in with <user_email1> and <user_password1>
        And User 2 is logged in with <user_email2> and <user_password2>
        And User 3 is logged in with <user_email3> and <user_password3>
        And User 1, User 2 and User 3 join the same active stand-up meeting
        When User 1 sends in notes "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi in pharetra tortor. Sed suscipit justo metus, finibus mattis sem suscipit sit amet. Nam porta, ipsum et ornare ullamcorper, erat elit maximus arcu, et fermentum elit nulla vel sem. Ut condimentum mattis erat id commodo." twice
        Then The messages are displayed in the notes section for User 2 and User 3
        And User 2 and User 3 recieve a new message notification

        Examples:
            | user_email1         | user_password1 | user_email2         | user_password2 | user_email3       | user_password3 |
            | admin@amdaris.com   | amdaris        | manager@amdaris.com | amdaris        | staff@amdaris.com | amdaris        |
            | manager@amdaris.com | amdaris        | staff@amdaris.com   | amdaris        | admin@amdaris.com | amdaris        |
            | staff@amdaris.com   | amdaris        | manager@amdaris.com | amdaris        | admin@amdaris.com | amdaris        |


@tc:79469
        @standup @notes @negative
    Scenario: Check if manager, admin and staff users can write notes in an active stand-up meeting 1
        Given  the user is logged with <user_email> and <user_password>
        And the user is on "http://localhost:3000/project/1/daily"
        When the user joins an active meeting
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


@tc:79470
        @standup @notes @reply @positive
    Scenario: Check reply to notes functionality in stand-up meeting
        Given  the user is logged with <user_email> and <user_password>
        And the user is on "http://localhost:3000/project/1/daily"
        When the user joins an active meeting
        And the user writes "something" in the notes input field
        And the user clicks the send button
        And the user right clicks on the message
        Then the reply button is displayed
        And the reply button is clickable
        And the reply to message window is displayed
        Examples:
            | user_email          | user_password |
            | manager@amdaris.com | amdaris       |
            | staff@amdaris.com   | amdaris       |
            | admin@amdaris.com   | amdaris       |

@tc:79471
        @standup @notes @reply @positive
    Scenario: Check if users can reply to notes in stand-up meeting
        Given  the user is logged with <user_email> and <user_password>
        And the user is on "http://localhost:3000/project/1/daily"
        When the user joins an active meeting
        And the user writes "something" in the notes input field
        And the user clicks the send button
        And the user right clicks on the message
        And the user clicks on reply button
        And the user replies to the message with <input>
        Then the reply is displayed in the notes section
        And the original message is referencend
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

@tc:79472
        @standup @notes @reply @positive
    Scenario: Check if users can reply to notes in stand-up meeting - 700 chars
        Given  the user is logged with <user_email> and <user_password>
        And the user is on "http://localhost:3000/project/1/daily"
        When the user joins an active meeting
        And the user writes "something" in the notes input field
        And the user clicks the send button
        And the user right clicks on the message
        And the user clicks on reply button
        And the user replies with "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi in pharetra tortor. Sed suscipit justo metus, finibus mattis sem suscipit sit amet. Nam porta, ipsum et ornare ullamcorper, erat elit maximus arcu, et fermentum elit nulla vel sem. Ut condimentum mattis erat id commodo. Curabitur tincidunt at orci non porttitor. Mauris dignissim rhoncus augue in pretium. In volutpat sit amet dolor in hendrerit. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec vel eleifend dui. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Praesent in justo ut massa rutrum sodales sit amet id enim. Phasellus lacinia tellus."
        Then the reply is displayed in the notes section
        And the original message is referencend
        And the time of sending matches the current time
        Examples:
            | user_email          | user_password |
            | manager@amdaris.com | amdaris       |
            | staff@amdaris.com   | amdaris       |
            | admin@amdaris.com   | amdaris       |

@tc:79473
        @standup @notes @reply @positive @sync
    Scenario: Check if messages in stand-up meeting are synchronised 1
        Given User 1 is logged in with <user_email1> and <user_password1>
        And User 2 is logged in with <user_email2> and <user_password2>
        And User 3 is logged in with <user_email3> and <user_password3>
        And User 1, User 2 and User 3 join the same active stand-up meeting
        When User 1 sends "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi in pharetra tortor. Sed suscipit justo metus, finibus mattis sem suscipit sit amet. Nam porta, ipsum et ornare ullamcorper, erat elit maximus arcu, et fermentum elit nulla vel sem. Ut condimentum mattis erat id commodo." in the notes input field
        And User 2 replies "Lorem ipsum" to User 1
        And User 3 replies "Lorem ipsum" to User 2
        Then The messages are displayed in the notes section for User 2 and User 3
        And The name of the authors matches User's name
        And User 1, User 2, User 3 recieve new message notifications

        Examples:
            | user_email1         | user_password1 | user_email2         | user_password2 | user_email3       | user_password3 |
            | admin@amdaris.com   | amdaris        | manager@amdaris.com | amdaris        | staff@amdaris.com | amdaris        |
            | manager@amdaris.com | amdaris        | staff@amdaris.com   | amdaris        | admin@amdaris.com | amdaris        |
            | staff@amdaris.com   | amdaris        | manager@amdaris.com | amdaris        | admin@amdaris.com | amdaris        |

@tc:79474
        @standup @notes @reply @negative
    Scenario: Check if users can reply to notes in stand-up meeting 1
        Given  the user is logged with <user_email> and <user_password>
        And the user is on "http://localhost:3000/project/1/daily"
        When the user joins an active meeting
        And the user writes "something" in the notes input field
        And the user clicks the send button
        And the user right clicks on the message
        And the user clicks on reply button
        And the user replies to the message with <input>
        Then the user can't send the reply
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