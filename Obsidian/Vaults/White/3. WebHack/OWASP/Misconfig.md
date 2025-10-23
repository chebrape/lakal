## Security Misconfiguration
​
Security misconfigurations include:
​
- Poorly configured permissions on cloud services, like S3 buckets
  ​
- Having unnecessary features enabled, like services, pages, accounts or privileges
  ​
- Error messages that are overly detailed and allow an attacker to find out more about the system
  ​
- Not using [HTTP security headers](https://owasp.org/www-project-secure-headers/), or revealing too much detail in the Server: HTTP header

​​
This vulnerability can often lead to more vulnerabilities, such as default credentials giving you access to sensitive data, XXE or command injection on admin pages.