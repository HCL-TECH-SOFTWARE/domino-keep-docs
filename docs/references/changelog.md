---
layout: default
title: Change Log
parent: References
nav_order: 1
---

## Change Log

This page lists the changes in each release.

### Current Version: {{ site.version }}

- **Installer**: The downloadables now include the Java based installer. See [installation](../installation) for details. Currently the installer has been tested on Linux only, but you are free to try
- OData now is read/write for OData clients supporting write operations (e.g. [Salesforce](../usingkeep/salesforce))
- Updated all Java dependencies to the latest available version
- Improved startup sequence: eliminated dependency on DXL to bootstrap KEEP, hence making the process more stable
- New Domino server add-in task created for KEEP. You now can start KEEP using `load keep` at the Domino server console
- Bugs squashed, documentation updated, typos hunted down
