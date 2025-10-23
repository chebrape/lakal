## Insecure Deserialization
​
Is replacing data processed by an application with malicious code. This malicious code leverages the legitimate serialization and deserialization process used by web applications.
​
In this case we can do a lot of things, for example by taking advantage of the cookies in a web application.
​
Imagine that there's a web that have one page that set a cookie, encode and store it as follows:
​

![[Pasted image 20221228091602.png]]

​
Next, there's another page in the same web that decode and then deserialise the cookie as follows:
​

![[Pasted image 20221228091840.png]]

​
​
### Exploit Vulns
​
This vulnerability exploits Python Pickle. You can try some options like this:
​
1. #### Start
   - I mean... for real
   
   ​
2. #### Set up a listener
   - Let's use netcat:
   >[!Tip] Chebra
   >```
   >nc -lvnp {port}
   >```
   
   ​
3. #### Download and set an encoder for Python Pickle
   - Probably some like: https://assets.tryhackme.com/additional/cmn-owasptopten/pickleme.py
     ​
     ![[Pasted image 20221228092359.png]]
   
   ​
4. #### Run it
   - Yes, just run it...
   
   ​
5. #### Take the output and paste it as a cookie
   - Copy the result of run the encoder:
     ​
     ![[Pasted image 20221228092714.png]]
     ​
   
   - Then paste it in our piece of shit web:
     ​
     ![[Pasted image 20221228092802.png]]
   
   ​
6. #### Check your listener
   - Bro, you're welcome.