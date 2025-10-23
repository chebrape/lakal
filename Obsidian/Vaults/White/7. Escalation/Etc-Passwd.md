## Writeable ETC/PASSWD (Option A)
​
If we have a writable ==/etc/passwd== file, we can write a new line entry according to the formula: ==[Username]:[Password]:[UID]:[GID]:[User ID info]:[HomeDirectory]:[CommandShell]==,  and create a new user! We add the password hash of our choice, and set the UID, GID and shell to root. Allowing us to log in as our own root user.
​
​
## " " (Option B)
​
Generate a new password hash with a password of your choice:
​

>[!Tip] Chebra
>```
>openssl passwd {newpasswordhere}
>```

​
Edit the /etc/passwd file and place the generated password hash between the first and second colon (:) of the root user's row (replacing the "x").
​
Switch to the root user with ==su root==.