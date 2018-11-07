REM Puppet Masterless Configuration
REM Puppet supports running the configuration in a "masterless" format, where the puppet agents do not register to a master, and do not pull configurations directly from a master.
REM Instead, the local Puppet agent will pull the code from a repository, then create and apply the catalog locally.
REM In order to keep a node up to date, the initial puppet run will create a scheduled task to perform a new git pull on a periodic basis, and then execute a puppet apply.
REM This will ensure that any changes in version control get pulled by the agent and applied.

REM Node configuration is still handled via Hiera yaml files, classified in the same manner as you used a Puppet master server.

REM Git location for jenkins_slave_config.pp: http://va1-dgovapp021.markelcorp.markelna.com:8080/tfs/DefaultCollection/DevOps/_git/Puppet?path=%2Fmodules%2Fprofile%2Fmanifests%2Fjenkins_slave_config.pp&version=GBproduction&_a=contents

REM log on to the server as an admin so that the installs use that user.

REM install chocolatey
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

REM install puppet agent so we can run it local and masterless
choco install puppet-agent -y

REM refresh environment variables so the script works
call RefreshEnv.cmd

REM install the puppet module for chocolatey, so we can install packages from the public choco repo
call puppet module install puppetlabs-chocolatey --version 3.0.0

REM install git so we can grab our puppet config
call choco install git.install -y

REM grab the puppet config
git clone https://github.com/BrandonDowns/PuppetSpreetail C:\Puppet\code

REM apply our installs
puppet apply "C:\Puppet\code\SHello.pp"