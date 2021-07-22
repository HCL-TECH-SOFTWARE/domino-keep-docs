---
layout: default
title: Mac
parent: Installing & configuring
nav_order: 2
---

## macOS Installation

On macOS the installer uses the HCL Notes client to install KEEP. The call to the installer looks like this:

```bash
java -jar keepinstaller.jar \
 -d="/Users/[your user name]/Library/Application Support/HCL Notes Data" \
 -i="/Users/[your user name]/Library/Preferences/Notes Preferences" \
 -k="/Users/[your user name]/Applications/KEEP" \
 -p="/Applications/HCL Notes.app" \
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

The installer creates a `runKEEP.sh` in the KEEP installation directory. The user can copy or move it to `~/bin` to add it to the macOS path.

## Verifying the installation

The installer conducts a series of actions:

- Create the Keep directory
- copy the `projectkeep[version-id].jar` file there
- create a libs folder in the Keep directory
- copy all supporting jar files there
- create `runKEEP.sh` in the Keep directory
