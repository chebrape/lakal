## What the Shell?
​
Shells are what we use when interfacing with a Command Line environment (CLI). In other words, the common bash or sh programs in Linux are examples of shells, as are cmd.exe and Powershell on Windows. When targeting remote systems it is sometimes possible to force an application running on the server (such as a webserver, for example) to execute arbitrary code. When this happens, we want to use this initial access to obtain a shell running on the target.
​
In simple terms, we can force the remote server to either send us command line access to the server (a reverse shell), or to open up a port on the server which we can connect to in order to execute further commands (a bind shell).
​
​
### Shell Types
​
- #### Reverse Shells
  ​
  Are when the target is forced to execute code that connects back to your computer. On your own computer you would use one of the tools available to set up a listener which would be used to receive the connection. Reverse shells are a good way to bypass firewall rules that may prevent you from connecting to arbitrary ports on the target; however, the drawback is that, when receiving a shell from a machine across the internet, you would need to configure your own network to accept the shell.
  ​
  
  ![[Pasted image 20230318041436.png]]
  
  ​
- #### Bind Shells
  ​
  Are when the code executed on the target is used to start a listener attached to a shell directly on the target. This would then be opened up to the internet, meaning you can connect to the port that the code has opened and obtain remote code execution that way. This has the advantage of not requiring any configuration on your own network, but may be prevented by firewalls protecting the target.
  ​
  
  ![[Pasted image 20230318041447.png]]
  
  ​
  ​
### Output Type
​
- #### Interactive
  ​
  If you've used Powershell, Bash, Zsh, sh, or any other standard CLI environment then you will be used to interactive shells. These allow you to interact with programs after executing them. For example, in the following SSH login prompt you can see that it's asking ==interactively== that the user type either yes or no in order to continue the connection. This is an interactive program, which requires an interactive shell in order to run.
  ​
  
  ![[Pasted image 20230318041835.png]]
  
  ​
- #### Non-Interactive
  ​
  This shells don't give you that luxury. In a non-interactive shell you are limited to using programs which do not require user interaction in order to run properly. Unfortunately, the majority of simple reverse and ==bind shells== are ==non-interactive==, which can make further exploitation trickier. In the following attempt to SSH in a non-interactive shell, notice that the ==whoami== command (which is non-interactive) executes perfectly, but the ==ssh== command (which is interactive) gives us no output at all.
  ​
  As an interesting side note, the output of an interactive command does go somewhere, however, figuring out where is an exercise for you to attempt on your own. Suffice to say that interactive programs do not work in non-interactive shells.
  ​
  In this example the command ==Listener== evokes as an alias the command ==sudo rlwrap nc -lvnp 443==.
  ​
  
  ![[Pasted image 20230318042511.png]]