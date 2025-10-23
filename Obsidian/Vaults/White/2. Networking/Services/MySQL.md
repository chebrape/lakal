## MySQL (not yours, mine)
​
A relational database management system (RDBMS) based on Structured Query Language (SQL).
​
​
### Enumerating
​
1. #### Background (dreamings)
   - In this beautiful scenario we are going to suppose that already have MySQL credentials, in other words: a {*username*} and a {*password*}
   
   ​
2. #### Port Scanning
   - [[Nmap#Syn Scan]]
   
   ​
3. #### Try credentials, try harder
   - If this works, then we can try later something else:
   >[!Tip] Chebra
   >```
   >mysql -h {target IP} -u {username} -p
   >```
   
   ​
4. #### Metasploit the met
   - For real? yep
   >[!Tip] Chebra
   >```
   >msfconsole
   >```
   
   - Into Metasploit
   >[!Tip] Chebra
   >```
   >search mysql_sql
   >```
   
   - Select the one you want, setup, run, gather:
     ​
     It's important to know that there could be a "command" or "sql" option. If so, then we can changed to "select version ()", "show databases", etc.
   
   ​
5. #### Take everything and ruuuuuuuuun
   - Take note, and... wait, keep inside met
     
   ​
​
### Exploiting
​
1. #### Hola
   - Bolainas
   
   ​
2. #### How about abuse the use of Metasploit?
   - Using MS:
   >[!Tip] Chebra
   >```
   >search mysql_schemadump
   >```
   
   - Select, setup, run, gather.
   
   ​
3. #### Let's continue abusing of Metasploit
   - Yeah, using MS:
   >[!Tip] Chebra
   >```
   >search mysql_hashdump
   >```
   
   - Select, setup, run, gather.
   
   ​
4. #### What the hash!?
   - First let's put the hash where it belongs... it's proper house:
   >[!Tip] Chebra
   >```
   >echo "{hash}" > {whateveryouwant}
   >```
   
   - Also, the {*whateveryouwant*} means a file name like: "hash.txt".
   ​
   - Second, the {*hash*} must be with the correct syntax, like:
   >[!Example]
   >```
   >carl:EA031893AA21444B170FC2162A56978B8CEECE18*
   >```
   
   - Last, take a coffee... or better, oat.
   
   ​
5. #### It's Joooooohn the Rippeeeeeer! - * *John Cena Music* *
   - Here it comes:
   >[!Tip] Chebra
   >```
   >john {hash file}
   >```
   
   ​
6. #### Go, seek and destroy
   - Pi pi pi ri pi pu