+++
date = "2016-07-29T20:12:00+00:00"
draft = false
title = "Glance from scratch"
type = "page"
+++

This guide is meant for non technical users, but you can use it anyway.


Requirements Checklist
(If you need help with installation, more info is available at:
 http://educate.quasimatic.com/installation/setting-up-selenium)  :

1. Java jdk installation


2. Javascript installation



3. Selenium installation



4. Notepad or ide (lets write a test) - [notepad++ is a good place to start](https://notepad-plus-plus.org/download/)
5. Chrome browser for testing

Now let’s write some automation - we will make a simple todo list on [todomvc.com/](http://todomvc.com/)

1. Lets create a directory for automation projects : c:/projects in it we will create a folder for our first project c:/projects/todo
2. In our new directory we will type `npm install glance-webdriver`, this will install glance webdriver in our project folder
3. Create and edit a new file titled todo.js
4. First we include the glance library as default:

    ```
    var Glance = require(“glance-webdriver”).default;
    ```

5. Create a new webdriver for chrome:

    ```
    var glance = new Glance({
      driverConfig: { desiredCapabilities: {browserName: ‘chrome’} }
    });
    ```

6. Go to mvctodo.com:

    ```
    glance.url(“http://todomvc.com/”)
    ```

7. Lets choose the React todo:

    ```
    .click("These are examples written in pure JavaScript.>React")
    ```

8. let's enter our first item followed by an enter: 

    ```
    .set("What needs to be done?", "1. test this")
    ```

9. Press enter to insert the task: 

    ```
    .sendKeys("Enter")
    ```

10. now for another item: 

    ```
    .set("What needs to be done?", "2. test this too")
    ```

11. Press enter to insert the task: 

    ```
    .sendKeys("Enter")
    ```

12. we'll mark the first item as done, since the checkbox doesnt have a label we look in the dom to see it is an input element which allows us to use: 

    ```
    .click("1. test this > input")
    ```

Our final script is :

```javascript
var Glance = require("glance-webdriver").default;
var glance = new Glance({
  driverConfig: {
    desiredCapabilities: {browserName: 'chrome'}
  }
});

glance.url("http://todomvc.com/")
  .click("These are examples written in pure JavaScript. > React")
  .set("What needs to be done?", "1. test this")
  .sendKeys("Enter")
  .set("What needs to be done?", "2. test this too")
  .sendKeys("Enter")
  .click("1. test this > input");
```
Lets run the script in a new command window: `node todo.js`
