---
layout: default
title: Downloads
parent: References
nav_order: 4
---

## Resources

Downloadable assets to get you started.

### Domino REST API

- [{{ site.version}} ]({{ site.flexnet_url }})

### Presentations

- [Engage 2022 Presentation](../assets/downloads/De22%20Project%20KEEP.pdf)

### Docker

- [Docker compose file for primary server](../assets/downloads/docker-compose-primary.yml)
- [Docker compose file for additional servers](../assets/downloads/docker-compose-secondary.yml)
- [Docker compose `sample.env` file](../assets/downloads/sample.env) (**NOTE:** rename this file to `.env` and update your values before use)

### Postman

- [Postman collection](../assets/downloads/KeepTest.postman_collection.json) to exercise KEEP APIs and its [Sample environment](../assets/downloads/KeepTest.postman_environment.json).
- [Domino Admin API Postman collection](../assets/downloads/KeepAdminTest.postman_collection.json) to exercise KEEP APIs and its [Sample environment](../assets/downloads/KeepAdminTest.postman_environment.json).
- [Demo.nsf](../assets/downloads/Demo.nsf) - Demo database for the Postman and Tutorial examples.

The scripts below are only for reference (and amusement). THey have been superceded by the scripts provided by the installer. So there's no need beyond satisfying curiosity to download them.
{: .alert .alert-danger}

<!-- ### Linux

These scripts are designed to work
with Daniel Nashed's [Domino Startup Script](https://www.nashcom.de/nshweb/pages/startscript.htm).

- [Pre Startup Script](../assets/downloads/pre_startup_script)
- [Post Startup Script](../assets/downloads/post_startup_script)
- [Pre Shutdown Script](../assets/downloads/pre_shutdown_script)
- [Post Shutdown Script](../assets/downloads/post_shutdown_script) -->

### Mac

- [Shell script](../assets/downloads/macClient.sh) to start KEEP on MacOS.
- Modify the script and replace all instances in the Shell script before using as follows
    - programDir with the directory Notes is located in.
    - dataDir with the directory the Notes Data is located in.
    - keepDir with the directory Keep is located in.

### Windows

- [Command file](../assets/downloads/winClient.cmd) to start KEEP on a Windows client.
-  Modify the script and replace all instances in the Command file before using as follows
     - programDir with the directory Notes is located in.
     - dataDir with the directory the Notes Data is located in.
     - keepDir with the directory Keep is located in.
