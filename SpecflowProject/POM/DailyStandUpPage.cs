using OpenQA.Selenium;
using SeleniumExtras.WaitHelpers;

namespace SpecflowProject.POM
{
    class DailyStandUpPage
    {
        private DriverHelper _driverHelper;
        public DailyStandUpPage(DriverHelper driver)
        {
            _driverHelper = driver;
        }

       // private IWebElement _createDailyButton => _driverHelper._driver.FindElement(By.XPath("(//button[@type='button'])[1]"));
        private IWebElement _activeTab => _driverHelper._driver.FindElement(By.XPath("//div[@role='tab'][.='Active']"));
        private IWebElement _pastTab => _driverHelper._driver.FindElement(By.XPath("//div[@role='tab'][.='Past']"));
        private IWebElement _joinButton => _driverHelper._driver.FindElement(By.XPath("(//span[.='Join'])[1]"));
        private IWebElement _nextPage => _driverHelper._driver.FindElement(By.XPath("//li[@title='Next Page']"));
        private IWebElement _previousPage => _driverHelper._driver.FindElement(By.XPath("//li[@title='Previous Page']"));

        public void ClickCreateDaily()
        {
            _driverHelper._wait.Until(ExpectedConditions.ElementToBeClickable(By.XPath("(//button[@type='button'])[1]"))).Click();
        }


    }
}
