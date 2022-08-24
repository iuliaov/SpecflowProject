using OpenQA.Selenium;
using SeleniumExtras.WaitHelpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace SpecflowProject.POM
{
    class LoginPage
    {
        private DriverHelper _driverHelper;
        public LoginPage(DriverHelper driver)
        {
            _driverHelper = driver;
        }
        private IWebElement _emailInput => _driverHelper._driver.FindElement(By.XPath("//input[@type='email']"));
        private IWebElement _passwordInput => _driverHelper._driver.FindElement(By.XPath("//input[@type='password']"));
        private IWebElement _showPasswordIcon => _driverHelper._driver.FindElement(By.XPath("//span[@aria-label='eye-invisible']"));
        private IWebElement _loginButton => _driverHelper._driver.FindElement(By.XPath("//button[@type='submit']"));

        public void InsertEmail(string email)
        {
            _emailInput.SendKeys(email);
        }

        public void InsertPassword(string password)
        {
            _passwordInput.SendKeys(password);
        }

        public void ClickLogin()
        {
            _loginButton.Click();
        }

        public void SelectProject(int projectNumber)
        {
            _driverHelper._wait.Until(ExpectedConditions.ElementToBeClickable(By.XPath($"(//button[@type='button'])[{projectNumber}]"))).Click();
        }

        public void Login(string userType, int projectNumber)
        {
            if (userType == "manager")
            {
                InsertEmail("manager@amdaris.com");
            }
            else if (userType == "staff")
            {
                InsertEmail("staff@amdaris.com");
            }
            else if (userType == "admin")
            {
                InsertEmail("admin@amdaris.com");
            }

            InsertPassword("amdaris");
            ClickLogin();
            SelectProject(projectNumber);
        }
    }
}
