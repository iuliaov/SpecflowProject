using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using SeleniumExtras.WaitHelpers;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SpecflowProject
{
    static class IWebElementExtensions
    {
        public static void WaitAndClick(this IWebElement element, WebDriverWait wait)
        {
            wait.Until(ExpectedConditions.ElementToBeClickable(element)).Click();
        }

        public static void WaitAndClick(this By element, WebDriverWait wait)
        {
            wait.Until(ExpectedConditions.ElementIsVisible(element)).Click();
        }

        public static void WaitVisibilityAllElements(this By element, WebDriverWait wait)
        {
            wait.Until(ExpectedConditions.VisibilityOfAllElementsLocatedBy(element));
        }

        public static void WaitVisibilityAllElements(this ReadOnlyCollection<IWebElement> list, WebDriverWait wait)
        {
            wait.Until(ExpectedConditions.VisibilityOfAllElementsLocatedBy(list));
        }
        public static void WaitAndType(this IWebElement element, string text, WebDriverWait wait)
        {
            wait.Until(ExpectedConditions.ElementToBeClickable(element)).SendKeys(text);
        }

        public static void ClearAndType(this IWebElement element, string text, WebDriverWait wait)
        {
            wait.Until(ExpectedConditions.ElementToBeClickable(element)).Clear();
            wait.Until(ExpectedConditions.ElementToBeClickable(element)).SendKeys(text);
        }
    }
}
