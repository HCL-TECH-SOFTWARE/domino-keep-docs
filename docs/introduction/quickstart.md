---
layout: default
title: Quickstart
parent: HCL Project KEEP
nav_order: 1
---

## Quickstart

[Download {{ site.version}}]({{ site.flexnet_url }}).
{: .alert .alert-info}

## What's New

Check the [Changelog](../references/changelog) to learn what is new in {{ site.version }}

## The KEEP schema

You won't find the KEEP schema here. Samples and explanations, configuration and steps - yes. The actual schema however lives live on your KEEP server instance as OpenAPI specification. You can read and explore it directly with your own data!
{: .alert .alert-danger}

## A few phrases you should know

- A database exposed on the API is referred to as a **scope**. The exposure happens through an entry in KEEP's configuration database by an administrator with `Editor` access there. The scope gets used in the URLs as `?dataSource=[scopename]`. Scopes for databases are lowercase only
- The shape of data available is referred to as a **schema**. The schema is an json file in the design resources of the database. It gets created by a developer with `Designer` access to the NSF
- A **KEEP Application** is an [OAuth](https://oauth.net/) compatible definition of a `client_id` and a `client_secret` as well as the list of permitted scopes
- A **scope** points to a **schema** that is contained in a database. A database can have [**multiple schemas**](../assets/images/KeepSchemaToApp.png) for different use cases and a **schema** can be pointed to by **more than one scope**

Pick the name of your **scope** wisely. It is the external name you share with others and thus hard to change without breaking external apps
{: .alert .alert-danger}

## Let's get started

To get up and running quickly, you will need to:

- [Install](../installconfig/index) KEEP on a Notes client or a Domino server.
- Pick a database you want to work with (you could use [demo.nsf](../references/downloads)).
- Use the KEEP API to create a **schema** REST access (if you dare, use Domino designer :-) )
  - Pick the forms and fields to expose.
  - Pick the views you want to be REST accessible.
  - Pick the agents. (Optional)
- Use the KEEP API to create a **scope**,
- Try out the API.

You can use the built-in [Swagger API](../tutorial/swagger), [Postman and Curl](../tutorial/postmancurl), or the [KEEP Admin UI](../tutorial/adminui). To help you, use one of the following tutorials. We have a curl based [keep shell script](../references/downloads) for you to play with.

Make sure to complete the [post installation steps](../installconfig/installation/postinstallation) to ensure proper operation
{: .alert .alert-success}

### Tutorials

- Easy steps [on this site](../tutorial)
- A [tutorial for the skilled Notes developer](https://opensource.hcltechsw.com/domino-keep-tutorials/pages/todo/index)
- Similar to the previous one, but from the viewpoint of a [skilled web developer](https://opensource.hcltechsw.com/domino-keep-tutorials/pages/domino-new/index#pre-requisites)
- Explore on your own using a [Postman collection](../references/downloads)

![OpenAPI](../assets/images/postman.png)

The [Postman collection](../references/downloads) has sample interactions with the local sample `Demo.nsf`, go check it out

### Roles

- **Domino developer**: creates the **schema** that defines what data can be accessed in a nsf database
- **Domino administrator**: creates and activates the **scope** that defines how the data can be accessed. Also creates (optional) OAuth compatible applications with `client_id` and `client_secret` properties
- **VoltMX administrator**: configures Volt MX's foundry middleware to interact with KEEP using the foundry KEEP adapter
- **Application developer**: develops applications leveraging KEEP Endpoints, VoltMX services and front-end tools like VoltMX Iris, VSCode or any tools and framework of choice

Read more about them in [KEEP Roles](../usingkeep/roles)

### Endpoints

Ensure your endpoints are [secure](../installconfig/configuration/security/securingKEEPEndpoints).
Bring up a browser and verify that you can hit these endpoints:

| Endpoints                                                                                      | Ports | Details                                                                                                                                                                                                                                                                                                                                                           | Webpages                                          |
| ---------------------------------------------------------------------------------------------- | ----- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------- | ------------------------------- |
| [KEEP API Home Page](http://localhost:8880/)                                                   | 8880  | Start page                                                                                                                                                                                                                                                                                                                                                        | ![StartPage]({{ '/assets/images/startpage.png'    | relative_url }}){: .img-zoom %} |
| [Live KEEP API](http://localhost:8880/openapi/index.html?url=/api/v1/schema/openapi.core.json) | 8880  | Interact live with the API                                                                                                                                                                                                                                                                                                                                        | ![OpenAPI]({{ '/assets/images/OpenAPI.png'        | relative_url }}){: .img-zoom %} |
| [Admin UI](http://localhost:8880/admin/ui/)                                                    | 8880  | Login with an admin user. LocalDomainAdmin member                                                                                                                                                                                                                                                                                                                 | ![Admin Login]({{ '/assets/images/AdminLogin.png' | relative_url }}){: .img-zoom %} |
| [Management API](http://localhost:8889/)                                                       | 8889  | Access to the log and runtime info                                                                                                                                                                                                                                                                                                                                | ![Server Info]({{ '/assets/images/ServerInfo.png' | relative_url }}){: .img-zoom %} |
| [Prometheus Metrics](http://localhost:8890/)                                                   | 8890  | Performance info in Prometheus format. Protected with basic authentication (metrics/metrics)                                                                                                                                                                                                                                                                      |
| [Health check endpoint](http://localhost:8887/)                                                | 8887  | Server healthcheck endpoint as used by Kubernetes or Openshift                                                                                                                                                                                                                                                                                                    |
| [Auth](http://localhost:8880/api/v1/auth)                                                      | 8880  | The endpoint, `[POST] http/s://${HOST}:8880/api/v1/auth`, is the default end point to exchange Domino web credentials for a JWT access token. For example, use the token in Postman request headers as a Bearer authentication header. You also can use your [own IdP](../installconfig/configuration/security/configuringIdentityProvider) to gain access tokens |

### What's next?

Based on your interest, start by exploring the following sections of this documentation:

- Dive deeper into [installation and configuration](../installconfig/index)
- Learn more about [using KEEP](../usingkeep/index).
- Explore the internal [working of KEEP](../howkeepworks/index) and know more about [The Barbican](../howkeepworks/barbican).
- Familiarize yourself with [extending KEEP](../extendingkeep/index).
