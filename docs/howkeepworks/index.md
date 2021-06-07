---
layout: default
title: How KEEP Works
nav_order: 6
has_children: true
---

## How KEEP Works

Let's take a look at the internal structure of KEEP to understand how it works. KEEP has a layered architecture with an HTTP listener at the top that receives the requests and hands them over to the handler. The handler then sends the requests to EventBus, which distributes them between different worker verticles. Then come the _dbrequests_ classes that process the requests.

![KEEP Classes]({{ 'assets/images/KEEPclasses.png' | relative_url }})

- Requests arrive at the HTTP listener.
- Based on OpenAPI specification, the listener loads routes and the required classes are derived from the OperationId of the OpenAPI specification.
- Most requests and responses are JSON data and the HTTP listener identifies it based on OpenAPI specification.
- Requests that provide and expect JSON are handled by the default code i.e. the _defaultJsonHandler class_. When the content-type is different, an HTTP side handler is provided. This handler is named after the operationID from the OpenAPI specification. The runtime indicates which handler classes are missing.
- These classes then send the message to EventBus.
- The EventBus then distributes the work to worker verticles, the _DominoDefaultVerticle_ class.
- The basic configuration of the KEEP system has worker verticles for code, data, design and personal information maanagement (PIM). Since KEEP is extensible, you can add worker verticles, if needed.
- The _DominoDefault Verticle_ class knows which handler class to load.
- The appropriate _dbrequests_ handler class then takes over and processes the request, for example, talks to the Notes database, retrieves or updates information, and so forth.

Check the [Extending KEEP]({{ 'extendingkeep' | relative_url }}) section for details.


Here is how KEEP handles different errors. 
![KEEP Errors](../assets/images/KeepErrors.png)
