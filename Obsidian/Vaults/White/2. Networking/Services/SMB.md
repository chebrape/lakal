## SMB (Linux - Windows)
​
Server Message Block Protocol - is a client-server communication protocol used for sharing access to files, printers, serial ports and other resources on a network.
​
The ways to explote a machine are so many; then, we're gonna use a one of them to explain.
​
​
### Enumerating
​
1. #### Port Scanning
   - [[Nmap#Syn Scan]]
   
   ​
2. #### Shares Scanning
   - Shares are like apple pies:
   >[!Tip] Chebra
   >```
   >enum4linux {option} {target IP}
   >```
   
   ​
3. #### Shake It Of
   - Just grap all the information and paste it in some place
     
   ​
​
### Exploiting
​
1. #### All You Need is Love
   - You'll need everything you gathered from [[#Enumerating]]
   
   ​
2. #### Try the Client connection
   - By trying i mean kill that &%$#:
   >[!Tip] Chebra
   >```
   >smbclient //{IP}/{share} -U {name} -p {port}
   >```
   
   - Better try first with "Anonymous" as name and without password.
   
   ​
3. #### Search what u need biatch
   - biaaaaaaaaaaaaaaaaatch... byebye