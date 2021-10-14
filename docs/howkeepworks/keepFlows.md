---
layout: default
title: KEEP Flows
parent: How KEEP Works
nav_order: 2
---

## Selected Flows in the KEEP Architecture

To fully understand KEEP, it is helpful to know the main flows, KEEP has three of them:

- KEEP Boot
- Loading of OpenAPI defined routes
- serving requests on the loaded routes

## KEEP Boot

[![Keep Boot](../assets/images/LaunchFlow.png)](../assets/images/plantuml/LaunchFlow.plantuml)

[![DBVerticle](../assets/images/DBVerticleFlow.png)](../assets/images/plantuml/DBVerticleFlow.plantuml)

## Loading of OpenAPI defined routes

[![OpenAPI](../assets/images/HttpLaunchFlow.png)](../assets/images/plantuml/HttpLaunchFlow.plantuml)

## Serving requests on the loaded routes

### Accepting requests on HTTP

Request get put on the EventBus after successful acceptance

[![HTTPRequest](../assets/images/HttpRequestFlow.png)](../assets/images/plantuml/HttpRequestFlow.plantuml)

### Processing requests from EventBus

Actual database communication happens here

[![DBRequest](../assets/images/DBRequestFlow.png)](../assets/images/plantuml/DBRequestFlow.plantuml)

[![DBRequest2](../assets/images/DBRequestFlow2.png)](../assets/images/plantuml/DBRequestFlow2.plantuml)
