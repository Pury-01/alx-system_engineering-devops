# Postmortem Report for Apache 500 Internal Server Error
## Issue Summary:
On August 14, 2024, between 1400 EAT and 14:45 EAT, our Apache web server encountered a 500 Internal Server Error. This issue affected about 40% of our users, who experienced difficulties accesssing the web application, leading to frustuation and a loss of service.  The root cause was a misconfiguration of file permissions, which prevented Apache from acessing necessary files.

## Timeline
- 14:00 EAT: The issue was detected when our monitoring system alerted us to an increase in 500 errors.
- 14:10 EAT: A team member On-Call reviewed the alerts and confirmed that users  were unable to access the site.
- 14:15 EAT: The team member started investigating potential causes, focusing on recent changes to the server configuration.
- 14:20 EAT: The technical engineer On-Call(team member) had intially suspected high resource usage and checked CPU and memory loads.
- 14:25 EAT: The Engineer On-Call escalated the issue to the rest of the team.
- 14:30 EAT: We decided to use `**strace**` to attach to the Apache process for deeper navigation.
- 14:35 EAT: `strace` output revealed permission errors indicating that Apache couldn't access certain directories.
-14:45 EAT: The team applied necessary permission mission fixes, resolving the issue.

## Root Cause and Resolution
The 500 Internal Server Error was caused by incorrect file permissions on the web application directory. Apache, running under the `www-data` user, lacked the permissions neeeded to read files in the `/var/www/html` directory.

To Resolve the issue we ran the following commands to correct the ownership and permissions:
``` 
sudo chown -R www-data:www-data /var/ww/html
sudo chmod -R 755 /var/www/html
```
This adjustment allowed Apache to access the required files and serve requests correctly.

##  Corrective and Preventive Measures:
To prevent similar incidents in the future, our small team plans to implement the folowing actions:
1. File Permission Monitoring:
>>. - Task: Set  up a simple script that reguarly checks the permissions of the key directories and alerts the team of any issues arise.

2. Puppet Configuration Management:
>>. - Task: Use Puppet to automate the management of file permissions for the web application, ensuring consistent settings across our environment.

3. Documentation Update:
>>.  - Task: Revise our internal documentation to include best practices for file permissions on the web server.

4. Team Training:
>>. - Task: Conduct a  short training session on usinng `strace` and other debugging tools to help the team handle similar issues more efficiently in the future.    
