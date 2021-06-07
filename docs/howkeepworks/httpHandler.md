---
layout: default
title: The HTTP Handler
parent: How KEEP Works
nav_order: 2
---
## The HTTP handler

The HTTP handler accepts incoming requests defined in the OpenAPI specification and sends them, if they are in compliance with the specification, to the [EventBus](eventbus.md).

![Data from HTTP to eventBus]({{ '/assets/images/HTTPtoEventBus.png' | relative_url }})

All incoming request parts get mapped:

- Headers
- Cookies
- Path parameters
- Query parameters
- Body
