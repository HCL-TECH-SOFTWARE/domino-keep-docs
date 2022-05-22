---
layout: default
title: Using KEEP
nav_order: 5
has_children: true
---

## Using KEEP

KEEP provides you a REST API for your Domino server to be used from anything that speaks http(s). To get started do the following:

- Create a KEEP database configuration (Schema) for an existing Domino database, available in the Admin UI and the API.
- Or create a complete new database using KEEP API calls.
- Decide what forms, views, folders and agent you want to expose on the KEEP API, available in the Admin UI and the API.
- Activate the schema by creating a scope (Rest mapping)
- Try your decisions using a http tool like `curl` or `postman`.
- Configure an application in the AdminUI to create a client_id and a client_secret, so your applications can use OAuth to authenticate
- Add calls to KEEP into your application.

Read more details in the pages listed in the "Table of content" below
