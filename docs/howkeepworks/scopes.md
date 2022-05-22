---
layout: default
title: Scopes
parent: How KEEP Works
nav_order: 5
---

## Scopes

When a KEEP API access presents its [JWT](https://jwt.io/) claim, it includes a `scopes` element.
This element determines what resources the API access intends to use.

Scopes are a space-separated lists of values. By default, a user who authenticates with Domino to gain a JWT token has three scope values in the claim:

- MAIL: Access to the user's mailbox and calendar.
- $DATA: Access to any application the user has access to.
- $DECRYPT: Access to decrypt encrypted items if the database has decryption enabled. (Requires proper setup.)

A scope doesn't **open** access to a resource; that's the job of the database ACL. A scope **limits** access.

Besides the default scopes of `MAIL`, `$DATA` and `$DECRYPT`, any of the database aliases can be used as a scope term.
This allows an IdP to ask a user for tailored permissions in an OICD flow to limit exact access required instead of having the full user spectrum.
