---
layout: default
title: Linux
parent: Installing & configuring
nav_order: 3
---

## Installing on Linux Server

---

> **NOTE**: The Early Access June release contains only a [Docker image](../docker). The installer described here is planned for a later code drop.

---

On Linux the installer uses the HCL Domino server to install KEEP.
It is **strongly** recommended to use the default directories on Linux.

The call to the installer looks like this:

```bash
java -jar keepinstaller.jar \
 -d="/local/notesdata" \
 -i="/local/notesdata/notes.ini" \
 -k="/opt/hcl/keep" \
 -p="/opt/hcl/notes/linux/latest" \
 -a
```

## All parameters

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

## Verifying the installation

The installer conducts a series of actions:

- Create the Keep directory
- copy the projectkeep\*.jar file there
- create a libs folder in the Keep directory
- copy all supporting jar files there
- copy `keep` into the Domino directory
- update the `ServerTasks` variable in `notes.ini`, add `keep`
- add a variable `KeepCmdLine` to the `notes.ini` pointing to `startkeep.sh`
- (in future) update the `EXTMGR_ADDINS` variable in the `notes.ini`

## File ownership and access rights

On Linux you need to carefully check that your file and directory ownership and access rights are set correctly. The **strongly** recommended conventions are:

- User to run the Domino server: `notes`
- Domino installed in `/opt/hcl/domino` -> owned by `root`
- KEEP installed in `/opt/hcl/keep` -> owned by `root`
- Domino data directory `/local/notesdata` -> owned by `notes`
- Access for files and directories in `/opt` set to `755`
- Access for directories in `/local/notesdata` set to `770`
- Access for files in `/local/notesdata` set to `660`
- NOTE: directories need the execute flag (1), otherwise they can't be accessed, so access for a directory must be an odd number always
- When you set access anywhere to `777` a kitten will die, don't ever do this
