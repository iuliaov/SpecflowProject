Feature: Login

Scenario: Successful login
	#Steps
	Given user is on "https://delivery-toolkit.azurewebsites.net/"
	When user inserts email and password
		| email   | password   |
		| <email> | <password> |
	And user clicks Login
	Then user is logged in

	Examples:
		| email            | password |
		| manager@amdaris.com | amdaris    |
		| staff@amdaris.com   | amdaris    |
		| admin@amdaris.com   | amdaris    |