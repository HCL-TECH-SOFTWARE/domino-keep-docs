---
layout: default
title: Change Log
parent: References
nav_order: 1
---

## Change Log

This page lists the changes in each release.

### Current Version: {{ site.version }}

- Dropped Domino versioning, switched to KEEP's internal version
- Updated vert.x to 4.3.0
- Updated all Java dependencies
- Docker container uses Domino 12.0.1IF1
- Database specific KEEP configurations now stored as design elements in database (thus also editable from Domino designer)
- reworked configuration format, close to JSON schema
- New end point `/listpivot` for server side pivot operations
- Updated admin UI
- Consistency enforcement for JSON. Fields defined as multi-value will always return array regardless of note content. Fields defined as single value will never return an array
- KEEP Schema caters to Names, Readers, Authors
- OAuth IdP functiionality for KEEP applications
- extended info in JWT token
- related multi-value fields can be configured to return combined records

### 12.0.1-EarlyAccess Beta3

- Java based installer that works on all platforms (bugs fixed)
- Docker container uses Domino 12.0.1 Beta
- New endpoints
  - bulk/create
  - bulk/update
  - vcalendar/{calid}/{unid}
- Updated Postman test
- Start script fixes
- vert.x updated to 4.2.0
- Dependencies updated
- Reworked KEEP task (no more pipe errors)

### 12.0.1-EarlyAccess Beta2

- **Installer**: The downloadables now include the Java based installer. See [installation](../installation) for details. Currently the installer has been tested on Linux only but you are free to try.
- OData now is read/write for OData clients supporting write operations (e.g. [Salesforce](../usingkeep/salesforce)).
- Updated all Java dependencies to the latest available version.
- Improved startup sequence: eliminated dependency on DXL to bootstrap KEEP, hence making the process more stable.
- New Domino server add-in task created for KEEP. You now can start KEEP using `load keep` at the Domino server console.
- Bugs squashed, documentation updated, typos hunted down.
