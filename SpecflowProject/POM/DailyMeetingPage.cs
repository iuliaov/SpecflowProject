using NUnit.Framework;
using OpenQA.Selenium;

namespace SpecflowProject.POM
{
    class DailyMeetingPage
    {
        private DriverHelper _driverHelper;
        public DailyMeetingPage(DriverHelper driver)
        {
            _driverHelper = driver;
        }
        private IWebElement _endMeeting => _driverHelper._driver.FindElement(By.XPath("//span[.='End Meeting']"));
        private IWebElement _resetButton => _driverHelper._driver.FindElement(By.XPath("//span[.='Reset']"));
        private IWebElement _editButton => _driverHelper._driver.FindElement(By.XPath("//span[.='Edit']"));
        private IWebElement _spinButton => _driverHelper._driver.FindElement(By.XPath("//button[.='Spin']"));
        private IWebElement _notesInput => _driverHelper._driver.FindElement(By.XPath("//input[@class='ant-input']"));
        private IWebElement _sendButton => _driverHelper._driver.FindElement(By.XPath("//span[@class='ant-input-suffix']"));
        private IWebElement _notesMessage => _driverHelper._driver.FindElement(By.XPath("//div[@class='ant-space-item']"));
        private IWebElement _exitEditModal => _driverHelper._driver.FindElement(By.XPath("(//span[@aria-label='close'])[1]"));
        //private IWebElement _removeParticipant => _driverHelper._driver.FindElement(By.XPath("(//span[@aria-label='close'])[2]"));
        //private IWebElement _participantCheckbox => _driverHelper._driver.FindElement(By.XPath("(//input[@type='checkbox'])[1]"));
        //  spinning wheel participant //div[@class='spinning-wheel_wheelItem__-bkMb'][.='Staff']
        private IWebElement _addButton => _driverHelper._driver.FindElement(By.XPath("//button[.='+']"));
        private IWebElement _addParticipantInput => _driverHelper._driver.FindElement(By.XPath("//input[@type='search']"));
        private IWebElement _saveButton => _driverHelper._driver.FindElement(By.XPath("//button[.='Save']"));
        private IWebElement _confirmButton => _driverHelper._driver.FindElement(By.XPath("//button[.='Confirm']"));
        private IWebElement _cancelButton => _driverHelper._driver.FindElement(By.XPath("//button[.='Cancel']"));
        private IWebElement _takeBreakButton => _driverHelper._driver.FindElement(By.XPath("//span[.='Take a break']"));
        private IWebElement _breakMinusButton => _driverHelper._driver.FindElement(By.XPath("//span[@aria-label='minus']"));
        private IWebElement _breakPlusButton => _driverHelper._driver.FindElement(By.XPath("//span[@aria-label='plus']"));
        private IWebElement _startBreakButton => _driverHelper._driver.FindElement(By.XPath("//span[.='Start break']"));
        private IWebElement _continueButton => _driverHelper._driver.FindElement(By.XPath("//span[.='Continue']"));
        private IWebElement _confirmWindowClose => _driverHelper._driver.FindElement(By.XPath("//button[@aria-label='Close']"));
        private IWebElement _saveNotesCheckbox => _driverHelper._driver.FindElement(By.XPath("//input[@type='checkbox']"));
        private IWebElement _confirmWindowCancel => _driverHelper._driver.FindElement(By.XPath("//span[.='Cancel']"));
        private IWebElement _confirmWindowOK => _driverHelper._driver.FindElement(By.XPath("//span[.='OK']"));

        public void InsertNotes(string input)
        {
            _notesInput.SendKeys(input);
        }

        public void SendNotes()
        {
            _sendButton.Click();
        }

        public void AssertNotesSent(string p0)
        {
            _driverHelper._driver.FindElement(By.XPath("//div[@class='ant-space-item']"));
            var actual = _notesMessage.Text;
            Assert.AreEqual(p0, actual);
        }




    }
}
