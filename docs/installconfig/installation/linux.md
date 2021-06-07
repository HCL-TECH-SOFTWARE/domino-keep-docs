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
java -jar keepinstaller \
 -d="/local/notesdata" \
 -i="/local/notesdata/notes.ini" \
 -k="opt/hcl/keep" \
 -p="/opt/hcl/notes/linux/latest"
```

The administrator needs to add the `keep` task to the automatically starting tasks or issue `load keep` manually in the Domino console.
