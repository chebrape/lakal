## XSS (Cross-Site Scripting)
​
XSS is a security vulnerability typically found in web applications. It’s a type of injection which can allow an attacker to execute malicious scripts and have it execute on a victim’s machine.
​
XSS is possible in Javascript, VBScript, Flash and CSS. There are three main types of cross-site scripting:
​
- ***Stored XSS*** - the most dangerous type of XSS. This is where a malicious string originates from the website’s database. This often happens when a website allows user input that is not sanitised (remove the "bad parts" of a users input) when inserted into the database.
  ​
- ***Reflected XSS*** - the malicious payload is part of the victims request to the website. The website includes this payload in response back to the user. To summarise, an attacker needs to trick a victim into clicking a URL to execute their malicious payload.
  ​
- ***DOM-Based XSS*** - DOM stands for Document Object Model and is a programming interface for HTML and XML documents. It represents the page so that programs can change the document structure, style and content. A web page is a document and this document can be either displayed in the browser window or as the HTML source.

​
​
### Payloads
​
- ***Popup's*** (<script>alert(“Hello World”)</script>) - Creates a Hello World message popup on a users browser.
  ​
- ***Writing HTML*** (document.write) - Override the website's HTML to add your own (essentially defacing the entire page).
  ​
- ***XSS Keylogger*** (http://www.xss-payloads.com/payloads/scripts/simplekeylogger.js.html) - You can log all keystrokes of a user, capturing their password and other sensitive information they type into the webpage.
  ​
- ***Port scanning*** (http://www.xss-payloads.com/payloads/scripts/portscanapi.js.html) - A mini local port scanner (more information on this is covered in the TryHackMe XSS room).

​
XSS-Payloads.com (http://www.xss-payloads.com/) is a website that has XSS related Payloads, Tools, Documentation and more. You can download XSS payloads that take snapshots from a webcam or even get a more capable port and network scanner.