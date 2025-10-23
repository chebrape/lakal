## Nmap scanning your soul b#tch
​
### Syn Scan
​

>[!Tip] Chebra
>```
>sudo nmap {target IP} --min-rate 5000 -n -p- -Pn -vvv
>```

​
When the scan performs like this, without a Type flag but in sudo, then it automatically runs in a Syn Scan type.
​
The same can be acomplished by using the flag ==-sS==
​
Explaning the flags:
​
- --min-rate 5000: send a lot of packages pussy
- -n: not resolve DNS
- -p-: all ports
- -Pn: not pinguear while scanning
- -vvv: overbose
​
​
### TCP Connect Scan
​

>[!Tip] Chebra
>```
>nmap {target IP} --min-rate 5000 -n -p- -Pn -vvv
>```

​
When the scan performs like this, without a Type flag and neither sudo, then it automatically runs in a TCP Connect Scan type.
​
Takes longer time.
​
​
### Moma give me the shitty-king-shit
​

>[!Tip] Chebra
>```
>nmap {target IP} -A -n -p {ports} -Pn ---vvv
>```

​
Its gonna apply all the scripts for the selected ports.
​
The ports can be separated by a colon, but have to remain continuous without spaces (or doesn't care? Trully i dont remember a shit hahahaha \*fart\*)
​
​
​
## Explaining everything
​
### Scan Types
​
- -sT (TCP Connect Scan)
- -sS (SYN "Half-open" Scan)
- -sU (UDP Scan)
​
- -sN (TCP Null Scan)
- -sF (TCP FIN Scan)
- -sX (TCP Xmas Scan)
​
​
### Modes: ICMP Network Scanning
​

>[!Tip] Chebra
>```
>nmap -sn {IP range}
>```

​
The IP range must be set in one of the following ways:
​
- (-): 192.180.0.1-254
- (/): 192.180.0.0/24
​
​
### NSE Scripts

#### Description
The **N**map **S**cripting **E**ngine (NSE) is an incredibly powerful addition to Nmap, extending its functionality quite considerably. NSE Scripts are written in the _Lua_ programming language, and can be used to do a variety of things: from scanning for vulnerabilities, to automating exploits for them. The NSE is particularly useful for reconnaisance, however, it is well worth bearing in mind how extensive the script library is.
​
There are many categories available. Some useful categories include:
​
-   `safe`:- Won't affect the target
-   `intrusive`:- Not safe: likely to affect the target
-   `vuln`:- Scan for vulnerabilities
-   `exploit`:- Attempt to exploit a vulnerability
-   `auth`:- Attempt to bypass authentication for running services (e.g. Log into an FTP server anonymously)
-   `brute`:- Attempt to bruteforce credentials for running services
-   `discovery`:- Attempt to query running services for further information about the network (e.g. query an SNMP server)
​
​
#### Run IT
You can run an expecific script by including ==--script== and, if necessary, ==--script-args== after that by separating each argument with colons (,).
​

>[!Tip] Chebra
>```
>nmap {target IP} --script {script name} --script-args {arguments} -n -p {ports} -Pn ---vvv
>```

​
​
#### Scripts Search and Help
To find help for an specific script just do as following:
​

>[!Tip] Chebra
>```
>nmap --script-help {script name}
>```

​
If instead wanna search all scripts available, then search in the following path:
​

>[!Tip] Chebra
>```
>/usr/share/nmap/scripts/script.db
>```

​
​
### Firewall Evasion
​
- -Pn: not pinguear
- -f: fragment the packets
- --mtu {NUMBER}: maximum transmission unit size. NUMBER must be a multiple of 8
- --scan-delay {TIME}ms: add a delay between packets sent
- --badsum: generate in invalid checksum for packets