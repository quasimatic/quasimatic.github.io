---
title: glance_webdriver
date: '2016-07-28 17:28:00'
layout: ''
---
<html><head></head><body>
<h1 id="glance-from-scratch">Glance from scratch</h1>

<p>This guide is meant  for non technical users, but you can use it anyway</p>

<p>Start checklist (you can skip to the verify step in each action if you think installation exists. Otherwise standard next&gt;next&gt;next installation):</p>

<ol>
<li>Install Java jdk - <br>
a.  <a href="http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html">latest download at time of writing  (Java 8)</a> <br>
b. Verify Java installation by opening a <strong>new</strong> cmd window and type <code>java -version</code> - the version should appear</li>
<li>Install Javascript - <br>
a. (<a href="https://nodejs.org/dist/v4.4.5/node-v4.4.5-x64.msi">Latest Node.js instalation at time of writing</a>,   includes npm (node package manager)) <br>
b. Verify Node installation by opening a <strong>new</strong> cmd window and type <code>node --version</code> - the version should appear <br>
c. Verify npm installation by opening a <strong>new</strong> cmd window and type <code>npm --version</code> - the version should appear</li>
<li>Install Selenium - <br>
a. Now that npm is installed type <code>npm install -g selenium-server</code> (the -g will install it globally) <br>
b. Verify installation by typing <code>selenium</code> - this should start selenium and not return to prompt, leave this cmd window open while automating.</li>
<li>Notepad or ide (lets write a test) - <a href="https://notepad-plus-plus.org/download/">notepad++ is a good place to start</a></li>
<li>Firefox browser for testing</li>
</ol>

<p>Now let’s write some automation - we will check “back to the future”’s ratings on imdb:</p>

<ol>
<li>Lets create a directory for  automation projects : c:/projects in it we will create a folder for our first project c:/projects/imdb</li>
<li>In our new directory  we will type <code>npm install glance-webdriver</code>, this will install glance webdriver in our project folder</li>
<li>Create and edit a new file titled imdb.js</li>
<li>First we include the glance library as default : <br>
<code>var Glance = require(“glance-webdriver”).default;</code></li>
<li>Create a new webdriver for firefox: <br>
<code>var glance = new Glance({ <br>
driverConfig: { <br>
    desiredCapabilities: {browserName: ‘firefox’} <br>
        }});</code></li>
<li>Go to IMDB: <br>
glance.url(“<a href="http://www.imdb.com/">http://www.imdb.com/</a>”)</li>
<li>Lets enter the name to search for: <br>
.set(“Find movies”,”back to the future”)</li>
<li>Click search (since it’s an icon we need to use the dom): <br>
.click(“magnifyingglass”)</li>
<li>We found a few options choose the one we want: <br>
.click(“Back to the Future (1985)”)</li>
<li>Since there is no label we want we use the dom again: <br>
.get(“ratingValue”) <br>
Then lets print the result to console: <br>
.then(function(result){console.log(result)});</li>
</ol>

<p>Our final script is :</p>



<pre class="prettyprint"><code class="language-var Glance = require( hljs actionscript"><span class="hljs-keyword">var</span> glance = <span class="hljs-keyword">new</span> Glance({
  driverConfig: {
     desiredCapabilities: {browserName: <span class="hljs-string">'firefox'</span>}
        }});

   glance.url(<span class="hljs-string">"http://www.imdb.com/"</span>)
  .<span class="hljs-keyword">set</span>(<span class="hljs-string">"Find movies"</span>,<span class="hljs-string">"back to the future"</span>)
  .click(<span class="hljs-string">"magnifyingglass"</span>)
  .click(<span class="hljs-string">"Back to the Future (1985)"</span>)
  .<span class="hljs-keyword">get</span>(<span class="hljs-string">"ratingValue"</span>)
  .then(<span class="hljs-function"><span class="hljs-keyword">function</span><span class="hljs-params">(result)</span>{</span>
  console.log(result)
  });</code></pre>

<p>Lets run the script: <br>
<code>node imdb.js</code></p>

</body></html>