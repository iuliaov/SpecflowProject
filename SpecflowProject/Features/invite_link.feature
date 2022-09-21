Feature: Invite Link

@tc:80251
@invite_link @positive
Scenario: Generate the invite link
Given the user is logged in as a <user_project_role>
And the user is in Active tab on <page> page
And the user can see the [Invite] button next to an active event
When user clicks on [Invite] button
Then the link is copied to the clipboard
And the user sees a text notification "Copying to clipboard was successful!"
Examples:
|  user_project_role     | page            |
|   manager              | retro           |
|   manager              | daily stand-up  |

@tc:80252
@invite_link @negative
Scenario: Staff user can not see the invite button
Given the user is logged in as a <user_project_role>
When the user is on <page> page
Then the user can not see the [Invite] button next to an active event
Examples:
|  user_project_role     | page            |
|   staff                | retro           |
|   staff                | daily stand-up  |


@tc:80253
@invite_link @positive
Scenario: Any user can access the link
Given the user has the invite link copied on the clipboard
When the user clicks on the invite link
Then the user is redirected to the <page> meeting page
Examples:
| page            |
| retro           |
| daily stand-up  |

@tc:80254
@invite_link @positive
Scenario: Access series of the same DS meetings with the same link
Given the user has the invite link copied on the clipboard
And the user clicks on the invite link for 10:00 a.m.
And the user joins the DS meeting
And the user edits the meeting time to 10:30 a.m.
When the user clicks on the same link
Then the user joins the same DS event

@tc:80255
@invite_link @positive
Scenario: Retro events have different invite links
Given the user is logged in as a manager
And the user has two retrospective meetings created for the same project
When the user copies the invite links on the clipboard
Then the links are different

@tc:80256
@invite_link @positive
Scenario: Estimation events have different invite links
Given the user is logged in with manager permissions
And the user has two estimation meetings created for the same project
When the user copies the invite links on the clipboard
Then the links are different

@tc:80257
@invite_link @positive
Scenario: Access the link with participant permissions <nr_of_minutes> before the event starts
Given the user is not logged in
And the user has an invite link for <event_type> event
When the user accesses the invite link <nr_of_minutes> minutes before the start time
Then a message appears : "Please wait, the meeting hasn't started yet it will start at hh:mm dd/mm"
Examples:
| event_type      | nr_of_minutes |
| retro           | 20            |
| retro           | 11            |
| daily stand-up  | 20            |
| daily stand-up  | 11            |

@tc:80258
@invite_link @positive
Scenario: Access the link with participant permissions <nr_of_minutes> before the event starts, the page is kept active
Given the user is not logged in
And the user has an invite link for <event_type> event
When the user accesses the invite link <nr_of_minutes> minutes before the start time
Then a pop-up appears with the message: "Please wait, the meeting hasn't started yet it will start at hh:mm dd/mm"
And the user keeps the page active
And the page reloads when 09:59 minutes are left before the start of the meeting
And the user adds "Participant1" name in the name box
And the user is redirected to the event page
And all input is disabled
Examples:
| event_type      | nr_of_minutes |
| retro           | 11            |
| daily stand-up  | 11            |

@tc:80259
@invite_link @positive
Scenario: Access the DS meeting link with participant permissions <nr_of_minutes> minutes before the event starts
Given the user is not logged in
And the user has an invite link for <event_type> event
And the user accesses the invite link <nr_of_minutes> minutes before the start time
When the user joins the <event_type> meeting by clicking on the invite link
And the user inserts 'Participant1' name in the name box
Then the user is redirected to the <event_type> meeting
And all input is disabled
Examples:
| event_type      | nr_of_minutes |
| daily stand-up  | 10            |
| daily stand-up  | 5             |
| daily stand-up  | 1             |

@tc:80260
@invite_link @positive
Scenario: Access the retro meeting link as participant <nr_of_minutes> minutes before the event starts
Given the user has an invite link for <event_type> event
And the user accesses the invite link <nr_of_minutes> minutes before the start time
Then the user is redirected to the <event_type> meeting
And the templates are in READ mode only
And all input is disabled
Examples:
| event_type | nr_of_minutes |
| retro      | 10            |
| retro      | 5             |
| retro      | 1             |

