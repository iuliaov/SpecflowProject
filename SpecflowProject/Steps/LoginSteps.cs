using OpenQA.Selenium;
using SeleniumExtras.WaitHelpers;
using SpecflowProject.POM;
using TechTalk.SpecFlow;
using TechTalk.SpecFlow.Assist;

namespace SpecflowProject.Steps
{
    [Binding]
    public sealed class LoginSteps
    {
        private DriverHelper _driverHelper;

        public LoginSteps(DriverHelper driver)
        {
            _driverHelper = driver;    
            _driverHelper._wait.IgnoreExceptionTypes(typeof(NoSuchElementException));
           
        }

        [Given(@"user is on ""(.*)""")]
        public void GivenUserIsOn(string p0)
        {
            _driverHelper._wait.Until(ExpectedConditions.UrlMatches(p0));
        }

        [When(@"user inserts email and password")]
        public void WhenUserInsertsEmailAndPassword(Table table)
        {
            dynamic data = table.CreateDynamicInstance();
            string email = data.email;
            string password = data.password;
            LoginPage loginPage = new LoginPage(_driverHelper);
            loginPage.InsertEmail(email);
            loginPage.InsertPassword(password);
            loginPage.ClickLogin();
        }



        [When(@"user clicks Login")]
        public void WhenUserClicksLogin()
        {
            LoginPage loginPage = new LoginPage(_driverHelper);
            loginPage.ClickLogin();
        }

        [Then(@"user is logged in")]
        public void ThenUserIsLoggedIn()
        {
            _driverHelper._wait.Until(ExpectedConditions.UrlContains("https://delivery-toolkit.azurewebsites.net/project"));
        }

    }
}
