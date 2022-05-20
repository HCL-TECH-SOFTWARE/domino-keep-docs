---
layout: default
title: Swagger UI
parent: User Tools
grand_parent: References
nav_order: 1
---

## Swagger UI

### Introduction

Swagger UI allows to visualize and interact with APIs without having any of the actual implementation logic in place. The APIs are automatically generated from the [OpenAPI (formerly Swagger) Specification](https://swagger.io/specification/), with the visual documentation making it easier to implement the backend code at a later stage.

### The OpenAPI Specification

The OpenAPI Specification is a set of rules that symantically describes APIs.  It is written either in YAML or JSON and hence, is both human- and machine-readable.  Here is a simple JSON description of the KEEP API:

![Swagger File]({{ '/assets/images/KeepSwaggerUI.png' | relative_url }})

### Swagger UI

The OpenAPI Specification provides us a complete interactive user interface. The user interface for KEEP can be found here: **<http://localhost:8880>***  and it looks like this:

![Swagger UI]({{ '/assets/images/SwaggerUI.png' | relative_url }})

### References

KEEP Swagger UI: <http://localhost:8880/openapi/index.html>
Swagger UI Homepage: <https://swagger.io/tools/swagger-ui/>


> *You need a KEEP server running to open localhost links_
