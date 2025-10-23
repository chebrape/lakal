## BurpSuite (erupto)
​
Burp Suite is a framework written in Java that aims to provide a one-stop-shop for web application penetration testing. At the simplest level, Burp can capture and manipulate all of the traffic between an attacker and a webserver: this is the ==core of the framework==. 
​
After capturing requests, we can choose to send them to various other parts of the Burp Suite framework. This ability to intercept, view, and modify web requests prior to them being sent to the target server (or, in some cases, the responses before they are received by our browser), makes Burp Suite perfect for any kind of manual web app testing.
​
​
### Features
​
1. #### Proxy
   - Intercept and modify requests/responses when interacting with web applications
   
   ​
2. #### Repeater
   - Capture, modify, then resend the same request numerous times. Invaluable when we need to craft a payload through trial and error
   
   ​
3. #### Intruder
   - Spray an endpoint with requests. Often used for bruteforce attacks or to fuzz endpoints
   
   ​
4. #### Decoder
   - Decode captured information, or encode a payload prior to send it to the target
   
   ​
5. #### Comparer
   - Compare two pieces of data at either word or byte level
   
   ​
6. #### Sequencer
   - Evaluate the randomness of tokens such as session cookie values or other supposedly random generated data. If the algorithm is not generating secure random values, then this could open up some devastating avenues for attack
   
   ​
7. #### Extender
   - Loads extensions into the framework, as well as providing a marketplace to download third-party modules (referred to as the "BApp Store")
     
   ​
​
### Tips
​
The proxy will not intercept server responses by default unless we explicitly ask it to on a per-request basis. We can override the default setting by selecting the "Intercept responses based on the following rules" checkbox and picking one or more rules.
​

![[Pasted image 20221214203839.png]]

​
Another particularly useful section of this sub-tab is the "Match and Replace" section; this allows you to perform regexes on incoming and outgoing requests. For example, you can automatically change your user agent to emulate a different web browser in outgoing requests or remove all cookies being set in incoming requests.