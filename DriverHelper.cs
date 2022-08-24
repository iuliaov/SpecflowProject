using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SpecflowProject
{
    public class DriverHelper
    {
        public IWebDriver _driver { get; set; }
        public WebDriverWait _wait { get; set; }

        ChromeOptions options = new ChromeOptions();
        options.AddArguments(new string[2] { "--start-maximized", "--incognito" });
            _driverHelper._driver = new ChromeDriver(options);
    _driverHelper._driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(1);
    _driverHelper._wait = new WebDriverWait(_driverHelper._driver, TimeSpan.FromSeconds(10))
    }
}
