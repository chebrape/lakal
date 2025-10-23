## History Files (scenario A)
​
If a user accidentally types their password on the command line instead of into a password prompt, it may get recorded in a history file.
​
View the contents of all the hidden history files in the user's home directory:
​

>[!Tip] Chebra
>```
>cat ~/.*history | less
>```

​
Note that the user has tried to connect to a MySQL server at some point, using the "root" username and a password submitted via the command line. Note that there is no space between the -p option and the password!
​
Switch to the root user, using the password:
​

>[!Tip] Chebra
>```
>su root
>```



## Config Files (scenario B)
​
Config files often contain passwords in plaintext or other reversible formats.
​
List the contents of the user's home directory:
​

>[!Tip] Chebra
>```
>ls /home/user
>```

​
Note the presence of a **myvpn.ovpn** config file. View the contents of the file:
​

>[!Tip] Chebra
>```
>cat /home/user/myvpn.ovpn
>```

​
The file should contain a reference to another location where the root user's credentials can be found. Switch to the root user, using the credentials:
​

>[!Tip] Chebra
>```
>su root
>```



## SSH Keys
​
Sometimes users make backups of important files but fail to secure them with the correct permissions.
​
Look for hidden files & directories in the system root:
​

>[!Tip] Chebra
>```
>ls -la /
>```

​
Note that there appears to be a hidden directory called **.ssh**. View the contents of the directory:
​

>[!Tip] Chebra
>```
>ls -l /.ssh
>```

​
Note that there is a world-readable file called **root_key**. Further inspection of this file should indicate it is a private SSH key. The name of the file suggests it is for the root user.
​
Copy the key over to your Kali box (it's easier to just view the contents of the **root_key** file and copy/paste the key) and give it the correct permissions, otherwise your SSH client will refuse to use it:
​

>[!Tip] Chebra
>```
>chmod 600 root_key
>```

​
Use the key to login to the Debian VM as the root account (note that due to the age of the box, some additional settings are required when using SSH):
​

>[!Tip] Chebra
>```
>ssh -i root_key -oPubkeyAcceptedKeyTypes=+ssh-rsa -oHostKeyAlgorithms=+ssh-rsa root@MACHINE_IP
>```