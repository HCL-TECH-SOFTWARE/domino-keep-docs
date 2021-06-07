---
layout: default
title: Docker
parent: Installing & Configuring
nav_order: 5
---

[TODO] -> FIX OR REMOVE

Try the Keep Open API with a sample demo Notes database with your existing HCL Notes Desktop Client.

### Prerequisites

Keep Open API install requires the following:

- HCL Notes Desktop Client installed
- projectkeep.jar file, available [here](http://foobar.com) [TODO-add link]
- Demo.nsf from this source in [github](https://github01.hclpnp.com/stephan-wissel/domino-keep/blob/develop/keep-core/src/test/database/Demo.nsf) [TODO-update repo link]
- Script to configure and run Keep API for your operating system, available [here]({{ '/docs/getting_started/resources' | relative_url }})

### Instructions

1. Install or download the [Prerequisites](#prerequisites) above.

2. Place the `projectkeep.jar` and `Demo.nsf` in the Notes data keep folder.

   - If you don't know where your installed Notes data folder lives, here's how to find the installation directory:

     1. Open the HCL Note Desktop Client
     2. Go to the menu Preferences
     3. Under the section 'Basic Notes Client Configuration', look to the right for the Local application folder

        e.g. for Mac it's under, /Users/[userid]/Library/Application Support/HCL Notes Data/

3. Run either the Windows batch file, or Mac/Linux bash script that you have downloaded from the [Prerequisites](#prerequisites) in a terminal.

- On Mac/Linux, you may have to change file permission in order to execute the script. To do that, issue this command:

  > e.g. chmod 776 startkeepmac.sh

      Note: For different versions of Notes, the Notes JRE path in the script may vary.  You may need to change the path in the script.

4.  You'll be prompted for a password for your notes.id file. Once the script is done, you'll have to stop the running process (kill -9 for Mac/Linux) and restart the script again, see [Troubleshooting guide]({{ '/docs/installation/troubleshooting' | relative_url }}).

    Hint: To avoid being prompted for the password each time you start Keep, check this setting in your HCL Notes Client, under menu `File -> Security -> User Security`, and under Security Basics menu in the dialog.

    ![OpenAPI]({{ '/assets/images/NotesSecurityPasswordOption.png' | relative_url }}){: .scale-img-seventy-five-percent }

5.  If everything is set up correctly, you should get a message in the terminal console output saying:

        ```*** Domino Keep API open for business ***```

    Otherwise, see the [Troubleshooting guide]({{ '/docs/installation/troubleshooting' | relative_url }}) for any issues with the installations.

6.  Keep starts and checks for errors. It creates the database `KeepConfig.nsf` which is crucial for its operation.

    The database contains one local user **John Doe** who is deactivated.

    When you want to run Keep local on your Mac/PC, you need to activate that user.

    The activation button is available in the **Notes client**, under menu `File -> Open -> HCL Notes Applications`. Select `Domino Keep Configuration` application. If you don't see this listed see the [Troubleshooting guide]({{ '/docs/installation/troubleshooting' | relative_url }}) for any issues with the installations.

    ![Domino Keep Configuration]({{ '/assets/images/KeepConfigApp.png' | relative_url }}){: .scale-img-seventy-five-percent }

    ![John Doe]({{ '/assets/images/JohnDoeConfig.png' | relative_url }}){: .scale-img-seventy-five-percent }

