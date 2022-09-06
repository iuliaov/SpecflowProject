using OpenQA.Selenium;
using OpenQA.Selenium.Interactions;
using SeleniumExtras.WaitHelpers;

namespace SpecflowProject.POM
{
    class CreateDailyForm
    {
        private DriverHelper _driverHelper;
        public CreateDailyForm(DriverHelper driver)
        {
            _driverHelper = driver;
        }

        private IWebElement _eventName => _driverHelper._driver.FindElement(By.XPath("//input[@placeholder='Event name']"));
        private IWebElement _notesCheckbox => _driverHelper._driver.FindElement(By.XPath("//input[@id='notes']"));
        private IWebElement _timerCheckbox => _driverHelper._driver.FindElement(By.XPath("(//input[@type='checkbox'])[2]"));
        private IWebElement _hourInput => _driverHelper._driver.FindElement(By.XPath("(//input[@maxlength='2'])[1]"));
        private IWebElement _hourUp => _driverHelper._driver.FindElement(By.XPath("(//span[@aria-label='up'])[1]"));
        private IWebElement _hourDown => _driverHelper._driver.FindElement(By.XPath("(//span[@aria-label='down'])[1]"));
        private IWebElement _minuteInput => _driverHelper._driver.FindElement(By.XPath("(//input[@maxlength='2'])[2]"));
        private IWebElement _minuteUp => _driverHelper._driver.FindElement(By.XPath("(//span[@aria-label='up'])[2]"));
        private IWebElement _minuteDown => _driverHelper._driver.FindElement(By.XPath("(//span[@aria-label='down'])[2]"));
        private IWebElement _participantsField => _driverHelper._driver.FindElement(By.XPath("(//div[@class='ant-select-selector'])[1]"));

        //  _participantRemove span[@class='ant-select-selection-item-remove'] sau //span/span[2] si ordinea pe pagina //span[.= 'User #1']/span[@class='ant-select-selection-item-remove']
        private IWebElement _occurenceField => _driverHelper._driver.FindElement(By.XPath("(//div[@class='ant-select-selector'])[2]"));

        //  _occurenceRemove span[@class='ant-select-selection-item-remove'] sau //span/span[2] si ordinea pe pagina
        private IWebElement _createButton => _driverHelper._driver.FindElement(By.XPath("//button[@type='submit']"));
        private IWebElement _backButton => _driverHelper._driver.FindElement(By.XPath("//span[.='Back']"));


        public void InsertTitle(string title)
        {
           _driverHelper._wait.Until(ExpectedConditions.ElementToBeClickable(By.XPath("//input[@placeholder='Event name']")));
           _eventName.WaitAndType(title, _driverHelper._wait);
        }

        public void CheckNotes(string input)
        {
           if (input == "check")
            {
                _driverHelper._wait.Until(ExpectedConditions.ElementToBeClickable(By.XPath("//span[@class='ant-checkbox']"))).Click();
            }
        }

        public void CheckTimer(string input)
        {
            if (input != "check")
            {
               // _driverHelper._wait.Until(ExpectedConditions.ElementToBeClickable(By.XPath("//div[3]/div/div/div/div/label/span[1]/input"))).Click();

                By.XPath("//div[3]/div/div/div/div/label/span[1]/input").WaitAndClick(_driverHelper._wait);
            }
        }
        public void InsertDuration(string hours, string minutes)
        {
            _hourInput.ClearAndType(hours, _driverHelper._wait);
            _hourInput.SendKeys(Keys.Tab);

            _minuteInput.ClearAndType(minutes, _driverHelper._wait);
            _minuteInput.SendKeys(Keys.Enter);
        }

        // //span[@aria-label='calendar']   calendar field
        // //a[.='Today'] date today

        // //span[@aria-label='clock-circle'] time field
        //(//div[.='01'])[1] hours
        // (//div[.='01'])[2] minutes
        // (//div[.='01'])[2] seconds
        // //span[.='OK']
        // //a[.='Now'] time now

        public void InsertDate()
        {
            _driverHelper._driver.FindElement(By.XPath("//input[@id='date']")).SendKeys("2022-09-23");
            _driverHelper._driver.FindElement(By.XPath("//td[@title='2022-09-23']")).WaitAndClick(_driverHelper._wait);

        }

        public void InsertTime()
        {
            _driverHelper._driver.FindElement(By.XPath("//input[@id='time']")).SendKeys("10:04:00");
            _driverHelper._driver.FindElement(By.XPath("//span[.='OK']")).WaitAndClick(_driverHelper._wait);
        }
        public void SelectParticipant(string input)
        {
            // _participantsField.WaitAndType(input, _driverHelper._wait);
            // _driverHelper._driver.FindElement(By.XPath($"(//div[.='{input}'])[1]")).Click();
            By.XPath("(//div[@class='ant-select-selection-overflow-item ant-select-selection-overflow-item-suffix'])[1]").WaitAndClick(_driverHelper._wait);
            By.XPath($"(//div[.='{input}'])[1]").WaitAndClick(_driverHelper._wait);
            Actions actions = new Actions(_driverHelper._driver);
            actions.ContextClick(_driverHelper._driver.FindElement(By.XPath("//form"))).Perform();
        }

        public void SelectOccurence(string input)
        {
           // _occurenceField.WaitAndType(input, _driverHelper._wait);
            // _driverHelper._driver.FindElement(By.XPath($"(//div[.='{input}'])[1]")).Click();
            By.XPath("(//div[@class='ant-select-selection-overflow-item ant-select-selection-overflow-item-suffix'])[2]").WaitAndClick(_driverHelper._wait);
            By.XPath($"(//div[.='{input}'])[1]").WaitAndClick(_driverHelper._wait);
        }

        public void ClickCreate()
        {
            _createButton.WaitAndClick(_driverHelper._wait);
        }
    }
}
