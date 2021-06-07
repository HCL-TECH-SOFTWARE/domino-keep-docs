---
layout: default
title: OpenAPI
parent: Extending KEEP
nav_order: 2
---

## OpenAPI

Much of the programming is driven by the OpenAPI specification. This is why you should always include the latest OpenAPI specification in  `src\main\resources`.

### What do ee mean?
`Launch.start` looks at the `config.json` file, gets the `versions` object and loads the corresponding OpenAPI specs into memory with `Launch.loadKeepApiInfo()`. 

- `io.vertx.ext.web.api.contract.openapi3.OpenAPI3RouterFactory` introspects the OpenAPI specs.
- It automatically creates routes based on what is there in the OpenAPIs.
- It is set to require security handlers matching spec.
- The HttpListener verticle's `listenerStart()` method loads handlers*  in com.hcl.domino.keep.handlers package, _sending messages_ to     "keep.request." + operationId (e.g "keep.request.createlocaluser").
- `DominoDefaultVerticle` verticle instances load corresponding dbrequest handlers* in com.hcl.domino.keep.dbrequests package _consuming    messages_ for "keep.request." + operationId (e.g. "keep.request.createlocaluser").
- The OpenAPI3RouterFactory automatically:
    - validates that only valid HTTP methods are used.
    - validates HTTP request content-type.
    - validates HTTP request content matches contract (throwing Bad Request, HTTP 400).

 * All verticles are loaded based on config in `config.json`.  
 - HttpListener loads handlers for each version by introspecting the RestAPI object in the config.json, which identifies the URL route     to apply for each version and where to find the handler. The config defines the prefix and postfix, so in this case they are always    "Web" + operationId (first letter upper-cased) + "Handler". If not found, and the content-type for request body and response body     are both "application/json", a default class defined for that version in the config is used, in our case always          `com.hcl.domino.keep.handlers.DefaultJsonHandler`. If the request body or response body are not "application/json" a custom handler     will need adding.-`DominoDefaultVerticle` instances loads handlers using config.json's prefix + operationId (first letter upper-       cased) + postfix, based on the tag in the OpenAPI spec. E.g. for an "admin" tagged OpenAPI endpoint, they're loaded only by an         instance of DominoDefaultVerticle, loading a handler for "Admin" + operationId (first letter upper-cased) + "Task", using a class in   the com.hcl.domino.keep.dbrequests package. Consequently tags need to be unique across all OpenAPI specs.

### Path params, query params and body content
- AbstractAPIHandler extracts bearer token from Authorization header and "db" query parameter in `addStandardParamsFromRequestHeaders()` and `addStandardRequestParamsFromRequestQueryParams()`
- It adds in the operation id from the OpenAPI spec in `addStandardRequestHeaders()`
- `DefaultJsonHandler.processPayload()` calls `payloadFromAllParams()` to merge in content from Vert.x's RoutingContext's parsed           parameters - cookies, headers, query parameters, path parameters and form. The body is also adding in as "payload".
- A handler's `processPayload()` may subsequently manipulate the payload prior to routing onto the Event Bus.

### What is validated where?
The router validates:
- An invalid endpoint throws a 404 error.
- An endpoint with a missing handler.
The security handlers manage authorization:
- A missing Authorization header, when required, immediately throws a 401 error.
- For endpoints requiring "jwt" authentication, the JWT token is checked against the expired tokens or logged out users, throwing a 401   error.
- An invalid Authorization header, when required, throwing a 401 error.
The OpenAPI router also validates against the spec:
- Invalid methods (GET on a POST endpoint) throw a 405 error.
- Body that is not valid JSON or missing throws a 400 error with the message "$: string found, object expected".
- Based on the RequestOptionFlags defined for the relevant handler, an ill-formed Authorization header and/or "db" query parameter are     validated by `AbstractAPIHandler` before even parsing the RoutingContext parameters. An HTTP 400 error is thrown.
- If nothing has been configured yet to consume messages for "keep.request. + operationId, the handler's `listenForResponse()` method     throws a 500 response.
- The `processPayload` method of handlers that consume messages (in `com.hc.domino.keep.dbrequests` package) may apply additional         validation.
- Anything extending `AsyncDominoJNXDesignRequest` validates that the user has at least Designer access to the relevant database.
- Anything extending `AsyncDominoJNXFormModeRequest` validates the database, form and (if required) mode have been configured for KEEP access.
- Anything extending `AsyncDominoJNXUserRequest` checks whether the user exists, throwing an error accordingly.
- Other handlers may do additional validation (e.g. checking for name collisions when name changes occur). 

