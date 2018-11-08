How I started
=============
Downloaded an IDE - I used Visual Studio IDE 
<br />Downloaded and looked through the code to discern what the web site is trying to display
<br />-I saw json, cs, html, and image files, so I set this up as a .net/c# windows project in Visual Studio
<br />I had never used Azure DevOps, so I figured now was a good time to start.
<br />-used this tutorial: https://docs.microsoft.com/en-us/azure/devops-project/azure-devops-project-github
<br />Unfortunately, this first Azure setup is pretty manual. I think this is okay for new projects, since automating that would remove important opporunities for conversations.  There are still disadvantages, of course.
<br />Uploaded the project to Azure DevOps - https://dev.azure.com/brandonmdowns/_git/SHello
<br />Granted myself permissions to work on Azure project 
<br />Built and made sure the app worked on local IIS (just two buttons in Visual Studio)
<br />Created, in Azure, new app service for the HelloWorld manually to test

Notes on Azure DevOps
=====================
Azure DevOps is pretty impressive, and by telling it that I am build an ASP.net core project, it already knows it has to set up an IIS server and how to cofigure it.
<br />Azure will email you when builds are done, or you can hook into any chat app, such as Slack.
<br />A big drawback to Azure is that too much configuration is manual to create the first time. This is exacerbated by the lack of documentation on how to create and change resources outside of the UI. However, when you've created something for the first time, you can export a json schema, change what you like, and then deploy everything you'd need in Azure for that. Then, you can store your templates in version control. Dev teams, then, could simply change the template for a new application, never having to log in to Azure.
<br />Azure DevOps will generate a script for you to run on any DevOps instance that will generate your project. You can store these scripts in your version control. I would store them with my puppetfile for this project.


Best Practices, Scaling, and Costs
==============
Azure comes with some built in monitoring, and you can change alerting in Azure.
<br />Auditing is also built in to Azure DevOps, since all events are tracked with commits and tied to builds.
<br />Role-Based Access control is easy with Azure.
<br />Application scaling is, for a bare minimum production service, about $75 a month. It comes with staging (aka dev deployments), 10 daily backups, and automatic load balancing for the scaling. You can scale your single server (scale up) or increase the number of servers (scale out). You set conditions and maximums and are of course only charged for what you use.
<br />Blue-green deployment. 
<br />The instance of this app I've had running since Monday with alerting and automatic scaling has cost around $10, which makes sense since this is such a small app. You could definitely get internal usage like that.


Using the older version of the Microsoft.AspNetCore.All package had a vuln, so I updated it. Typically, I would have tested it, informed the dev team, and had them verify the change.




