using NUnit.Framework;
using OpenQA.Selenium;
using SpecflowProject.POM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using TechTalk.SpecFlow;
using TechTalk.SpecFlow.Assist;

namespace SpecflowProject.Steps
{
    [Binding]
    class CreateDailySteps
    {
        private DriverHelper _driverHelper;

        public CreateDailySteps(DriverHelper driver)
        {
            _driverHelper = driver;
            _driverHelper._wait.IgnoreExceptionTypes(typeof(NoSuchElementException));
        }

        public static string dailyTitle="";

        [Given(@"User accessed project number ""(.*)"" in with ""(.*)"" credetials")]
        public void GivenUserAccessedProjectNumberInWithCredetials(int p0, string p1)
        {
            LoginPage loginPage = new LoginPage(_driverHelper);
            loginPage.Login(p1, p0);
        }

        [Given(@"User clicks Create Daily-Meeting button")]
        public void GivenUserClicksCreateDaily_MeetingButton()
        {
            DailyStandUpPage dailyStandUpPage = new DailyStandUpPage(_driverHelper);
            dailyStandUpPage.ClickCreateDaily();

        }

        [When(@"User fills in the Create Daily Meeting form with valid data")]
        public void WhenUserFillsInTheCreateDailyMeetingFormWithValidData(Table table)
        {
            dynamic data = table.CreateDynamicInstance();
            string event_name = data.event_name;
            string notes = data.notes;
            string timer = data.timer;
            string hours = data.hours.ToString();
            string minutes = data.minutes.ToString();
            dailyTitle = event_name;
            Thread.Sleep(1000);
            CreateDailyForm createDailyForm = new CreateDailyForm(_driverHelper);
            createDailyForm.InsertTitle(event_name);
            createDailyForm.CheckNotes(notes);
            createDailyForm.CheckTimer(timer);
            createDailyForm.InsertDuration(hours, minutes);
            createDailyForm.InsertDate();
            createDailyForm.InsertTime();
        }

        [When(@"User selects ""(.*)"" and ""(.*)"" and ""(.*)"" as participants")]
        public void WhenUserSelectsAndAndAsParticipants(string p0, string p1, string p2)
        {
            CreateDailyForm createDailyForm = new CreateDailyForm(_driverHelper);
            createDailyForm.SelectParticipant(p0);
            createDailyForm.SelectParticipant(p1);
            createDailyForm.SelectParticipant(p2);
        }

        [When(@"User selects ""(.*)"" and ""(.*)"" as occurence")]
        public void WhenUserSelectsAndAsOccurence(string p0, string p1)
        {
            CreateDailyForm createDailyForm = new CreateDailyForm(_driverHelper);
            createDailyForm.SelectOccurence(p0);
            createDailyForm.SelectOccurence(p1);
        }

        [When(@"User clicks Create")]
        public void WhenUserClicksCreate()
        {
            CreateDailyForm createDailyForm = new CreateDailyForm(_driverHelper);
            createDailyForm.ClickCreate();
        }

        [Then(@"The meeting is created")]
        public void ThenTheMeetingIsCreated()
        {
            DailyStandUpPage dailyStandUpPage = new DailyStandUpPage(_driverHelper);
            Thread.Sleep(1000);
            dailyStandUpPage.AssertDailyCreated();

        }
    }
}
