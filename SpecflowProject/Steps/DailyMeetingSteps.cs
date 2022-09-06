using OpenQA.Selenium;
using SpecflowProject.POM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using TechTalk.SpecFlow;

namespace SpecflowProject.Steps
{
    [Binding]
    class DailyMeetingSteps
    {
        private DriverHelper _driverHelper;

        public DailyMeetingSteps(DriverHelper driver)
        {
            _driverHelper = driver;
            _driverHelper._wait.IgnoreExceptionTypes(typeof(NoSuchElementException));
        }

        string notesContent;

        [Given(@"User clicks Join button next to ""(.*)"" daily meeting")]
        public void GivenUserClicksJoinButtonNextToDailyMeeting(string p0)
        {
            DailyStandUpPage dailyStandUpPage = new DailyStandUpPage(_driverHelper);
            dailyStandUpPage.JoinDailyMeeting(p0);
        }

        [When(@"User inserts in notes section ""(.*)""")]
        public void WhenUserInsertsInNotesSection(string p0)
        {
            notesContent = p0;
            DailyMeetingPage dailyMeetingPage = new DailyMeetingPage(_driverHelper);
            Thread.Sleep(1000);
            dailyMeetingPage.InsertNotes(p0);
        }

        [When(@"User clicks send")]
        public void WhenUserClicksSend()
        {
            DailyMeetingPage dailyMeetingPage = new DailyMeetingPage(_driverHelper);
            dailyMeetingPage.SendNotes();
        }

        [Then(@"The message is sent")]
        public void ThenTheMessageIsSent()
        {
            DailyMeetingPage dailyMeetingPage = new DailyMeetingPage(_driverHelper);
            dailyMeetingPage.AssertNotesSent(notesContent);
        }

    }

}
