## Broken Access
​
***Scenario #1:*** The application uses unverified data in a SQL call that is accessing account information:
​

>[!Example]
>```
>pstmt.setString(1, request.getParameter("acct"));
>ResultSet results = pstmt.executeQuery( );
>```

​
An attacker simply modifies the ‘acct’ parameter in the browser to send whatever account number they want. If not properly verified, the attacker can access any user’s account.
​

>[!Example]
>```
>http://example.com/app/accountInfo?acct=notmyacct
>```

​
​
***Scenario #2:*** An attacker simply force browses to target URLs. Admin rights are required for access to the admin page.
​

>[!Example]
>```
>http://example.com/app/getappInfo
>http://example.com/app/admin_getappInfo
>```

​
To put simply, broken access control allows attackers to bypass authorization which can allow them to view sensitive data or perform tasks as if they were a privileged user.
​
​
### IDOR
​
IDOR, or Insecure Direct Object Reference, is the act of exploiting a misconfiguration in the way user input is handled, to access resources you wouldn't ordinarily be able to access. IDOR is a type of access control vulnerability.
​
For example, let's say we're logging into our bank account, and after correctly authenticating ourselves, we get taken to a URL like this */https://example.com/bank?account_number=1234*. A hacker may be able to change the account_number parameter to something else like 1235, and if the site is incorrectly configured, then he would have access to someone else's bank information.