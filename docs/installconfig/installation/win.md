---
layout: default
title: Windows
parent: Installing & configuring
nav_order: 1
---

## Windows installation

---

> **NOTE**: The Early Access June release contains only a [Docker image](../docker). The installer, as described here, is planned for a later code drop.

---

KEEP is supported for installation on Windows for use with a HCL Notes client **or** a HCL Domino server, but not both. (Should you install both, you are on your own.)

### Preparation

Before you install KEEP, set the respective environment parameters:

FIXME: Additional parameters required

There are two system environment variables that need to be set.
These can be accessed on Windows 10 by going to `Control Panel > System > Advanced system settings > Environment Variables....`

You may be able to access the "Advanced system settings" dialog by just typing "Environment Variables" in the search bar in Windows.

1. In the "User variables" section at the top, click New... and add a variable `DYLD_LIBRARY_PATH` with the value of the Domino program directory, e.g. `C:\Program Files\HCL\Domino` or `C:\Program Files (x86)\HCL\Notes`.
2. In "System variables" at the bottom, double-click the "Path" variable and add a new entry pointing to the Domino program directory.

### Server installation

Run the installer to deploy KEEP for Domino:

```bash
java -jar keepinstaller ^
 -d="D:\Domino\data" ^
 -i="D:\Domino\data\notes.ini" ^
 -k="C:\Program Files\HCL\Domino\KEEP" ^
 -p="C:\Program Files\HCL\Domino"
```

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
java -jar keepinstaller ^
 -d="C:\Notes\data" ^
 -i="C:\Notes\data\notes.ini" ^
 -k="C:\Program Files\HCL\Notes\KEEP" ^
 -p="C:\Program Files\HCL\Notes"
```

The command file `windows_run_keep.cmd` is designed for use with the Windows Notes Client.

---

#### NOTE 2

FIXME: R12 requires Notes client to run and have "Allow external parties to use Notes session.

You can't use a Notes client while you are running KEEP against your local Notes install.
You can't run KEEP while the Notes client is running. You only need Notes to boot.
