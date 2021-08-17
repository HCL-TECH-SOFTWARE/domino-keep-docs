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

### Docker

- [Docker compose file for primary server](../../assets/downloads/docker-compose-primary.yml)
- [Docker compose file for additional servers](../../assets/downloads/docker-compose-secondary.yml)
- [Docker compose sample.env file](../../assets/downloads/sample.env) (rename this to `.env` before use)

### Linux

These scripts are designed to work
with Daniel Nashed's [Domino Startup Script](https://www.nashcom.de/nshweb/pages/startscript.htm).

- [Pre Startup Script](../../assets/downloads/pre_startup_script)
- [Post Startup Script](../../assets/downloads/post_startup_script)
- [Pre Shutdown Script](../../assets/downloads/pre_shutdown_script)
- [Post Shutdown Script](../../assets/downloads/post_shutdown_script)

### Mac

- [Shell script](../../assets/downloads/startkeepmac.sh) to start KEEP on MacOS.
- Mac [keep](../../assets/downloads/keep) shell script to interact with KEEP on the command line.

### Windows

- [Command file](../../assets/downloads/windows_run_keep.cmd) to start KEEP on a Windows client.
- Windows [keep.cmd](../../assets/downloads/keep.cmd) command file to interact with KEEP.

### Postman

- [Postman collection](../../assets/downloads/KeepTest.postman_collection.json) to exercise KEEP APIs and its [Sample environment](../../assets/downloads/KeepTest.postman_environment.json).
- [Domino Admin API Postman collection](../../assets/downloads/KeepAdminTest.postman_collection.json) to exercise KEEP APIs and its [Sample environment](../../assets/downloads/KeepAdminTest.postman_environment.json).
- [Demo.nsf](../../assets/downloads/Demo.nsf) - Demo database for the Postman and Tutorial examples.

A few notes:

- Use the latest version, versions change frequently.
- Windows server support is in the backlog, expect shakiness.
- Check the start script carefully, adopt them to your needs!
