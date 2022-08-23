---
layout: default
title: Post Installation Tasks
parent: Installing & configuring
nav_order: 6
---

# Post Installation Tasks

Complete the tasks listed here to finalize a production worthy KEEP deployment. The headlines link to details for each task. Feedback is welcome.

## [Securing ports](../configuration/configuringPorts)

A production environment must encrypt the communication between any client and the KEEP Server. We use multiple ports, learn how to secure them.

## [Enable a database](../../usingkeep/enablingadb)

To make a database available on the KEEP rest API, one needs to create a KEEP `schema` and link it to a publicly visible `scope`. The schema defines what documents, based on the value of their `form` item, views and folders as well as agents are available for a call via http.

## [Configure JWT](../configuration/security/authentication)

KEEP uses JSON Web Token (JWT) for Authroization. To allow using KEEP without the deployment of an external Identity Provider (IdP) KEEP can be configured to provide a JWT after authentication with Domino credentials.

## [Sharing JWT between servers](../configuration/security/encryption)

JWT token can be shared between servers, effectively enabling SSO (Single Sign On) for KEEP. It is LTPA for grownups

## [Configure apps](../../tutorial/adminui)

The Admin UI allow to configure databaase schemas, server scopes and OAuth applications (Domino functioning as IdP)

## [Setup functional Accounts](./functionalUsers)

There are a series of endpoints that are not associated with regular user ids:

- Management console (Port 8889)
- Metrics endpoint (Port 8890)
- Health check (Port 8886)

To enable access to those, you need functional accounts
