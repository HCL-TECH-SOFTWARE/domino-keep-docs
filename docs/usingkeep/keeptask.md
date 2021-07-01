---
layout: default
title: The KEEP task
parent: Using KEEP
nav_order: 1
---

## The KEEP Task

On Domino servers KEEP can be loaded using `load keep` in the Domino server console.

To automatically start KEEP on server start, the mode of operation you want for a production system, add `keep` to the values of the `notes.ini` entry `servertasks`

The launch of KEEP is governed by the `notes.ini` key `KeepCmdLine` which is set by the KEEP installer

## KEEP Task commands

Once the KEEP task is loaded in the Domino console, you can use the following commands to interact with KEEP:

| Command                   | Effect                              |
| ------------------------- | ----------------------------------- |
| `load keep`               | Start the Domino REST API           |
| `tell keep quit`          | End the Domino REST API             |
| `tell keep reload`        | Restart with new configuration      |
| `tell keep [show] info`   | Show loaded components (geek stuff) |
| `tell keep [show] config` | Show current configuration          |
| `tell keep [show] status` | Show version information and state  |
