## Injection (the aguijón)
​
Identifying injection points within a web application is usually quite simple, as most of them will return an error.
​
​
### SQL Injection
​
Is when an attacker enters a malicious or malformed query to either retrieve or tamper data from a database. And in some cases, log into accounts.
​

>[!Tip] Chebra
>```
>' or 1=1--
>```

​
​
### Email Injection
​
Email injection is a security vulnerability that allows malicious users to send email messages without prior authorization by the email server. These occur when the attacker adds extra data to fields, which are not interpreted by the server correctly.
​
​

### Comand Injection

Command Injection occurs when server-side code (like PHP) in a web application makes a system call on the hosting machine. Is when web applications take input or user-controlled data and run them as system commands. An attacker may tamper with this data to execute their own system commands. This can be seen in applications that perform misconfigured ping tests.
​
- #### Active Command Injection
  Blind command injection occurs when the system command made to the server does not return the response to the user in the HTML document.  Active command injection will return the response to the user.  It can be made visible through several HTML elements.
  ​
- #### Ways to detect
  We know that active command injection occurs when you can see the response from the system call.
  ​
- #### Example
  ​
  ![[Pasted image 20221217083836.png]]
  ​
  In pseudocode, the above snippet is doing the following:
  ​
  1. Checking if the parameter "commandString" is set
     ​
  2. If it is, then the variable `$command_string` gets what was passed into the input field
     ​
  3. The program then goes into a try block to execute the function ==passthru($command_string)==.  You can read the docs on ==passthru()== on [PHP's website](https://www.php.net/manual/en/function.passthru.php), but in general, it is executing what gets entered into the input then passing the output directly back to the browser.
     ​
  4. If the try does not succeed, output the error to page.  Generally this won't output anything because you can't output stderr but PHP doesn't let you have a try without a catch.
  ​
  So in this case we probably gonna try run a command to be process by this ==pasthru()==.