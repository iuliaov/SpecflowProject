using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Support.UI;
using SeleniumExtras.WaitHelpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechTalk.SpecFlow;

namespace SpecflowProject.Steps
{
    [Binding]
    public sealed class CommonSteps
    {
        private DriverHelper _driverHelper;
        private readonly ScenarioContext _scenarioContext;
        public CommonSteps(DriverHelper driverHelper, ScenarioContext scenarioContext)
        {
            _driverHelper = driverHelper;
            _scenarioContext = scenarioContext;
        }

        [BeforeScenario(Order = 0)]
        public void BeforeScenario()
        {
            ChromeOptions options = new ChromeOptions();
            options.AddArguments(new string[2] { "--start-maximized", "--incognito" });
            _driverHelper._driver = new ChromeDriver(options);
            //_driverHelper._driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(1);
            _driverHelper._driver.Navigate().GoToUrl("https://qa-delivery-toolkit.azurewebsites.net");
            _driverHelper._wait = new WebDriverWait(_driverHelper._driver, TimeSpan.FromSeconds(10));
           // _driverHelper._wait.IgnoreExceptionTypes(typeof(StaleElementReferenceException));
        }

        [AfterScenario("@deleteDailyMeeting", Order = 1)]
        public void DeleteOpportunity()
        {
            string dailyTitle=CreateDailySteps.dailyTitle;
            _driverHelper._wait.Until(ExpectedConditions.ElementToBeClickable(By.XPath($"(//div[.='{dailyTitle}']/parent::li//button)[2]"))).Click();
            _driverHelper._wait.Until(ExpectedConditions.ElementToBeClickable(By.XPath("(//button[@class='ant-btn ant-btn-primary'])[2]"))).Click();
        }
    }
}
