Feature: DailyStandUpMeeting
	Simple calculator for adding two numbers

@mytag
Scenario: Daily stand-up notes
	Given User accessed project number "1" in with "manager" credetials
	And User clicks Join button next to "Framework Test" daily meeting
	When User inserts in notes section "Yo, I'll tell you what I want, what I really, really want So tell me what you want, what you really, really want I'll tell you what I want, what I really, really want So tell me what you want, what you really, really want I wanna (Hey!), I wanna (Hey!), I wanna (Hey!), I wanna (Hey!) I wanna really, really, really wanna zig-a-zig, ah"
	And User clicks send
	Then The message is sent 

Scenario: Daily stand-up spinning wheel
Given User accessed project number "1" in with "manager" credetials
	And User clicks Join button next to "Framework Test" daily meeting 
	When User clicks the Spin button 
	Then The wheel spins