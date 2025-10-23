## Writeable ETC/SHADOW
​
Generate a new password hash:
​

>[!Tip] Chebra
>```
>mkpasswd -m sha-512 {newpasswordhere}
>```

​
Then edit the ==/etc/shadow== file and replace the original root user's password hash with the one you just generated. Finally just ==sudo root==.
​
​
## Readable ETC/SHADOW

Find the hash between the first and second colon (:) and apply ==john== to crack the hash.