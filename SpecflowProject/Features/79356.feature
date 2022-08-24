Feature: Invite Link

@invite_link @positive
Scenario: Generate the invite link
Given the user is logged in as a <user_project_role>
And the user is in Active tab on <page> page
And the user can see the [Invite] button next to an active event
And the button is visible
When user clicks on [Invite] button
Then the link is copied to the clipboard
And the user sees a text notification saying that the link is copied
Examples:
|  user_project_role     | page            |
|   manager              | retro           |
|   manager              | daily stand-up  |

@invite_link
Scenario: Staff user can not see the invite button
Given the user is logged in as a <user_project_role>
When the user is on <page> page
Then the user can not see the [Invite] button next to an active event
Examples:
|  user_project_role     | page            |
|   staff                | retro           |
|   staff                | daily stand-up  |


@invite_link @positive
Scenario: Any user can access the link
Given the user is logged in as a <user_project_role>
And the user has the invite link copied on the clipboard
When the user clicks on the invite link
Then the user is redirected to the <page> meeting page
Examples:
|  user_project_role     | page            |
|   manager              | retro           |
|   manager              | daily stand-up  |
|   staff                | retro           |
|   staff                | daily stand-up  |

@invite_link @positive
Scenario: Access series of the same DS meetings with the same link
Given the user is logged in as a <user_project_role>
And the user has the invite link copied on the clipboard
And the DS has a daily occurence
And the user clicks on the invite link
And the user joins the DS meeting
When the user clicks on the same link, on the next day
Then the user joins the same DS event as on the day before
Examples:
|  user_project_role     |
|   manager              |
|   staff                |

@invite_link @positive
Scenario: Retro events have different invite links
Given the user is logged in as a manager
And the user has two retrospective meetings created for the same project
When the user copies the invite links on the clipboard
Then the links are different

@invite_link @positive
Scenario: Estimation events have different invite links
Given the user is logged in as a manager
And the user has two estimation meetings created for the same project
When the user copies the invite links on the clipboard
Then the links are different

@invite_link @positive
Scenario: Access the link with staff permissions <nr_of_minutes> before the event starts
Given the user is logged in with staff permissions
And the user has an invite link for <event_type> event
And the user accesses the invite link <nr_of_minutes> minutes before the start time
When the user joins the <event_type> meeting by clicking on the invite link
Then a pop-up appears with the message : "Meeting has not started yet"
Examples:
| event_type      | nr_of_minutes |
| retro           | 20            |
| retro           | 11            |
| retro           | 60            |
| daily stand-up  | 20            |
| daily stand-up  | 11            |
| daily stand-up  | 60            |

@invite_link @positive
Scenario: Access the link with staff permissions <nr_of_minutes> before the event starts, the page is kept active
Given the user is logged in with staff permissions
And the user has an invite link for <event_type> event
And the user accesses the invite link <nr_of_minutes> minutes before the start time
When the user joins the <event_type> meeting by clicking on the invite link
And a pop-up appears with the message: "Meeting has not started yet"
And the user keeps the page active
Then the page reloads when 09:59 minutes are left before the start of the meeting
And the user is redirected to the <event_type> meeting
And all input is disabled
Examples:
| event_type      | nr_of_minutes |
| retro           | 11            |
| daily stand-up  | 11            |

@invite_link @positive
Scenario: Access the DS meeting link with staff permissions <nr_of_minutes> minutes before the beginning of the event
Given the user is logged in with staff permissions
And the user has an invite link for <event_type> event
And the user accesses the invite link <nr_of_minutes> minutes before the start time
When the user joins the <event_type> meeting by clicking on the invite link
Then the user is redirected to the <event_type> meeting
And all input is disabled
Examples:
|  user_project_role  | event_type      | nr_of_minutes |
|   staff             | daily stand-up  | 10            |
|   staff             | daily stand-up  | 5             |
|   staff             | daily stand-up  | 1             |

@invite_link @positive
Scenario: Access the retro meeting link with staff permissions <nr_of_minutes> minutes before the beginning of the event
Given the user is logged in with staff permissions
And the user has an invite link for <event_type> event
And the user accesses the invite link <nr_of_minutes> minutes before the start time
When the user joins the <event_type> meeting by clicking on the invite link
Then the user is redirected to the <event_type> meeting
And the templates are in READ mode only
And all input is disabled
Examples:
|  user_project_role  | event_type | nr_of_minutes |
|   staff             | retro      | 10            |
|   staff             | retro      | 5             |
|   staff             | retro      | 1             |

@invite_link @positive
Scenario: Access the <event_type> meeting link with manager permissions before the beginning of the event
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


@invite_link @positive
Scenario: Access the DS meeting link with staff permissions <nr_of_minutes> minutes before the beginning of the event, the page is kept active
Given the user is logged in with staff permissions
And the user has an invite link for <event_type> event
And the user accesses the invite link <nr_of_minutes> minutes before the start time
And the user is redirected to the <event_type> meeting
And all input is disabled
And the user keeps the page active
When it is the start time of the meeting
Then the meeting starts 
And the user can see the content of the <event> meeting
Examples:
|  user_project_role  | event_type      | nr_of_minutes |
|   staff             | daily stand-up  | 10            |
|   staff             | daily stand-up  | 5             |
|   staff             | daily stand-up  | 1             |

@invite_link @positive
Scenario: Access the retro meeting link with staff permissions <nr_of_minutes> minutes before the beginning of the event, the page is kept active
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

@invite_link @positive
Scenario: Access the DS meeting link with staff permissions after the beginning of the event
Given the user is logged in with staff permissions
And the user has an invite link for <event_type> event
When the user accesses the invite link <nr_of_minutes> minutes after the start time
Then the user is redirected to the <event_type> meeting
And the user inserts 'Participant1' name in the name box
And the inserted name is added to the spinning wheel
Examples:
|  user_project_role  | event_type      | nr_of_minutes |
|   staff             | daily stand-up  | 10            |
|   staff             | daily stand-up  | 5             |
|   staff             | daily stand-up  | 1             |

@invite_link @positive
Scenario: Access the retro meeting link with staff permissions after the beginning of the event
Given the user is logged in with staff permissions
And the user has an invite link for <event_type> event
When the user accesses  <event_type> meeting
And the user inserts 'Participant1' name in the name box
Then the user is redirected to the active template
Examples:
|  user_project_role  | event_type | nr_of_minutes |
|   staff             | retro      | 5             |
|   staff             | retro      | 1             |


@invite_link @positive
Scenario: Access an event link after the event has ended
Given the user is logged in with <user_project_role> permissions
And the user has an invite link for <event_type> event
And the manager ends the <event_type> event
When the user accesses the invite link for the event that has ended
Then the user can not join the meeting
And a pop-up appears with the message: "Meeting has not started yet"
Examples:
|  user_project_role  | event_type      |
|   staff             | daily stand-up  |
|   staff             | retro           |









