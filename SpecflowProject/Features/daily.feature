Feature: Daily Stand-Up 


@daily @recurring @positive
Scenario: User sees all components on the Create New Stand-Up form 
Given  the user is logged in as a <user_role>
And the user is on <page> 
When the user clicks "Create Daily-Meeting"
Then user sees all components on the Create New Stand-Up form 
Examples:
|  user_role     | page                  |
| manager        |    Daily Stand-Up     |


@daily @recurring @positive
Scenario: Edit button is displayed on Daily page only for manager
Given  the user is logged in as a <user_role>
When the user accesses <page>
Then the edit button is <visibility> on the page
Examples:
|  user_role     | page                  | visibility   |
| manager        |    Daily Stand-Up     | visible      |
| staff          |    Daily Stand-Up     | invisible    |

@daily @recurring @positive
Scenario: User can add multiple participant names
Given  the user is logged in as a <user_role>
And the user is on <page> 
When the user clicks "Create Daily-Meeting"
And the user adds a participant name
And the input box becomes empty
Then the user can add a new participant name 
Examples:
|  user_role     | page                  |
| manager        |    Daily Stand-Up     |

@daily @recurring @positive
Scenario: User can't add an existent participant name
Given  the user is logged in as a <user_role>
And the user is on <page> 
When the user clicks "Create Daily-Meeting"
And the user adds a participant name
And the input box becomes empty
And the user writes an existing participant name
Then the user can't add the participant
Examples:
|  user_role     | page                  |
| manager        |    Daily Stand-Up     |

@daily @recurring @positive
Scenario: User can't add an empty participant name
Given  the user is logged in as a <user_role>
And the user is on <page> 
When the user clicks "Create Daily-Meeting"
And the user adds a participant name
And the input box becomes empty
And the user writes an empty participant name
Then the user can't add the participant
Examples:
|  user_role     | page                  |
| manager        |    Daily Stand-Up     |

@daily @recurring @positive
Scenario: User can't add an inexistent participant name
Given  the user is logged in as a <user_role>
And the user is on <page> 
When the user clicks "Create Daily-Meeting"
And the user adds a participant name
And the input box becomes empty
And the user writes an inexistent participant name
Then the user can't add the participant
Examples:
|  user_role     | page                  |
| manager        |    Daily Stand-Up     |

@daily @recurring @positive
Scenario: User can tick timebox and notes feature
Given  the user is logged in as a <user_role>
And the user is on <page> 
When the user clicks "Create Daily-Meeting"
Then can tick timebox and notes feature
And the timebox duration is 15 mins by default
Examples:
|  user_role     | page                  |
| manager        |    Daily Stand-Up     |

@daily @recurring @positive
Scenario: Timebox and notes feature are ticked by default
Given  the user is logged in as a <user_role>
And the user is on <page> 
When the user clicks "Create Daily-Meeting"
Then the timebox and notes feature are ticked on by default
And the timebox duration is 15 mins by default
Examples:
|  user_role     | page                  |
| manager        |    Daily Stand-Up     |

@daily @recurring @positive
Scenario: User is able to input a name for the daily
Given  the user is logged in as a <user_role>
And the user is on <page> 
When the user clicks "Create Daily-Meeting"
Then the user is able to input a name for the daily
Examples:
|  user_role     | page                  |
| manager        |    Daily Stand-Up     |

@daily @recurring @positive
Scenario: User is able to input a name no longer than 50 characters for the daily
Given  the user is logged in as a <user_role>
And the user is on <page> 
When the user clicks "Create Daily-Meeting"
Then the user is able to input a name no longer than 50 characters for the daily
Examples:
|  user_role     | page                  |
| manager        |    Daily Stand-Up     |

@daily @recurring @positive
Scenario: User is not able to create a daily with an empty name 
Given  the user is logged in as a <user_role>
And the user is on <page> 
When the user clicks "Create Daily-Meeting"
Then the user is not able to create a daily with an empty name 
Examples:
|  user_role     | page                  |
| manager        |    Daily Stand-Up     |

@daily @recurring @positive
Scenario: User is able to use the chat functionality if included
Given  the user is logged in as a <user_role>
And the user is on <page> 
When the user clicks "Create Daily-Meeting"
And the users ticks the chat checkbox
And the user creates Daily meeting
Then the user is able to use the chat functionality   
Examples:
|  user_role     | page                  |
| manager        |    Daily Stand-Up     |

@daily @recurring @positive
Scenario: User is not able to use the chat functionality if not included
Given  the user is logged in as a <user_role>
And the user is on <page> 
When the user clicks "Create Daily-Meeting"
And the users unticks the chat checkbox
And the user creates Daily meeting
Then the user is not able to use the chat functionality   
Examples:
|  user_role     | page                  |
| manager        |    Daily Stand-Up     |

@daily @recurring @positive
Scenario: User can click the edit button on Daily page
Given  the user is logged in as a <user_role>
When the user accesses <page>
And the user clicks edit button
Then the user is redirected to edit Daily page
Examples:
|  user_role     | page                  |
| manager        |    Daily Stand-Up     |
| staff          |    Daily Stand-Up     |

@daily @recurring @positive
Scenario: User can edit Daily meeting
Given  the user is logged in as a <user_role>
When the user accesses <page>
And the user clicks edit button
And the user changes Daily info
And the user presses Update button
Then the changes are saved
And the user is redirected to <page> 
Examples:
|  user_role     | page                  |
| manager        |    Daily Stand-Up     |
| staff          |    Daily Stand-Up     |

@daily @recurring @positive
Scenario: User can't update Daily meeting with empty forms 
Given  the user is logged in as a <user_role>
When the user accesses <page>
And the user clicks edit button
And the user deletes all Daily info
And the user presses Update button
Then the error messages are displayed
Examples:
|  user_role     | page                  |
| manager        |    Daily Stand-Up     |
| staff          |    Daily Stand-Up     |