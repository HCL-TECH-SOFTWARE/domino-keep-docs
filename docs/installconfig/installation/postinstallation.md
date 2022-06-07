---
layout: default
title: Post Installation Tasks
parent: Installing & configuring
nav_order: 6
---

# Post Installation Tasks

This chapter describes tasks you can perform after installing an instance of KEEP.

## [Securing ports](../configuration/configuringPorts)

Port encryption encrypts the communication between the Client and the Keep Server, bringing an additional layer of security to the network communication. For more information on [Securing ports](../configuration/configuringPorts).

## [Enable a database](../../usingkeep/enablingadb)

For more information about creating a keep schema, forms, agents and add database click on [Enable a database](../../usingkeep/enablingadb).

## [Configure JWT](../configuration/security/authentication)

JSON Web Token (JWT) is an open standard that defines a compact and self-contained way for securely transmitting information between parties as a JSON object. This information can be verified and trusted because it is digitally signed. For more information on [Configure JWT](../configuration/security/authentication).

## [Sharing JWT between servers](../configuration/security/encryption)

This section explains usage of JWT token sharing between servers. For more information on [Sharing JWT between servers](../configuration/security/encryption).

## [Configure apps](../../tutorial/adminui)

This section explains the setup of Admin UI and adding databases. For more information on [Configure apps](../../tutorial/adminui).

## [Setup functional Accounts](./functionalUsers)

There are a series of endpoints that are not associated with regular user ids:

- Management console (Port 8889)
- Metrics endpoint (Port 8890)
- Health check (Port 8886)

To enable access to those, you need functional accounts
