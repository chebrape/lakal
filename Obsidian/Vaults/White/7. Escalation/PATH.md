## $PATH Variable
​
Could be an script that is affected for the SUID situation (SUID binary)... if this script runs a command and this SUID binary have been created by the root user (owner=root), then we can imitate the command that the binary is running.
​
1. Create the fake command with something in it that helps like ==/bin/bash== and with the name of the command we are imitating.
   ​
2. ==chmod +x== that bitch.
   ​
3. Add the fake to $PATH statying where the fake file is (same directory)
   
   >[!Tip] Chebra
   >```
   >export PATH=/tmp:$PATH
   >```
   
​
Extras:
​
- Use the real command: just use the whole path, like ==/bin/ls==
- Reset the $PATH:
  ​
  
  >[!Tip] Chebra
  >```
  >export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$PATH
  >```