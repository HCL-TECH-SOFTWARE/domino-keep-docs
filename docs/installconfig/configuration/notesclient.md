---
layout: default
title: Client config
parent: Installing & configuring
nav_order: 10
---

{::options parse_block_html="true" /}

## Notes client config

Try the KEEP Open API with a sample demo Notes database with your existing HCL Notes Desktop Client.

<div class="panel panel-danger">
**KEEP on Notes Client**
{: .panel-heading}
<div class="panel-body">
The HCL Domino REST API is designed for use with the HCL Domino server. The ability to deploy it to a Notes client on Windows or macOS is provided for your convenience- to enable you to evaluate and experiment. You can explore the API without setting up a HCL Domino server.

**It is not supported for any production use !**<br />HCL Suppport will not entertain tickets for it.

</div></div>

### Prerequisites

KEEP Open API install requires the following:

- **HCL Notes** Desktop Client installed
- **KEEP** installed using the keepinstaller.jar from flexnet
- `Demo.nsf` from the [resources](../../references/downloads)

### Instructions

1. Install or download the [Prerequisites](#prerequisites) above.

2. Place `Demo.nsf` in the Notes data folder.

   - If you don't know where your installed Notes data folder lives, here's how to find the installation directory:

     1. Open the HCL Note Desktop Client
     2. Go to the menu Preferences
     3. Under the section 'Basic Notes Client Configuration', look to the right for the Local application folder

        e.g. for Mac it's under, /Users/[userid]/Library/Application Support/HCL Notes Data/

3. Run either the Windows batch file, or Mac/Linux bash script that was installed by the installer in a terminal.

   - On Mac/Linux, you may might have to change file permission in order to execute the script. To do that, issue this command:

   > e.g. `chmod 755 startkeepmac.sh`

   Note: For different versions of Notes, the Notes JRE path in the script may vary. You may need to change the path in the script.

4. You'll be prompted for a password for your notes.id file. Once the script is done, you'll have to stop the running process (kill -9 for Mac/Linux) and restart the script again, see [Troubleshooting guide]({{ '/installconfig/troubleshooting' | relative_url }}).

   Hint: To avoid being prompted for the password each time you start KEEP, check this setting in your HCL Notes Client, under menu `File -> Security -> User Security` and under Security Basics menu in the dialog.

   ![OpenAPI]({{ '/assets/images/NotesSecurityPasswordOption.png' | relative_url }}){: .scale-img-seventy-five-percent }

5. If everything is set up correctly, you should get a message in the terminal console output saying:

```bash
        *** Project KEEP API open for business ***
```

Otherwise, see the [Troubleshooting guide]({{ '/installconfig/troubleshooting' | relative_url }}) for any issues with the installations.

KEEP starts and checks for errors. It creates the database `KeepConfig.nsf` which is crucial for its operation.

The database contains one local user **John Doe** who is deactivated.

When you want to run KEEP local on your Mac/PC, you need to activate that user.