@tc:80261
@invite_link @positive
Scenario: Access the <event_type> meeting link with manager permissions before the event starts
Given the user is logged in with manager permissions
And the user has an invite link for <event_type> event
And the user accesses the invite link <nr_of_minutes> minutes before the start time
When the user joins the <event_type> meeting by clicking on the invite link
Then the user is redirected to the <event_type> meeting
And the user enters the meeting 
Examples:
| event_type     | nr_of_minutes |
| retro          | 60            |
| retro          | 30            |
| retro          | 15            |
| retro          | 10            |
| retro          | 5             |
| retro          | 1             |
| daily stand-up | 60            |
| daily stand-up | 30            |
| daily stand-up | 15            |
| daily stand-up | 10            |
| daily stand-up | 5             |
| daily stand-up | 1             |


@tc:80262
@invite_link @positive
Scenario: Access the DS meeting link with participant permissions <nr_of_minutes> minutes before the event starts, the page is kept active
Given the user has an invite link for <event_type> event
And the user accesses the invite link <nr_of_minutes> minutes before the start time
And the user is redirected to the <event_type> meeting
And the user keeps the page active
When it is the start time of the meeting
Then the user types " Hello" in chat notes
And the use can see the note in the chat
Examples:
| event_type      | nr_of_minutes |
| daily stand-up  | 10            |
| daily stand-up  | 5             |
| daily stand-up  | 1             |

@tc:80263
@invite_link @positive
Scenario: Access the retro meeting link with staff permissions <nr_of_minutes> minutes before the event starts, the page is kept active
Given the user is logged in with staff permissions
And the user has an invite link for <event_type> event
And the user accesses the invite link <nr_of_minutes> minutes before the start time
And the user joins the <event_type> meeting by clicking on the invite link
And the templates are in READ mode only
And the user keeps the page active
When it is the start time of the meeting
Then the meeting starts 
And the user inserts his name in the dedicated box
And the user can vote in the Ice Breaking template 
Examples:
|  user_project_role  | event_type | nr_of_minutes |
|   staff             | retro      | 5             |
|   staff             | retro      | 1             |

@tc:80264
@invite_link @positive
Scenario: Access the DS meeting link with participant permissions after the event starts
Given the user has an invite link for <event_type> event
When the user accesses the invite link <nr_of_minutes> minutes after the start time
Then the user is redirected to the <event_type> meeting
And the user inserts 'Participant1' name in the name box
And the inserted name is added to the spinning wheel
Examples:
| event_type      | nr_of_minutes |
| daily stand-up  | 10            |
| daily stand-up  | 5             |
| daily stand-up  | 1             |

@tc:80265
@invite_link @positive
Scenario: Access the retro meeting link with participant permissions after the event starts
Given the user has an invite link for retro event
When the user accesses  <event_type> meeting
And the user inserts 'Participant1' name in the name box
Then the user is redirected to the active template
Examples:
|  user_project_role  | nr_of_minutes |
|   staff             | 5             |
|   staff             | 1             |


@tc:80266
@invite_link @positive
Scenario: Access an event link after the event has ended
Given the user has an invite link for <event_type> event that has ended
When the user accesses the invite link for
Then the user can not join the meeting
And the following message is displayed on the screen "This meeting has finished for today. Redirecting..."
And the user is redirected to the login page
Examples:
| event_type      |
| daily stand-up  |
| retro           |

@invite_link
Scenario: The participant leaves the meeting
Given the user acceses an invite link for <event_type> event
And the user inserts 'Participant1' name in the name box
And the inserted name is added to the spinning wheel
When the user closes the meeting tab
Then the user name is removed from the spinning wheel
Examples:
| event_type      | nr_of_minutes |
| daily stand-up  | 10            |
| daily stand-up  | 5             |
| daily stand-up  | 1             |







