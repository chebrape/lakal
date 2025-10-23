## SMTP (So Much Tea Parties)
​
SMTP stands for "Simple Mail Transfer Protocol". It is utilised to handle the sending of emails. In order to support email services, a protocol pair is required, comprising of SMTP (send) and POP/IMAP (retrieve).
​
​
### Enumerating
​
1. #### Port Scanning
   - [[Nmap#Syn Scan]]
   
   ​
2. #### Start Metasploiting
   - Kinda down, i know, but if time is a problem, then Metasploit should help:
   >[!Tip] Chebra
   >```
   >msfconsole
   >```
   
   - Inside Meta:
   >[!Tip] Chebra
   >```
   >search smtp_version
   >```
   
   - Select the one you like, setup, run, gather, next:
   >[!Tip] Chebra
   >```
   >search smtp_enum
   >```
   
   - Select, setup, run, gather, exit Metasploit. Bye byeeee.
   
   ​
3. #### Take everything you can
   - hello
   
   ​
4. #### Alternatives? Yep
   - Madafaka:
   >[!Tip] Chebra
   >```
   >smtp_user_enum
   >```
   
   ​
​
### Exploiting
​
1. #### Before start
   - In this example we are supposing that we have a username from the gathering, and an SSH port open
   
   ​
2. #### Lets hail (cuz, who don't like bruteforcing?)
   - Hail:
   >[!Tip] Chebra
   >```
   >hydra -t 16 -l {username} -P {wordlist path} -vV {target IP} ssh
   >```
   
   ​
3. #### You got it, now escalate like "El Mostro Andino"
   - There is no steps, just full conviction