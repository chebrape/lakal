## XML External Entity
​
An XML External Entity (XXE) attack is a vulnerability that abuses features of XML parsers/data.
​
​
### The fuck is XML?
​
XML (eXtensible Markup Language) is a markup language that defines a set of rules for encoding documents in a format that is both human-readable and machine-readable. It is a markup language used for storing and transporting data.
​

![[Pasted image 20221219164612.png]]

​
XML allows validation using DTD and Schema. This validation ensures that the XML document is free from any syntax error.
​
​
### The fuck is DTD?
​
DTD stands for Document Type Definition. A DTD defines the structure and the legal elements and attributes of an XML document. Let us try to understand this with the help of an example. Say we have a file named `note.dtd` with the following content:
​

![[Pasted image 20221227173639.png]]

​
Now we can use this DTD to validate the information of some XML document and make sure that the XML file conforms to the rules of that DTD.
​

>[!Example]
>```
>Below is given an XML document that uses `note.dtd`
>```

​

![[Pasted image 20221227173739.png]]

​
- !DOCTYPE note -  Defines a root element of the document named note
- !ELEMENT note - Defines that the note element must contain the elements: "to, from, heading, body"
- !ELEMENT to - Defines the `to` element to be of type "#PCDATA"
- !ELEMENT from - Defines the `from` element to be of type "#PCDATA"
- !ELEMENT heading  - Defines the `heading` element to be of type "#PCDATA"
- !ELEMENT body - Defines the `body` element to be of type "#PCDATA"

​

> [!Tip]
> \#PCDATA means parseable character data.

​
​
### Welcome to my madafaka Payload
​
We can use XXE to read some file from the system by defining an ENTITY and having it use the SYSTEM keyword.
​

![[Pasted image 20221228044410.png]]

​
We are defining an ENTITY with the name `read` but also we are setting it value to `SYSTEM` and path of the file. If we use this payload then a website vulnerable to XXE (normally) would display the content of the file `/etc/passwd`.
​
​
### Explote that biatch
​
Remember to take all the payload and make a URL Encoding (if you are using Burpsuite you can just select all and press Ctrl+U). Then insert the payload in a variable xxe, like this:
​

![[Pasted image 20221228044836.png]]