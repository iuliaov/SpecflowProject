Feature: Column names

@col_names @positive
Scenario: Create a DS meeting with no occurence
Given the user is logged in with manager permisions
And the user is in Active tab on daily stand-up page
And the user creates "NewDs" meeting with no occurence
When the user clicks on Create 
Then the user can see "NewDs" meeting in [Stand-up Name] Column
And the user can see start date and time in [Date and Time] column
And the user can see one-time in [Occurence] column

@col_names @positive
Scenario: Create a DS meeting with daily occurence
Given the user is logged in with manager permisions
And the user is in Active tab on daily stand-up page
And the user creates "NewDs1" meeting with daily occurence
When the user clicks on Create 
Then the user can see "NewDs1" meeting name in [Stand-up Name] Column
And the user can see start date and time in [Date and Time] Column
And the user can see "Mon,Tue,Wed,Thu,Fri" in [Occurance] Column

@col_names @positive
Scenario: Create a DS meeting with three day occurence
Given the user is logged in with manager permisions
And the user is in Active tab on daily stand-up page
And the user creates "NewDs1" meeting reocuring on Monday, Wednesday and Friday
When the user clicks on Create 
Then the user can see "NewDs1" meeting name in [Stand-up Name] Column
And the user can see start date and time in [Date and Time] Column
And the user can see "Mon,Wed,Fri" in [Occurance] Column

@col_names @positive
Scenario: Saved meetings can be observed in Past tab
Given the user is logged in with manager permisions
And the user is in Active tab on daily stand-up page
And the user joins "NewDs1" meeting
And the user clicks on "End Meeting" and saves the notes
When the user moves to [Past] tab in daily
Then the user can see "NewDs1" meeting name in [Stand-up Name] Column
And the user can see meeting date in [Date] Column

@col_names @positive
Scenario: Staff user can see DS meeting column names
Given the user is logged in with staff permissions
When the user is in Active tab on Daily stand-up page
Then the user can see [Stand-up Name], [Date and Time] and [Occurance] columns
And when the user moves to Past tab
Then the user can see [Stand-up Name] and [Date] columns

@col_names @positive
Scenario: User can see column names in Retro Active tab
Given the user is logged in with manager permisions
And the user creates "New Retro" meeting
When the user moves to Active tab
Then the user can see "New Retro" meeting name in [Retro Name] Column
And the user can see meeting start date and time in [Date and Time] Column

@col_names @positive
Scenario: User can see column names in Retro Past tab
Given the user is logged in with manager permisions
And the user ends "New Retro" meeting
When the user moves to Past tab
Then the user can see "New Retro" meeting name in [Retro Name] Column
And the user can see the date and time the meeting finished in [Date and Time] Column