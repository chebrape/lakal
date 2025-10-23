## Sensitive Data Exposure
​
When a webapp accidentally divulges sensitive data, we refer to it as "Sensitive Data Exposure". This is often data directly linked to customers, but could also be more technical information, such as usernames and passwords.
​
​
### Database Example
​
Basically let's imagine that we have found a madafaqin database file inside a machine. In a production environment it is common to see databases set up on dedicated servers, running a database service such as MySQL or MariaDB; however, databases can also be stored as files. These databases are referred to as "flat-file" databases, as they are stored as a single file on the computer.
​
As mentioned previously, flat-file databases are stored as a file on the disk of a computer. Usually this would not be a problem for a webapp, but what happens if the database is stored underneath the root directory of the website (i.e. one of the files that a user connecting to the website is able to access)? Well, we can download it and query it on our own machine, with full access to everything in the database. Sensitive Data Exposure indeed!
​
In this example the file calls ==example.db==, and to interact with it we are gonna use ==sqlite3==
​

>[!Tip] Chebra
>```
>sqlite3 {*file name*}
>```

​

> [!Example]
> ```
> sqlite3 example.db
> ```

​
Then inside the sql client we can use command such as:
​

>[!Tip] Chebra
>```
>.tables
>```
>```
>PRAGMA table_info( {table name} );
>```
>```
>SELECT * FROM {table name};
>```