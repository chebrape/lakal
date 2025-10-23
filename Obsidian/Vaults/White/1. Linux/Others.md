## Crontabs:
​
Crontab is one of the processes that is started during boot, which is responsible for facilitating and managing cron jobs.
​
A crontab is simply a special file with formatting that is recognised by the `cron` process to execute each line step-by-step. Crontabs require 6 specific values:
​

![[Pasted image 20221209154543.png]]

​​
Example of backing up files. You may wish to backup "cmnatic"'s  "Documents" every 12 hours. We would use the following formatting:
​

>[!Tip] Chebra
>```
>0 *12 * * * cp -R /home/cmnatic/Documents /var/backups/
>```