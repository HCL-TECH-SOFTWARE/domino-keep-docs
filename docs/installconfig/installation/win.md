---
layout: default
title: Windows
parent: Installing & configuring
nav_order: 1
---

## Windows installation

KEEP is supported for installation on Windows for use with a HCL Notes client **or** a HCL Domino server, but not both. (Should you install both, you are on your own.)

### Preparation

Before you install KEEP, set the respective environment parameters:

There are two system environment variables that need to be set.
These can be accessed on Windows 10 by going to `Control Panel > System > Advanced system settings > Environment Variables....`

You may be able to access the "Advanced system settings" dialog by just typing "Environment Variables" in the search bar in Windows.

1. In the "User variables" section at the top, click New... and add a variable `DYLD_LIBRARY_PATH` with the value of the Domino program directory, e.g. `C:\Program Files\HCL\Domino` or `C:\Program Files (x86)\HCL\Notes`.
2. In "System variables" at the bottom, double-click the "Path" variable and add a new entry pointing to the Domino program directory.

### Server installation

Run the installer to deploy KEEP for Domino:

```bash
java -jar keepinstaller.jar ^
 -d="D:\Domino\data" ^
 -i="D:\Domino\data\notes.ini" ^
 -k="C:\Program Files\HCL\KEEP" ^
 -p="C:\Program Files\HCL\Domino" ^
 -a
```

### All parameters

| Short | full parameter              | mandatory | Description                                                                     |
| :---: | --------------------------- | :-------: | ------------------------------------------------------------------------------- |
| `-d`  | `--dataDir=<dataDir>`       |     ✓     | Directory of your HCL Notes or Domino data                                      |
| `-i`  | `--ini=<notesIni>`          |     ✓     | HCL Notes/Domino notes.ini file                                                 |
| `-k`  | `--keepDir=<keepDir>`       |     ✓     | Directory for the Keep binary installation                                      |
| `-p`  | `--programDir=<programDir>` |     ✓     | Directory where HCL Notes or Domino is installed                                |
|       |                             |           |
| `-a`  | `--accept`                  |           | automatically accept terms & ccoditions                                         |
| `-h`  | `--help`                    |           | Show this help message and exit.                                                |
| `-n`  | `--noIniUpdates`            |           | Install the files, show updated ini entries, but don't write them out           |
| `-r`  | `--dryRun`                  |           | do not actually copy or alter files and settings                                |
| `-s`  | `--skipDirectoryCheck`      |           | skips the checks if the program and data directories<br /> contain Notes/Domino |
| `-V`  | `--version`                 |           | Print version information and exit.                                             |

The installer adds the `keep` task to the automatically starting tasks. If opted out using `-n` you can issue `load keep` manually in the Domino console.

Please refer to the [The KEEP Task](../../usingkeep/keeptask) detail page.

### Verifying the installation

The installer conducts a series of actions:

- Create the Keep directory
- copy the `projectkeep[version-id].jar` file there
- create a libs folder in the Keep directory
- copy all supporting jar files there
- copy `keep` into the Domino directory
- update the `ServerTasks` variable in `notes.ini`, add `keep`
- add a variable `KeepCmdLine` to the `notes.ini` pointing to `startKEEP.cmd`
- update the `EXTMGR_ADDINS` variable in the `notes.ini`

#### Server commands

Start using: `load keep`.

When you issue the console command `sh ta`, you will then see a task for "keep".

The administrator needs to add the `keep` task to the automatically starting tasks or issue `load keep` manually in the Domino console.

Please refer to the [The KEEP Task](../../usingkeep/keeptask) detail page.

---

#### Note 1

Use `tell keep quit` to shut down KEEP. To restart KEEP, use `tell keep restart`.

### Client installation

Run the installer:

```bash
java -jar keepinstaller.jar ^
 -d="C:\Notes\data" ^
 -i="C:\Notes\data\notes.ini" ^
 -k="C:\Program Files\HCL\Notes\KEEP" ^
 -p="C:\Program Files\HCL\Notes" ^
 -a
```

The command file `runKEEP.cmd` is designed for use with the Windows Notes Client. The parameters are the same as above for the server.

#### Verifying the client installation

The installer conducts a series of actions:

- Create the Keep directory
- copy the `projectkeep[version-id].jar` file there
- create a libs folder in the Keep directory
- copy all supporting jar files there
- create `runKEEP.cmd` in the Keep directory

---

#### NOTE 2

FIXME: R12 requires Notes client to run and have "Allow external parties to use Notes session".

You can't use a Notes client while you are running KEEP against your local Notes install.
You can't run KEEP while the Notes client is running. You only need Notes to boot.
