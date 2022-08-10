Feature: Wheel

@tc:79565
@stand-up @Wheel @positive
Scenario: When the user joins a Stand-Up and reloads the page, wheel remains intact
Given  the user is logged in as a <user_role>
And the user is on <page> 
When the user presses on the <stand-up>
And the user reloads the <stand-up> meeting
Then the information on wheel remains the same

Examples:
|  user_role   | page               |stand-up                                   |
| manager      |  Daily Stand-Up    |http://localhost:3000/project/1/daily/202  |
| user         |  Daily Stand-Up    |http://localhost:3000/project/1/daily/202  |


@tc:79566
@stand-up @Wheel @positive
Scenario: Wheel remains intact after reloading on the last participant 
Given  the user is logged in as a <user_role>
And the user is on <page> 
When the user presses on the <stand-up> 
And the wheel spins until the last participant
And the user reloading the <stand-up> meeting
Then the information on wheel remains the same

Examples:
|  user_role   | page               |stand-up                                   |
| manager      |  Daily Stand-Up    |http://localhost:3000/project/1/daily/202  |
| user         |  Daily Stand-Up    |http://localhost:3000/project/1/daily/202  |


@tc:79567
@stand-up @Wheel @positive
Scenario: Wheel remains intact on reload after performing a spin
Given  the user is logged in as a <user_role>
And the user is on <page> 
When the user presses on the <stand-up> 
And the wheel spins one time
And the user reloads the <stand-up> meeting
Then the information on wheel remains the same

Examples:
|  user_role   | page               |stand-up                                   |
| manager      |  Daily Stand-Up    |http://localhost:3000/project/1/daily/202  |
| user         |  Daily Stand-Up    |http://localhost:3000/project/1/daily/202  |


@tc:79568
@stand-up @Wheel @positive
Scenario: Wheel remains intact on reload after performing reset
Given  the user is logged in as a <user_role>
And the user is on <page> 
When the user presses on the <stand-up>
And the wheel spins one time
And the user clicks reset button
And the user reloads the <stand-up> meeting
Then the information on wheel remains the same

Examples:
|  user_role   | page               |stand-up                                   |
| manager      |  Daily Stand-Up    |http://localhost:3000/project/1/daily/202  |
| user         |  Daily Stand-Up    |http://localhost:3000/project/1/daily/202  |



@tc:79569
@stand-up @Wheel @positive
Scenario: Wheel with two participants remains intact after reloading 
Given  the user is logged in as a <user_role>
And the user is on <page> 
When the user presses on the <stand-up>
And the wheel spins until two participants are left
And the user reloads the <stand-up> meeting
Then the information on wheel remains the same

Examples:
|  user_role   | page               |stand-up                                   |
| manager      |  Daily Stand-Up    |http://localhost:3000/project/1/daily/202  |
| user         |  Daily Stand-Up    |http://localhost:3000/project/1/daily/202  |

