## John The Ripper
​
John the Ripper is one of the most well known, well-loved and versatile hash cracking tools out there. It combines a fast cracking speed, with an extraordinary range of compatible hash types.
​
​
### Cracking Types
#### Basic Crack

>[!Tip] Chebra
>```
>john --wordlist={wordlist path} {file path}
>```

​
When you can't identify the hash type of the file you want to crack, then you can use this option that automatically identifies the hash type (with a margin of error).
​
​
#### Focus Crack

>[!Tip] Chebra
>```
>john --format={format} --wordlist={wordlist path} {file path}
>```

​
Specifying the format of the hash.
​
​
#### Linux *etc/shadow* Crack
First we'll need to prepare the file by making an ==unshadow==. The reason of this is that John can be very particular about the formats it needs data in to be able to work with it, for this reason- in order to crack */etc/shadow* passwords, you must combine it with the */etc/passwd* file in order for John to understand the data it's being given.
​

>[!Tip] Chebra
>```
>unshadow {passwd path} {shadow path} > {whatever}.txt
>```

​
Then we only need to crack it as a Basic Crack:
​

>[!Tip] Chebra
>```
>john --wordlist={wordlist path} {whatever}.txt
>```

​
In rare ocassions it might be necessary to specify the format as ==sha512crypt==.
​

>[!Tip] Chebra
>```
>john --format=sha512crypt --wordlist={*wordlist path*} {*whatever*}.txt
>```

​
​
#### Random Crack
Instead of using a wordlist, this method make some random possible password based on a ==username== that should be inserted as a prefix of the hash inside the {*file*} (the one whose path is specified in our command line as {*file path*}).
​
For example, if the hash is:
​

>[!Example]
>```
>1efee03cdcb96d90ad48ccc7b8666033
>```

​
And the username is ==mike==, then hash re-formatted should be as this:
​

>[!Example]
>```
>mike:1efee03cdcb96d90ad48ccc7b8666033
>```

​
Then we only must apply the following line to make the random cracking (also known as ==word mangling==)
​

>[!Tip] Chebra
>```
>john --single --format={format} {file path}
>```

​
​
#### Zip Crack
First we need to prepare the file so that John can identify it.
​

>[!Tip] Chebra
>```
>zip2john {zip file path} > {whatever}.txt
>```

​
(**Optionally** we can add some ==specific checksum options== if we want, as follow)
​

>[!Question] Optional
>```
>zip2john {options} {zip file path} > {whatever}.txt
>```

​
Now that we have the output file we can proceed with a basic cracking. Consider that the following =={*file path*}== makes reference to the previous =={*whatever*}.txt== file.
​

>[!Tip] Chebra
>```
>john --wordlist={*wordlist path*} {*file path*}
>```

​
​
#### Rar Crack
First we need to prepare the file so that John can identify it.
​

>[!Tip] Chebra
>```
>rar2john {rar file path} > {whatever}.txt
>```

​
Now that we have the output file we can proceed with a basic cracking. Consider that the following =={*file path*}== makes reference to the previous =={*whatever*}.txt== file.
​

>[!Tip] Chebra
>```
>john --wordlist={wordlist path} {file path}
>```

​
​
#### SSH Crack
First we need to prepare the file so that John can identify it.
​

>[!Tip] Chebra
>```
>ssh2john {id_rsa private key file path} > {whatever}.txt
>```

​
Now that we have the output file we can proceed with a basic cracking. Consider that the following =={*file path*}== makes reference to the previous =={*whatever*}.txt== file.
​

>[!Tip] Chebra
>```
>john --wordlist={wordlist path} {file path}
>```

​
​
### Utilities
#### Listing formats

>[!Tip] Chebra
>```
>john --list=formats
>```

​
In John, standards hash types comes with a prefix ==raw-== so in case that we need to use a md5 the one that we are looking in the list should look like ==raw-md5==
​
We can also use ==grep== to improve the searching focus:
​

>[!Tip] Chebra
>```
>john --list=formats | grep -iF "{hash type}"
>```

​
​
#### Random Crack - Custom Rules
Could be possible that you have some ideas about what some good mangling patterns would be, or what patterns your passwords often use- that could be replicated with a certain mangling pattern, in that case its possible to set up the rules of those patterns in order to use it in the Random Crack command line.
​
The way to create those rules is by adding them into the ==john.conf== file that is commonly in ==*/etc/john/john.conf*==. The syntax of the rules should follow the John The Reaper manual:
​
- https://www.openwall.com/john/doc/RULES.shtml
​
​
#### Don't have ==ssh2john==
The command ==ssh2john== is not set by default, so we can use it in two ways:

1. ##### Call the ssh2john python file in the extended way
   
   >[!Tip] Chebra
   >```
   >python /usr/share/john/ssh2john.py {id_rsa private key file path} > {whatever}.txt
   >```
   
   ​
2. ##### Set up an alias
   Create an alias in the .zhrc file, or equivalent, by adding the following line:
   ​
   
   >[!Tip] Chebra
   >```
   >alias ssh2john='python /usr/share/john/ssh2john.py'
   >```
   
   ​
   After that, we can use the command only by typing ==ssh2john== in the terminal:
   ​
   
   >[!Tip] Chebra
   >```
   >ssh2john {id_rsa private key file path} > {whatever}.txt
   >```