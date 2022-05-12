---
layout: default
title: Quickstart
parent: HCL Domino KEEP
nav_order: 1
---

## Quickstart

[Download {{ site.version}}]({{ site.flexnet_url }}).
{: .alert .alert-info}

## What's New

Here's what's new in {{ site.version }}:

- Dropped Domino versioning, switched to KEEP's internal version
- Updated vert.x to 4.3.0
- Updated all Java dependencies
- Updated Log4J2 to version 2.17.2
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
- updated templates

## Let's get started

To get up and running quickly, you will need to:

- [Install](../../installconfig/index) KEEP on a Notes client or a Domino server.
- Pick a database you want to work with (you could use [demo.nsf](../../references/downloads)).
- Use the KEEP API to enable the database for REST access:
  - Pick the forms and fields to expose.
  - Pick the views you want to be REST accessible.
  - (Optional) pick the agents.
- Try out the API.

You can use the built-in Swagger API, curl, or the [KEEP Admin UI](../../usingkeep/administrationui/). To help you, use one of the following tutorials. We have a curl based [keep shell script](../../references/downloads) for you to play with.

### Tutorials

- Easy steps [on this site](../../tutorial)
- A [tutorial for the skilled Notes developer](https://opensource.hcltechsw.com/domino-keep-tutorials/pages/todo/index)
- Similar to the previous one, but from the viewpoint of a [skilled web developer](https://opensource.hcltechsw.com/domino-keep-tutorials/pages/domino-new/index#pre-requisites)
- Explore on your own using a [Postman collection](../../references/downloads)

![OpenAPI](../../assets/images/postman.png)

The [Postman collection](../../references/downloads) has sample interactions with the local sample `Demo.nsf`, go check it out

### Endpoints

Ensure your endpoints are [secure](../installconfig/configuration/security/securingKEEPEndpoints.md).
Bring up a browser and verify that you can hit these endpoints:

| Endpoints                                       | Ports | Details                                                                                                                                                                                                                                                                                                                                                               | Webpages                                          |
| ----------------------------------------------- | ----- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------- | ------------------------------- |
| [KEEP API Home Page](http://localhost:8880/)    | 8880  | Start page                                                                                                                                                                                                                                                                                                                                                            | ![StartPage]({{ '/assets/images/startpage.png'    | relative_url }}){: .img-zoom %} |
| [Live KEEP API](http://localhost:8880/openapi/) | 8880  | Interact live with the API                                                                                                                                                                                                                                                                                                                                            | ![OpenAPI]({{ '/assets/images/OpenAPI.png'        | relative_url }}){: .img-zoom %} |
| [Admin UI](http://localhost:8880/admin/ui)      | 8880  | Login with an admin user. LocalDomainAdmin member                                                                                                                                                                                                                                                                                                                     | ![Admin Login]({{ '/assets/images/AdminLogin.png' | relative_url }}){: .img-zoom %} |
| [Management API](http://localhost:8889/)        | 8889  | Access to the log and runtime info                                                                                                                                                                                                                                                                                                                                    | ![Server Info]({{ '/assets/images/ServerInfo.png' | relative_url }}){: .img-zoom %} |
| [Prometheus Metrics](http://localhost:8890/)    | 8890  | Performance info in Prometheus format. Protected with basic authentication (metrics/metrics)                                                                                                                                                                                                                                                                          |
| [Health check endpoint](http://localhost:8887/) | 8887  | Server healthcheck endpoint as used by Kubernetes or Openshift                                                                                                                                                                                                                                                                                                        |
| [Auth](http://localhost:8880/api/v1/auth)       | 8880  | The endpoint, `[POST] http/s://${HOST}:8880/api/v1/auth`, is the default end point to exchange Domino web credentials for a JWT access token. For example, use the token in Postman request headers as a Bearer authentication header. You also can use your [own IdP](../../installconfig/configuration/security/configuringIdentityProvider/) to gain access tokens |

### What's next?

Based on your interest, start by exploring the following sections of this documentation:

- Dive deeper into [installation and configuration](../../installconfig/index)
- Learn more about [using KEEP](../../usingkeep/index).
- Explore the internal [working of KEEP](../../howkeepworks/index) and know more about [The Barbican](../../howkeepworks/barbican).
- Familiarize yourself with [extending KEEP](../../extendingkeep/index).
