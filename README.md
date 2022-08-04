# SpecflowProject

Create a new .feature file in Features for your TC's 

(use my file as an example but don't write in tags TC number ex.tc:79223, it's added automatically by specsync)

In specsync.json change testSuite to the one you want to add TC's(`78922 - Disable blank messages in Note` in my case)

Open terminal in the project folder

Write in command  `dotnet specsync push`

You will be requested Azure DevOps personal access token (PAT) or user name:

For the first option follow this link:

https://docs.microsoft.com/en-us/azure/devops/organizations/accounts/use-personal-access-tokens-to-authenticate

Answer `no` at the next question and the tests will be linked to Azure in the Test Suite you specified in specsync.json
