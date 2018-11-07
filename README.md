####
#Steps to set up VisualStudio
#
#We don't need to do this for the demo, but we would give these instructions to any developer working on the project. They could fire off the batch file, chat with the team, and have a dev environement in about 10-15 minutes.
####

Run this Batch file:
https://github.com/BrandonDowns/SpreetailHello/blob/master/spreetailConfig.bat


Install https://visualstudio.github.com/index.html
-maybe, unless CHOCO works

Open Visual Studio
Open Git Repo: https://github.com/BrandonDowns/SpreetailHello


####
#Steps to create Azure DevOps project
####

Log in to your Azure Portal
Create a Resource -> DevOps Project -> Create
Select "Bring your own code"
GitHub -> BrandonDowns/SpreetailHello -> Master
No -> .NET -> ASP.NET Core
Windows Service
$NAME -> brandonmdowns -> Free Trial -> Central US
Done, then wait for creation

It will take you to your DevOps project in Azure when you click "Go to Resource", but say it doesn't exist. This is because they just changed DevOps to have its own URL outside of the Azure Portal.
Click "Project Homepage" to be sent to the Azure DevOps project page.

Clicking "Pipelines" will take you to the build in progress. You're already set up with CI for any commits to this project in github! 
When a build finishes, it triggers a release, including this first build.

Your site deploys to htts://$NAME.azurewebsites.net. (Custom URL's are something you can of course pay for and set up)

We can see the site works!  Hello World


####
#Steps to create alerting and view monitoring in Azure
####

Open the Azure Portal -> All Resources
$NAME -> Application Insights
You can see the statistics for your application on the right, and a more full view is available until "Application Dashboard"

Scroll down to Configure -> Alerts to set any alerts on the app.  Pretty much everything you can think of is covered.

The scaling options are under $NAME -> App Service in its Settings menu.  Most of the things that can trigger an alert can trigger scaling, and they're load balanced by default.

