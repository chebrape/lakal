## Networking Test Commands
​

>[!Tip] Chebra
>```
>ping {target IP}
>```

- send ICMP ECHO_REQUEST to network hosts
​
​

>[!Tip] Chebra
>```
>traceroute {domain}
>```

- print the route packets trace to network host
- {domain} is the url (not IP)
- an equivalent command in Windows in tracert
​
​

>[!Tip] Chebra
>```
>whois {domain}
>```

- client for the whois directory service
- list available information about the {domain} (url, not IP)
​
​

>[!Tip] Chebra
>```
>dig {domain} @{DNS server IP}
>```

- DNS lookup utility
- manually query recursive DNS servers for information about domains
​
​
​
## Scan Commands and Funny Shits
​

>[!Tip] Chebra
>```
>nmap {target IP} {options}
>```

- scan and enumeration tool
- [[Nmap]]
​
​

>[!Tip] Chebra
>```
>enum4linux {options} {target IP}
>```

- a wrapper around the tools in the Samba package and extract information from the target pertaining to SMB