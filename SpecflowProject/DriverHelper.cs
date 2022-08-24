using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Support.UI;
using System;

namespace SpecflowProject
{
    public class DriverHelper
    {
        public IWebDriver _driver { get; set; }
        public WebDriverWait _wait { get; set; }
    }
}