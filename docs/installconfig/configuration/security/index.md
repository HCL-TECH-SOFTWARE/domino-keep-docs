---
layout: default
title: Security
nav_order: 6
parent: Installing & configuring
has_children: true
---

## Security

Good security is not a one-trick pony, but a combination of factors. Here is what we implemented:

- We use [Open Standards](../../../references/standards) wherever appropriate. Standards enjoy more scrutiny from more eyeballs.
- The [vert.x Framework](https://vertx.io) supports all flavors of [SSL certificates](https://vertx.io/docs/vertx-core/java/#ssl).
- All endpoints, short of login and OData, require a signed [JWT](https://jwt.io) claim.
- We support public/private keys for identity provider setup.
- Databases are not automatically exposed on REST, when you run KEEP. Only the ones that are configured by the administrators.
- No anonymous access is granted for REST data.
- Access to sensitive information can be limited to servers that present additional credentials.
- Read/Write access is controlled on a per form, field and user basis. See [The Barbican](../../../howkeepworks/barbican) for details.

Here's a flowchart to show how KEEP handles security. 

![Security flow](../../../assets/images/KeepDataAccess.png)

See amore details in [security configuration](securityjson).
