 


#Selenium setup

The full Selenium Webdriver setup can be found here:
http://docs.seleniumhq.org/docs/03_webdriver.jsp#setting-up-a-selenium-webdriver-project

To make things simpler, here is a short primer to setting up selenium on your computer:

##Pre-Requirements

1. Make sure you have Java on your computer
	2. You can verify Java is installed by opening a **new** cmd window and typing `java -version` - the version should appear
	3. If the version doesn't appear install latest  Java jdk -  [Latest download at time of writing  (Java 8)](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
    2. Once finished, verify Java installation by opening a **new** cmd window and type `java -version` - the version should appear


## Javascript

Our current method is to use the [selenium-standalone package in npm]([https://www.npmjs.com/package/selenium-standalone), this package allows for Command line or programmatic install and launch of selenium standalone server, and bundles the chrome driver, internet explorer driver, firefox driver and phantomjs as well for multiple browser testing

2. Install Javascript (if you don't have it) -
    1. ([Latest Node.js installation at time of writing](https://nodejs.org/),   includes npm (node package manager))
    2. Verify Node installation by opening a **new** cmd window and type `node --version` - the version should appear
    3. Verify npm installation by opening a **new** cmd window and type `npm --version` - the version should appear
3. Install selenium-standalone-
    1. Now that npm is installed type `npm install -g selenium-standalone@latest` (the -g will install it globally)
    2. In a new command window type: `selenium-standalone install`
    3. From now on everytime you want to start selenium open a new command window and type `selenium-standalone start`  (leave the window open as long as you're testing.

