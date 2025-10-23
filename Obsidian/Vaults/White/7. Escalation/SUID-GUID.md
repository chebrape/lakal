## SUID/GUID
​

>[!Tip] Chebra
>```
>find / -perm -u=s -type f 2>/dev/null
>```


- ==*find*==: Initiates the "find" command
- ==*/*==: Searches the whole file system
- ==*-perm*==: searches for files with specific permissions
- ==*-u=s*==: Any of the permission bits _mode_ are set for the file. Symbolic modes are accepted in this form
- ==*-type f*==: Only search for files
- ==*2>/dev/null*==: Suppresses errors
​
​
Or:
​

>[!Example] Other Option
>```
>find / -type f -a \( -perm -u+s -o -perm -g+s \) -exec ls -l {} \; 2> /dev/null
>```

​
​
Then we can [GTFOBIN THE SHIT!](https://gtfobins.github.io/)