---
layout: default
title: HCL Domino KEEP
nav_order: 1
description: "HCL Domino KEEP REST API"
permalink: /
has_children: true
---

{::options parse_block_html="true" /}

# HCL Domino KEEP

HCL Domino KEEP, a.k.a Domino REST API, provides a secure REST API access into HCL Domino servers and databases.
{: .alert .alert-info}

{: .fs-9 }
{{ site.version }}
{: .fs-3 }

<div class="panel panel-success">
**KEEP objectives**
{: .panel-heading}
<div class="panel-body">
"_Make Domino development and access available to a broad audience with diverse development backgrounds. Keep the barrier to entry low without sacrificing enterprise and container deployability. Ensure access control through declaration on the server and its databases, relieving end-user applications from that task_"
</div></div>

![KEEP API]({{ '/assets/images/svg/DominoKeepAPI.svg' | relative_url }}){: .scale-img-seventy-five-percent }

[Get started now]({{ 'introduction/quickstart' | relative_url }}){: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-2 } [View it on GitHub]({{ site.github.repository_url }}){: .btn .fs-5 .mb-4 .mb-md-0 } [Download {{ site.version}} ]({{ site.flexnet_url }}){: .btn .fs-5 .mb-4 .mb-md-0 }

---

<div class="panel panel-warning">
**We want to hear from you**
{: .panel-heading}
<div class="panel-body">
Join us for questions, discussions, ideas and feedback over at [OpenNTF's KEEP chat](https://openntf.slack.com/archives/C0232M13WFQ) and/or participate in the [Early release forum](feedback).
</div></div>

---

Domino REST API is designed to re-establish Domino as a world class, modern, standards-compliant, cloud native and enterprise-level collaboration platform. It adds contemporary [REST APIs](https://www.redhat.com/en/topics/api/what-is-a-rest-api) to Notes and Domino, enabling a modern programming experience with the tools of your choice.

Classic Domino applications are document-oriented and often based on an approval model: documents flow through a business lifecyle and are approved at each stage. Domino developers develop a separate user interface for each approval state that is used by the people who perform the actions for that state.

KEEP moves access control out of the code and into the configuration. But it means control stays with those who need to support the data, not those who consume the data. KEEP grants granular access for actions like read or write depending on what the document data is and who is viewing it. This approach ensures that the correct person can perform the correct action on the document and its data. Most importantly, it means control over data quality remains with those who need to support the data, not those who provide and consume the data.

![Barbican1]({{'/assets/images/BarbicanInActionPart1.png' | relative_url }})

For example, in the case of an expense report filed by an employee, the approver and the employee can only edit the fields that correspond to their role. An approver might be able to approve and add a remark only and an employee might be able to provide a subject, description, and cost only.

This granular access managed through configurations is what makes Domino REST API unique!

Also, in KEEP, we built modern REST APIs that are designed to bring Notes and Domino forward in the current market. KEEP adds OpenAPI specified REST APIs to Domino and allows the latter to talk to any server or client over http, https or http/2. Using KEEP APIs, any application that talks https can access the data from a Domino database, hence extending the availability of this data beyond the Notes client.

![Basic KEEP Diagram]({{'/assets/images/svg/Basic_KEEP_Diagram.svg' | relative_url }})

For example, the data in a Domino database that could earlier be viewed only in a Notes client, can now be viewed on mobile applications as well using the KEEP APIs. Refer to the [use cases](introduction/usecases.md) for more examples.

The KEEP APIs are secure and standards-compliant, making them the right choice for your Notes and Domino ecosystem.

Much like the architectural keep that fortifies the castle, Domino KEEP adds to the existing functionalities provided by Notes and Domino.
{: .alert .alert-info}

KEEP can run on your developer desktop, where you can evaluate it from your Notes client. KEEP is available on Windows (client & server), Linux (server), Docker (server) and macOS (client) as add-on for Notes and Domino 12.0.1 and later.

KEEP caters to Domino mail as well as Domino applications, irrespective of the difference in the way they work. While Domino mail allows one-to-one mapping between users and mail files (with only occasional exceptions), Domino applications allow multiple users to access the same application. KEEP looks beyond this difference and serves both Domino mail as well as Domino applications.

![MailVsApplication](assets/images/svg/MailVsApps.svg)

## What applications does KEEP support?

KEEP is designed to work with:

- Desktop applications with direct access to the Domino server, written in any language (e.g. Java, C#, Rust, [Electron](https://www.electronjs.org/), [Jupyter](https://jupyter.org/), [Python](https://www.python.org/) etc).
- Browser-based applications hosted on KEEP or elsewhere, written in HTML and JavaScript (e.g. [ReactJS](https://reactjs.org/), [VueJS](https://vuejs.org/), [Svelte](https://svelte.dev/), [Angular](https://angular.io/), [VanillaJS](http://vanilla-js.com/) etc).
- Application-server-based applications (e.g. [NodeJS](https://loopback.io/), [HCL DX](https://www.hcltechsw.com/dx) , [Spring](https://spring.io/projects/spring-framework), [SpringBoot](https://spring.io/projects/spring-boot), [Vaadin](https://vaadin.com), [Vert.x](https://vertx.io), [Quarkus](https://quarkus.io), [PHP](https://www.php.net/), [Wordpress](https://wordpress.com/) etc).
- Command Line Interfaces (CLI), starting with but not limited to [curl](references/usertools/curl.md).
- [OData](https://www.odta.org) aware applications (e.g. SAP, Salesforce, Microsoft Excel, [Tableau](https://help.tableau.com/current/pro/desktop/en-us/examples_odata.htm) etc).
- LowCode environments like [HCL Volt MX](https://www.hcltechsw.com/volt-mx), [NodeRED](https://wwww.nodered.org) or others.

## Domino KEEP features

KEEP is based on industry standards, allows Notes and Domino to be accessed from other platforms, follows standard APIs, is extendable and uses the Notes and Domino security model. KEEP also puts the power in the hands of the developer to work using their preferred programming language.

### KEEP is secure

KEEP is secure by default since it inherits all the [security features](installconfig/configuration/security/index.md) of Notes and Domino. All access to the database is authenticated using [JSON Web Token (JWT)](https://www.jwt.io) and [Scopes](installconfig/configuration/security/authentication.md). Identity can be provided using Domino credentials and/or your Enterprise IdP (Identity Provider) like Keycloak or Active Directory. The databases or forms and views that can be accessed are explicitly listed. Security extends to a field level read/write control by [The Barbican](howkeepworks/barbican.md)

### Modern Java API (Java 8++)

Domino KEEP uses redesigned Java APIs named Domino JNX (Domino Java Next), which follow industry standards and best practices.

### Public API based on OpenAPI 3.0

We follow the [API first](https://swagger.io/resources/articles/adopting-an-api-first-approach/) design with full interactive documentation. Our public APIs follow the standards set by OpenAPI 3.0. The OpenAPI specifications you see in Swagger/Redoc on the server are used dynamically by KEEP to validate requests, so you know they are up-to-date.

### Extensible architecture

KEEP has an [extensible architecture](extendingkeep/index.md) that allows it to serve multiple API versions from a Domino server. We currently support admin, core, CI/CD and PIM APIs but KEEP can be extended to add more APIs.

### Web admin GUI

We provide a Web [Admin UI](usingkeep/administrationui) that facilitates admin actions.

### Design, admin and data

Along with the application design and admin features, KEEP allows CRUD operations on documents, retrieval of collections (aka views and folders), execution of queries and submission of access control, design and code, while maintaining and extending Domino’s security model.

### Low barrier to entry

KEEP runs on Domino and/or your Notes Client on Windows/Linux/Mac. Someone with previous working experience of Notes and Domino can quickly get started with KEEP, as you are about to find out for yourself!
