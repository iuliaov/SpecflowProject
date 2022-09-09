Feature: Spinning Wheel

Scenario: Participants are added to the spinning wheel upon joining daily
Given 'manager' joined a daily stand-up meeting
When 'staff' user joins the daily stand-up meeting
And 'staff 1' user joins the daily stand-up meeting
Then manager user is not added on the spinning wheel
And 'staff' user is added on the spinning wheel
And 'staff 1' user is added on the spinning wheel

Scenario: Staff participants are removed for the spinning wheel upon leaving daily
Given 'manager','staff' and 'staff 1' joined the daily stand-up meeting
When 'staff' leaves the meeting
And 'staff 1' leaves the meeting
Then no participants are left on the spinning wheel

Scenario: Manager participant leaves daily
Given 'manager','staff' and 'staff 1' joined the daily stand-up meeting
When 'manager' leaves the meeting
Then the spinning wheel doesn't change it's state

Scenario: Manager rejoins the daily meeting
Given 'manager','staff' and 'staff 1' joined the daily stand-up meeting
When 'manager' leaves the meeting
And 'manager' rejoins the meeting
Then the same participants are on the wheel
And the spin button is enabled

Scenario: Staff rejoins the daily meeting
Given 'manager','staff' and 'staff 1' joined the daily stand-up meeting
When 'staff' leaves the meeting
And 'staff' rejoins the meeting
Then the same participants are on the wheel

Scenario: Manager rejoins the daily meeting after spin
Given 'manager','staff' and 'staff 1' joined the daily stand-up meeting
When 'manager' spins the wheel
And 'manager' leaves the meeting
And 'manager' rejoins the meeting
Then the user to speak is the same
And the same participants are on the wheel
And the spin button is enabled

Scenario: Staff rejoins the daily meeting after spin
Given 'manager','staff' and 'staff 1' joined the daily stand-up meeting
When 'manager' spins the wheel
And 'staff' leaves the meeting
And 'staff' rejoins the meeting
Then the user to speak is the same
And the same participants are on the wheel

Scenario: The wheel is spun once
Given 'manager','staff' and 'staff 1' joined the daily stand-up meeting
When 'manager' spins the wheel
Then the wheel spins
And a random user to speak is selected
And the same participants are on the wheel

Scenario: The wheel is spun multiple times
Given 'manager','staff' and 'staff 1' joined the daily stand-up meeting
When 'manager' spins the wheel twice
Then the wheel spins
And a random user to speak is selected
And the previus user to speak is removed from the wheel
And the spin button is disabled

Scenario: Reset button manager permissions
Given 'manager','staff' and 'staff 1' joined the daily stand-up meeting
When 'manager' spins the wheel twice
And 'manager' clicks reset
Then the wheel resets to it's initial state

Scenario: Reset button staff permissions
Given 'manager','staff' and 'staff 1' joined the daily stand-up meeting
When 'manager' spins the wheel twice
And 'staff' inspects the page
Then the reset button is not displayed

Scenario: Edit before spin manager permissions 
Given 'manager','staff', 'staff 1', 'staff 2' joined the daily stand-up meeting
When 'manager' unticks the checkbox next to 'staff 1' 
And 'manager' clicks confirm
And 'manager' spins the wheel
Then 'staff 1' is removed from the spinning wheel
And the wheel spins
And a random user to speak is selected

Scenario: Edit after spin manager permissions
Given 'manager','staff', 'staff 1', 'staff 2', 'staff 3' joined the daily stand-up meeting
When 'manager' spins the wheel
And 'manager' unticks the checkbox next to non-selected staff user
And 'manager' clicks confirm
Then the wheel spins
And a random user to speak is selected 
And non-selected staff user is removed from the spinning wheel

Scenario: Edit without confirmation
Given 'manager','staff', 'staff 1', 'staff 2', 'staff 3' joined the daily stand-up meeting
When 'manager' spins the wheel
And 'manager' unticks the checkbox next to 'staff' user
And 'manager' clicks cancel
Then the wheel doesn't change it's state
And the edit modal list is reset to it's inital state

Scenario: Edit and close
Given 'manager','staff', 'staff 1', 'staff 2', 'staff 3' joined the daily stand-up meeting
When 'manager' spins the wheel
And 'manager' unticks the checkbox next to 'staff' user
And 'manager' clicks X
Then the wheel doesn't change it's state
And the 'staff' checkbox is unticked 

Scenario: Edit button before spin staff permissions 
Given 'manager','staff', 'staff 1', 'staff 2' joined the daily stand-up meeting
When 'staff' inspects the page
Then the edit button is not displayed

Scenario: Edit button after spin staff permissions 
Given 'manager','staff', 'staff 1', 'staff 2' joined the daily stand-up meeting
When 'manager' spins the wheel
And 'staff' inspects the page
Then the edit button is not displayed

Scenario: Spinning wheel edit modal
Given 'manager','staff', 'staff 1', 'staff 2' joined the daily stand-up meeting
When 'manager' clicks edit button
And inspects the edit modal
Then all staff participants are displayed
And for each staff participant there is a ticked checkbox
And the cancel button is displayed
And the confirm button is displayed
And the X button is displayed

Scenario: Spin button during break
Given 'manager','staff' and 'staff 1' joined the daily stand-up meeting
When 'manager' spins the wheel
And 'manager' takes a '5' minute break
Then the break timer is launched
And the spin button is disabled

Scenario: Spin button unavailable for staff users
Given 'manager','staff' and 'staff 1' joined the daily stand-up meeting
When 'staff' inspects the spinning wheel
Then the spin button is not displayed

Scenario: Manager refreshes the daily meeting page
Given 'manager','staff' and 'staff 1' joined the daily stand-up meeting
When 'manager' refreshes the  the daily meeting page
Then the same participants are on the wheel
And the spin button is enabled

Scenario: Staff refreshes the daily meeting page
Given 'manager','staff' and 'staff 1' joined the daily stand-up meeting
When 'staff' refreshes the  the daily meeting page
Then the same participants are on the wheel

Scenario: Manager refreshes the daily meeting page after spin
Given 'manager','staff' and 'staff 1' joined the daily stand-up meeting
When 'manager' spins the wheel
And 'manager' refreshes the  the daily meeting page
Then the user to speak is the same
And the same participants are on the wheel
And the spin button is enabled

Scenario: Staff refreshes the daily meeting page after spin
Given 'manager','staff' and 'staff 1' joined the daily stand-up meeting
When 'manager' spins the wheel
And 'staff' refreshes the  the daily meeting page
Then the user to speak is the same
And the same participants are on the wheel









