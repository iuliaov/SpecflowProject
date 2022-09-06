﻿// ------------------------------------------------------------------------------
//  <auto-generated>
//      This code was generated by SpecFlow (https://www.specflow.org/).
//      SpecFlow Version:3.9.0.0
//      SpecFlow Generator Version:3.9.0.0
// 
//      Changes to this file may cause incorrect behavior and will be lost if
//      the code is regenerated.
//  </auto-generated>
// ------------------------------------------------------------------------------
#region Designer generated code
#pragma warning disable
namespace SpecflowProject.Features
{
    using TechTalk.SpecFlow;
    using System;
    using System.Linq;
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("TechTalk.SpecFlow", "3.9.0.0")]
    [System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [NUnit.Framework.TestFixtureAttribute()]
    [NUnit.Framework.DescriptionAttribute("Pagination")]
    public partial class PaginationFeature
    {
        
        private TechTalk.SpecFlow.ITestRunner testRunner;
        
        private static string[] featureTags = ((string[])(null));
        
#line 1 "78803.feature"
#line hidden
        
        [NUnit.Framework.OneTimeSetUpAttribute()]
        public virtual void FeatureSetup()
        {
            testRunner = TechTalk.SpecFlow.TestRunnerManager.GetTestRunner();
            TechTalk.SpecFlow.FeatureInfo featureInfo = new TechTalk.SpecFlow.FeatureInfo(new System.Globalization.CultureInfo("en-US"), "Features", "Pagination", null, ProgrammingLanguage.CSharp, featureTags);
            testRunner.OnFeatureStart(featureInfo);
        }
        
        [NUnit.Framework.OneTimeTearDownAttribute()]
        public virtual void FeatureTearDown()
        {
            testRunner.OnFeatureEnd();
            testRunner = null;
        }
        
        [NUnit.Framework.SetUpAttribute()]
        public void TestInitialize()
        {
        }
        
        [NUnit.Framework.TearDownAttribute()]
        public void TestTearDown()
        {
            testRunner.OnScenarioEnd();
        }
        
        public void ScenarioInitialize(TechTalk.SpecFlow.ScenarioInfo scenarioInfo)
        {
            testRunner.OnScenarioInitialize(scenarioInfo);
            testRunner.ScenarioContext.ScenarioContainer.RegisterInstanceAs<NUnit.Framework.TestContext>(NUnit.Framework.TestContext.CurrentContext);
        }
        
        public void ScenarioStart()
        {
            testRunner.OnScenarioStart();
        }
        
        public void ScenarioCleanup()
        {
            testRunner.CollectScenarioErrors();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("Verify if link buttons are disabled then the list contains just 10 items")]
        [NUnit.Framework.CategoryAttribute("tc:79362")]
        [NUnit.Framework.CategoryAttribute("standup")]
        [NUnit.Framework.CategoryAttribute("pagination")]
        [NUnit.Framework.CategoryAttribute("positive")]
        [NUnit.Framework.TestCaseAttribute("manager", "active", "previous", "http://localhost:3000/project/1/daily", null)]
        [NUnit.Framework.TestCaseAttribute("staff", "active", "next", "http://localhost:3000/project/1/daily", null)]
        [NUnit.Framework.TestCaseAttribute("manager", "past", "previous", "http://localhost:3000/project/1/daily", null)]
        [NUnit.Framework.TestCaseAttribute("staff", "past", "next", "http://localhost:3000/project/1/daily", null)]
        [NUnit.Framework.TestCaseAttribute("manager", "active", "previous", "http://localhost:3000/project/1/retro", null)]
        [NUnit.Framework.TestCaseAttribute("staff", "active", "previous", "http://localhost:3000/project/1/retro", null)]
        [NUnit.Framework.TestCaseAttribute("staff", "past", "next", "http://localhost:3000/project/1/retro", null)]
        [NUnit.Framework.TestCaseAttribute("manager", "templates", "previous", "http://localhost:3000/project/1/retro", null)]
        [NUnit.Framework.TestCaseAttribute("staff", "templates", "next", "http://localhost:3000/project/1/retro", null)]
        [NUnit.Framework.TestCaseAttribute("manager", "past", "next", "http://localhost:3000/project/1/retro", null)]
        public void VerifyIfLinkButtonsAreDisabledThenTheListContainsJust10Items(string user_Project_Role, string meeting_Tab, string link, string page, string[] exampleTags)
        {
            string[] @__tags = new string[] {
                    "tc:79362",
                    "standup",
                    "pagination",
                    "positive"};
            if ((exampleTags != null))
            {
                @__tags = System.Linq.Enumerable.ToArray(System.Linq.Enumerable.Concat(@__tags, exampleTags));
            }
            string[] tagsOfScenario = @__tags;
            System.Collections.Specialized.OrderedDictionary argumentsOfScenario = new System.Collections.Specialized.OrderedDictionary();
            argumentsOfScenario.Add("user_project_role", user_Project_Role);
            argumentsOfScenario.Add("meeting_tab", meeting_Tab);
            argumentsOfScenario.Add("link", link);
            argumentsOfScenario.Add("page", page);
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("Verify if link buttons are disabled then the list contains just 10 items", null, tagsOfScenario, argumentsOfScenario, featureTags);
#line 7
this.ScenarioInitialize(scenarioInfo);
#line hidden
            if ((TagHelper.ContainsIgnoreTag(tagsOfScenario) || TagHelper.ContainsIgnoreTag(featureTags)))
            {
                testRunner.SkipScenario();
            }
            else
            {
                this.ScenarioStart();
#line 8
testRunner.Given("the user is logged in as a <user_role>", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line hidden
#line 9
testRunner.And(string.Format("the user is on {0}", page), ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 10
testRunner.And(string.Format("the list of {0} should contain 10 items", meeting_Tab), ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 11
testRunner.When(string.Format("the user presses the {0} button", link), ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line hidden
#line 12
testRunner.Then("the button is disabled", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
#line 13
testRunner.And("nothing happens", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 14
testRunner.And("the same list is displayed", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            }
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("Verify if link buttons are displayed then the list contains  0 items")]
        [NUnit.Framework.CategoryAttribute("tc:79363")]
        [NUnit.Framework.CategoryAttribute("standup")]
        [NUnit.Framework.CategoryAttribute("pagination")]
        [NUnit.Framework.CategoryAttribute("positive")]
        [NUnit.Framework.TestCaseAttribute("manager", "active", "http://localhost:3000/project/1/daily", null)]
        [NUnit.Framework.TestCaseAttribute("staff", "active", "http://localhost:3000/project/1/daily", null)]
        [NUnit.Framework.TestCaseAttribute("manager", "past", "http://localhost:3000/project/1/daily", null)]
        [NUnit.Framework.TestCaseAttribute("staff", "past", "http://localhost:3000/project/1/daily", null)]
        [NUnit.Framework.TestCaseAttribute("manager", "active", "http://localhost:3000/project/1/retro", null)]
        [NUnit.Framework.TestCaseAttribute("staff", "active", "http://localhost:3000/project/1/retro", null)]
        [NUnit.Framework.TestCaseAttribute("staff", "past", "http://localhost:3000/project/1/retro", null)]
        [NUnit.Framework.TestCaseAttribute("manager", "templates", "http://localhost:3000/project/1/retro", null)]
        [NUnit.Framework.TestCaseAttribute("staff", "templates", "http://localhost:3000/project/1/retro", null)]
        [NUnit.Framework.TestCaseAttribute("manager", "past", "http://localhost:3000/project/1/retro", null)]
        public void VerifyIfLinkButtonsAreDisplayedThenTheListContains0Items(string user_Project_Role, string meeting_Tab, string page, string[] exampleTags)
        {
            string[] @__tags = new string[] {
                    "tc:79363",
                    "standup",
                    "pagination",
                    "positive"};
            if ((exampleTags != null))
            {
                @__tags = System.Linq.Enumerable.ToArray(System.Linq.Enumerable.Concat(@__tags, exampleTags));
            }
            string[] tagsOfScenario = @__tags;
            System.Collections.Specialized.OrderedDictionary argumentsOfScenario = new System.Collections.Specialized.OrderedDictionary();
            argumentsOfScenario.Add("user_project_role", user_Project_Role);
            argumentsOfScenario.Add("meeting_tab", meeting_Tab);
            argumentsOfScenario.Add("page", page);
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("Verify if link buttons are displayed then the list contains  0 items", null, tagsOfScenario, argumentsOfScenario, featureTags);
#line 31
this.ScenarioInitialize(scenarioInfo);
#line hidden
            if ((TagHelper.ContainsIgnoreTag(tagsOfScenario) || TagHelper.ContainsIgnoreTag(featureTags)))
            {
                testRunner.SkipScenario();
            }
            else
            {
                this.ScenarioStart();
#line 32
testRunner.Given("the user is logged in as a <user_role>", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line hidden
#line 33
testRunner.And(string.Format("the user is on {0}", page), ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 34
testRunner.And(string.Format("the list of {0} should contain 0 items", meeting_Tab), ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 35
testRunner.Then("the user should see a message that there are no items to be displayed", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            }
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("Verify if on the page are displyed maximum 10 items")]
        [NUnit.Framework.CategoryAttribute("tc:79364")]
        [NUnit.Framework.CategoryAttribute("standup")]
        [NUnit.Framework.CategoryAttribute("pagination")]
        [NUnit.Framework.CategoryAttribute("positive")]
        [NUnit.Framework.TestCaseAttribute("manager", "active", "http://localhost:3000/project/1/daily", "11", null)]
        [NUnit.Framework.TestCaseAttribute("staff", "past", "http://localhost:3000/project/1/daily", "21", null)]
        [NUnit.Framework.TestCaseAttribute("manager", "active", "http://localhost:3000/project/1/retro", "19", null)]
        [NUnit.Framework.TestCaseAttribute("staff", "past", "http://localhost:3000/project/1/retro", "25", null)]
        [NUnit.Framework.TestCaseAttribute("manager", "templates", "http://localhost:3000/project/1/retro", "31", null)]
        public void VerifyIfOnThePageAreDisplyedMaximum10Items(string user_Project_Role, string meeting_Tab, string page, string number_Of_Items, string[] exampleTags)
        {
            string[] @__tags = new string[] {
                    "tc:79364",
                    "standup",
                    "pagination",
                    "positive"};
            if ((exampleTags != null))
            {
                @__tags = System.Linq.Enumerable.ToArray(System.Linq.Enumerable.Concat(@__tags, exampleTags));
            }
            string[] tagsOfScenario = @__tags;
            System.Collections.Specialized.OrderedDictionary argumentsOfScenario = new System.Collections.Specialized.OrderedDictionary();
            argumentsOfScenario.Add("user_project_role", user_Project_Role);
            argumentsOfScenario.Add("meeting_tab", meeting_Tab);
            argumentsOfScenario.Add("page", page);
            argumentsOfScenario.Add("number_of_items", number_Of_Items);
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("Verify if on the page are displyed maximum 10 items", null, tagsOfScenario, argumentsOfScenario, featureTags);
#line 51
this.ScenarioInitialize(scenarioInfo);
#line hidden
            if ((TagHelper.ContainsIgnoreTag(tagsOfScenario) || TagHelper.ContainsIgnoreTag(featureTags)))
            {
                testRunner.SkipScenario();
            }
            else
            {
                this.ScenarioStart();
#line 52
testRunner.Given("the user is logged in as a <user_role>", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line hidden
#line 53
testRunner.And(string.Format("the user is on {0}", page), ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 54
testRunner.And(string.Format("the list of {0} should contain {1} items", meeting_Tab, number_Of_Items), ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 55
testRunner.Then("the pagination should display that there are pages (number_of_items/10)", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
#line 56
testRunner.And(string.Format("the total items should be {0}", number_Of_Items), ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 57
testRunner.And("on one page should be displayed just 10 items", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            }
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("Verify if the current page is active in the pagination box")]
        [NUnit.Framework.CategoryAttribute("tc:79365")]
        [NUnit.Framework.CategoryAttribute("standup")]
        [NUnit.Framework.CategoryAttribute("pagination")]
        [NUnit.Framework.CategoryAttribute("positive")]
        [NUnit.Framework.TestCaseAttribute("manager", "active", "http://localhost:3000/project/1/daily", null)]
        [NUnit.Framework.TestCaseAttribute("staff", "past", "http://localhost:3000/project/1/daily", null)]
        [NUnit.Framework.TestCaseAttribute("manager", "active", "http://localhost:3000/project/1/retro", null)]
        [NUnit.Framework.TestCaseAttribute("staff", "past", "http://localhost:3000/project/1/retro", null)]
        [NUnit.Framework.TestCaseAttribute("manager", "templates", "http://localhost:3000/project/1/retro", null)]
        public void VerifyIfTheCurrentPageIsActiveInThePaginationBox(string user_Project_Role, string meeting_Tab, string page, string[] exampleTags)
        {
            string[] @__tags = new string[] {
                    "tc:79365",
                    "standup",
                    "pagination",
                    "positive"};
            if ((exampleTags != null))
            {
                @__tags = System.Linq.Enumerable.ToArray(System.Linq.Enumerable.Concat(@__tags, exampleTags));
            }
            string[] tagsOfScenario = @__tags;
            System.Collections.Specialized.OrderedDictionary argumentsOfScenario = new System.Collections.Specialized.OrderedDictionary();
            argumentsOfScenario.Add("user_project_role", user_Project_Role);
            argumentsOfScenario.Add("meeting_tab", meeting_Tab);
            argumentsOfScenario.Add("page", page);
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("Verify if the current page is active in the pagination box", null, tagsOfScenario, argumentsOfScenario, featureTags);
#line 69
this.ScenarioInitialize(scenarioInfo);
#line hidden
            if ((TagHelper.ContainsIgnoreTag(tagsOfScenario) || TagHelper.ContainsIgnoreTag(featureTags)))
            {
                testRunner.SkipScenario();
            }
            else
            {
                this.ScenarioStart();
#line 70
testRunner.Given("the user is logged in as a <user_role>", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line hidden
#line 71
testRunner.And(string.Format("the user is on {0}", page), ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 72
testRunner.And(string.Format("the list of {0} should contain more than 10 items", meeting_Tab), ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 73
testRunner.And("the first page should be active", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 74
testRunner.And("the previous button should be disabled", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 75
testRunner.When("the user presses next button", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line hidden
#line 76
testRunner.Then("the second page shoud be active", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
#line 77
testRunner.And("the previous button should be active", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            }
            this.ScenarioCleanup();
        }
    }
}
#pragma warning restore
#endregion