---
layout: default
title: User Tools
parent: References
nav_order: 5
has_children: true
---

## User Tools

Below is the list of tools that can be used when dealing with REST APIs. Some of these tools are referred to in this documentation. You can, however, use whichever tool you are comfortable with.

| Tool Name                                            | Description                                                                                                                                                   |
| :--------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [curl](https://curl.haxx.se/)                        | Command line tool and library for transferring data with URLs. It is used for REST interaction - for scripts and command line.                                |
| [jq](https://stedolan.github.io/jq/)                 | Command line tool that processes JSON back and forth. Works well with curl.                                                                                   |
| [Postman](https://www.postman.com/)                  | Cross-platform tool to interact with REST resources. Easy to use and very powerful when testing APIs. We provide [sample collections] for it, for you to try. |
| [CharlesProxy](https://www.charlesproxy.com/)        | HTTP(S) proxy to debug. Especially helpful when the client is not a browser.                                                                                  |
| [Mockaroo](https://www.mockaroo.com/)                | Online tool to generate sample data.                                                                                                                          |
| [Let's Encrypt](https://letsencrypt.org/)            | Generates free SSL certificates.                                                                                                                              |
| [SourceTree for GIT](https://www.sourcetreeapp.com/) | Used for version control.                                                                                                                                     |
| [Swagger UI](https://swagger.io/tools/swagger-ui/)   | Allows visualization and interaction with APIs without the need for actual implementation logic.                                                              |

### Developer Tools

Below are the requirements for contributing to or extending KEEP:

- An editor or IDE of your choice:
  - [Eclipse](https://www.eclipse.org/downloads/) or [Eclipse Che](https://www.eclipse.org/che/getting-started/download/)
  - [VSCode](https://code.visualstudio.com/) with Java plugins
  - [IntelliJ](https://www.jetbrains.com/idea/)
- A solid understanding of [Maven](https://maven.apache.org/)
- The [vert.x](https://vertx.io) framework for Java, JavaScript and others
- [Apicurio](https://www.apicur.io/), which is an online GUI editor for OpenAPI files

Check the details to [setup the development environment](../../extendingkeep/devenv/devenvindex)
