Feature: Reply feature

@tc:80547
Scenario: Reply to chat messages in daily standup meeting	
Given the user1 is logged in with <user_permissions1> credentials
And user2 is logged in with <user_permissions2> credentials
And user1 joins an active standup meeting with Notes integrated
And user2 joins an active standup meeting with Notes integrated
And user1 writes "Hello" in the chat
And the user1 can see his message in the chat
When the user2 does a right click
Then [reply] button appears near the message that was clicked on
And the user2 clicks on the reply button
And a new window is open
And the user2 types "Great to see you!" in the input field
And the user2 presses on <button> button
And the user2 can see the reply message in the Notes section
And the name of user1 is visible next to the initial message
And the time of the reply is displayed
Examples:
|user_permissions1|user_permissions2 |button |
|manager          |admin             |Enter  |
|manager          |staff             |Enter  |
|manager          |manager           |Enter  |
|staff            |staff             |Enter  |
|staff            |manager           |Enter  |
|staff            |admin             |Enter  |
|manager          |admin             |Send   |
|manager          |staff             |Send   |
|manager          |manager           |Send   |
|staff            |staff             |Send   |
|staff            |manager           |Send   |
|staff            |admin             |Send   |

@tc:80548
Scenario: Scroll through the Notes	
Given the user is logged in with <user_permissions> credentials
And user joins an active standup meeting with Notes integrated
And user writes 20 lines in the chat
And the user replies with "Good" to the first 2 lines from the chat
When the user scrolls through the Notes
Then all notes that were written are displayed in the Notes component
Examples:
|user_permissions |
|manager          |
|staff            |
|admin            |

@tc:80549
Scenario: Cancel the reply message
Given the user is logged in with <user_permissions> credentials
And user joins an active standup meeting with Notes integrated
And user writes a message in the chat
And the user clicks on reply button
And the user types "New message" in the chat input field
When the user clicks on [x] button in the reply box
Then the reply window is closed
And user can see "New message" text in the input field
Examples:
|user_permissions |
|manager          |
|staff            |
|admin            |

@tc:80550
Scenario: Cancel the reply message without any content
Given the user is logged in with <user_permissions> credentials
And user joins an active standup meeting with Notes integrated
And user writes a message in the chat
And the user clicks on reply button
When the user adds no message in the chat input field
Then the send button is disabled
And the user clicks on [x] button in the reply box
And the reply window is closed
And no text message is in the input field
Examples:
|user_permissions |
|manager          |
|staff            |
|admin            |

@tc:80551
Scenario: Reply with code line
Given the user is logged in with <user_permissions> credentials
And user joins an active standup meeting with Notes integrated
And user writes a message in the chat
And the user clicks on reply button
And the user types "New message" in the chat input field
When the user clicks on [x] button in the reply box
Then the reply window is closed
And user can see "New message" text in the input field
Examples:
|user_permissions |
|manager          |
|staff            |
|admin            |