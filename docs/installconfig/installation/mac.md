---
layout: default
title: Mac
parent: Installing & configuring
nav_order: 2
---

## macOS Installation

---

> **NOTE**: The Early Access June release contains only a [Docker image](../docker). The installer described here is planned for a later code drop

---

On macOS the installer uses the HCL Notes client to install KEEP. The call to the installer looks like this:

```bash
java -jar keepinstaller \
 -d="/Users/[your user name]/Library/Application Support/HCL Notes Data" \
 -i="/Users/[your user name]/Library/Preferences/Notes Preferences" \
 -k="/Users/[your user name]/Applications/KEEP" \
 -p="/Applications/HCL Notes.app"
```

The installer creates a `lauchkeep.sh` in the KEEP installation directory. The user can copy or move it to `~/bin` to add it to the macOS path.
