+++
date = "2016-07-29T20:12:10-07:00"
draft = true
title = "Glance from scratch"
type = "page"
+++

This guide is meant for non technical users, but you can use it anyway.

Start checklist (you can skip to the verify step in each action if you think installation exists. Otherwise standard next>next>next installation):

1. Install Java jdk -
    1. [latest download at time of writing  (Java 8)](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
    2. Verify Java installation by opening a **new** cmd window and type `java -version` - the version should appear
2. Install Javascript -
    1. ([Latest Node.js instalation at time of writing](https://nodejs.org/dist/v4.4.5/node-v4.4.5-x64.msi),   includes npm (node package manager))
    2. Verify Node installation by opening a **new** cmd window and type `node --version` - the version should appear
    3. Verify npm installation by opening a **new** cmd window and type `npm --version` - the version should appear
3. Install Selenium -
    1. Now that npm is installed type `npm install -g selenium-server` (the -g will install it globally)
    2. Verify installation by typing `selenium` - this should start selenium and not return to prompt, leave this cmd window open while automating.
4. Notepad or ide (lets write a test) - [notepad++ is a good place to start](https://notepad-plus-plus.org/download/)
5. Firefox browser for testing

Now let’s write some automation - we will check “back to the future”’s ratings on imdb:

1. Lets create a directory for automation projects : c:/projects in it we will create a folder for our first project c:/projects/imdb
2. In our new directory we will type `npm install glance-webdriver`, this will install glance webdriver in our project folder
3. Create and edit a new file titled imdb.js
4. First we include the glance library as default: `var Glance = require(“glance-webdriver”).default;`
5. Create a new webdriver for firefox:

~~~ javascript
var glance = new Glance({
  driverConfig: {
    desiredCapabilities: {browserName: ‘firefox’}
  }
});
~~~
6. Go to IMDB:
glance.url(“http://www.imdb.com/”)
7. Lets enter the name to search for:
.set("Find movies","back to the future")
8. Click search (since it’s an icon we need to use the dom):
.click("magnifyingglass")
9. We found a few options choose the one we want:
.click("Back to the Future (1985)")
10. Since there is no label we want we use the dom again:
.get("ratingValue")
Then lets print the result to console:
.then(function(result){console.log(result)});

Our final script is :

~~~ javascript
var Glance = require("glance-webdriver").default;
var glance = new Glance({
  driverConfig: {
     desiredCapabilities: {browserName: 'firefox'}
  }
});

glance.url("http://www.imdb.com/")
  .set("Find movies","back to the future")
  .click("magnifyingglass")
  .click("Back to the Future (1985)")
  .get("ratingValue")
  .then(function(result) {
    console.log(result)
  });
~~~
Lets run the script:
    node imdb.js
