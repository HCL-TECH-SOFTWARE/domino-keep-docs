---
layout: default
title: Parameters
parent: Installing & configuring
nav_order: 20
---

## Parameters

The configuration is assembled from JSON files and a few selected environment parameters. We provide environment parameters because they are a popular way to configure instances in virtual environments such as Docker, IBM Cloud, and Kubernetes.

Parameters are **case sensitive**

### Environment

- PORT : 8880 - HTTP(S) port for the KEEP service.
- ADMINPORT : 8889 - HTTP port for the Admin listener. Should not be reachable from outside.
- METRICSPORT: 8890 - Endpoint for [Prometheus](https://prometheus.io/) metrics.
- JwtDuration: Lifetime in minutes for the internal JWT provider - default 60min.
- JwtMaxDuration: Maximum lifetime in minutes JWT tokens get accepted.
- DEBUG: true/false Debug mode. Creates more console output.
- PEMCert: If your TLS is PEM format (e.g. LetsEncrypt), path to certificate file.
- TLSFile: TLS file with key for jks, pem or pfx.
- TLSPassword: Password for jks and pfx key file.

### Parameters in JSON files

A configuration can have the following top-level properties. These properties are case-sensitive.

| Property          | Type                                           | Description                                                                                                                                                                                                                              |
| :---------------- | :--------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ADMINPORT         | int (0 to 65353)                               | (default 8889) Commands regarding the runtime, e.g. config and shutdown. Should only be exposed to an admin network/workstation.                                                                                                         |
| AllowJwtMail      | Boolean                                        | true to allow email to be sent via a JWT token.                                                                                                                                                                                          |                                                                                                                                         |
| METRICSPORT       | int (0 to 65353)                               | (default 8890) Port for Prometheus metrics.                                                                                                                                                                                              |
| PORT              | int (0 to 65353)                               | (default 8880) Port for regular API access.                                                                                                                                                                                              |
| prometheusMetrics | [prometheusParameters](#prometheus-parameters) | Parameters to hand over to the prometheus task from vert.x.                                                                                                                                                                              |
| shutdownkey       | String                                         | Key to be passed to trigger a server shutdown. This is hashed out in the "/config" endpoint and only accessible by looking at the relevant config files. Note, this may have been overloaded in a config file in the config.d directory. |
| versions          | [versionParameters](#version-parameters)       | List of the OpenAPI definition files to load.                                                                                                                                                                                            |
| verticles         | [verticlesParameters](#restapi-verticle)       | Verticles to load.                                                                                                                                                                                                                       |
| vertx             | [vertxParameters](#vertx-parameters)           | Parameters to hand to the start of vert.x, see [the vert.x documentation](https://vertx.io/docs/apidocs/io/vertx/core/VertxOptions.html) for details.                                                                                    |

### Prometheus Parameters

| Property               | Type    | Description                        |
| :--------------------- | :------ | :--------------------------------- |
| embeddedServerEndpoint | String  | Route path to metrics.             |
| enabled                | Boolean | true to enable metrics collection. |
| publishQuantiles       | Boolean | true to publish Qantiles.          |
| startEmbeddedServer    | Boolean | true to start embedded server.     |

### Version parameters

Versions has a named list of entries with two parameters:

| Property | Type    | Description                                                                                                                                                                      |
| :------- | :------ | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| path     | String  | Path used by [`getResourceAsStream`](https://docs.oracle.com/javase/8/docs/api/java/lang/Class.html#getResourceAsStream-java.lang.String-) to load an OpenAPI specification file |
| active   | Boolean | Whether the spec is loaded.                                                                                                                                                      |

The name of the entries must match the name used in versions of the RestAPI verticle (See [below](#restapi-verticle) ).

### Vert.x parameters

| Property | Type                                     | Description                  |
| :------- | :--------------------------------------- | :--------------------------- |
| metric   | [metricsParameters](#metrics-parameters) | Parameter for vert.x metrics |

#### Metrics parameters

Here is a JSON representation of the resource:

```json
{
  "disabledMetricsCategories": [],
  "enabled": true,
  "jvmMetricsEnabled": true,
  "labels": ["HTTP_METHOD", "HTTP_CODE", "EB_SIDE", "POOL_TYPE"],
  "labelMatches": [],
  "registryName": "default"
}
```

| Property                  | Type             | Description                                                                                                                                                                                   |
| :------------------------ | :--------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| disabledMetricsCategories | Array of Strings | Specified in the [MetricsDomain Java class](https://github.com/vert-x3/vertx-micrometer-metrics/blob/master/src/main/java/io/vertx/micrometer/MetricsDomain.java), e.g. "vertx.http.server.". |
| enabled                   | Boolean          | Whether metrics are enabled on the Vert.x instance.                                                                                                                                           |
| jvmMetricsEnabled         | Boolean          | Whether JVM metrics are collected.                                                                                                                                                            |
| labels                    | Array of Strings | List of labels to enable / disable.                                                                                                                                                           |
| labelMatches              | Array of Match   | List of rules for label matching.                                                                                                                                                             |
| registryName              | String           | Name for the metrics registry, so that a new registry is created and associated with this name. Leave blank for default.                                                                      |

### Verticle parameters

Verticles defines a separate unit of work for particular tags. For the RestAPI verticle, see [below](#restapi-verticle). The rest have a standard set of parameters:

| Property       | Type    | Description                                                                                                                                                                                                                                                                      |
| :------------- | :------ | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| active         | Boolean | Whether to load this verticle.                                                                                                                                                                                                                                                   |
| className      | String  | Class to use for the verticle. Typically this is `com.hcl.domino.keep.verticles.DominoDefaultVerticle`, unless you need to extend that class.                                                                                                                                    |
| tags           | Object  | Tags from OpenAPI specs to allocate to this verticle and the package in which to find the NSFHandlers.                                                                                                                                                                           |
| threadPoolName | String  | If a worker verticle should use a dedicated pool, a required thread pool name. By default it is assigned 10 threads, but this can be overritten with threadPoolSize. If the same threadPoolName is used by multiple verticles, the thread pool is shared across those verticles. |
| threadPoolSize | int     | This will only be used for worker threads with a specific threadPoolName. The default is 10, but this can be overritten.                                                                                                                                                         |
| worker         | Boolean | To make this a [worker verticle](https://medium.com/@levon_t/java-vert-x-starter-guide-part-2-worker-verticles-c49866df44ab). Worker verticles do not run on the event loop thread, but on worker threads from a preconfigured pool of 20 threads. Use for heavy-duty verticles. |

The following are types of verticles with additional parameters:

#### AsyncAgentScheduler verticle

This is the verticle for running async agents - calls to "/run/agent" with "async" set to true in the payload. In the Notes client you can look at KeepAgents.nsf for the asynchronous agents that are running or have run. This properties for this verticle include the [above](#vertical-parameters), plus these:

| Property                       | Type | Description                                                                                                        |
| :----------------------------- | :--- | :----------------------------------------------------------------------------------------------------------------- |
| agentDefaultMaxDurationSeconds | int  | Timeout for asynchronous agents, in seconds. A value of -1 allows all agents to run to completion without timeout. |
| logFrequencyMs                 | int  | Frequency to log messages of running async agents to the console.                                                  |

#### RestAPI verticle

This is the verticle for managing WebHandlers. "worker", "threadPoolName", "threadPoolSize", "className" and "active" parameters are as for the other verticles. This verticle also has a "versions" parameter. This maps to the top-level "versions" parameter and has the following properties:

| Property        | Type   | Description                                                                                                                                                                                                                                                                        |
| :-------------- | :----- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| defaultClass    | String | Class to use for the WebHandler if no class is defined. `com.hcl.domino.keep.handlers.v1.DefaultJsonHandler` handles any authenticated endpoint that receives either no body or a body with ContentType as "application/json" and responds with ContentType as "application/json". |
| defaultDatabase | String | KEEP Database to use if there is no query parameter for "db" passed.                                                                                                                                                                                                               |
| filesBodyLimit  | int    | Maximum size of the body if including files.                                                                                                                                                                                                                                       |
| jsonBodyLimit   | int    | Maximum size of the request body as JSON.                                                                                                                                                                                                                                          |
| package         | String | Package in which to find the WebHandlers for this version.                                                                                                                                                                                                                         |
| route           | String | URL path for all OpenAPI endpoints for this spec.                                                                                                                                                                                                                                  |

### Remarks

#### Named elements vs. arrays

All configuration entries are **named** entries and not arrays, since named entries can be merged in the configuration while arrays can only be overwritten.

#### Deactivation of entries

The `config.json` in the Jar has the entry:

```json
    "versions": {
    "v1": {
            "path": "/schema/openapi.v1.json",
            "active": true
        }
    }
```

When you supply your own `some.json` in the `config.d` directory:

```json
    "versions": {
    "v1": {
            "active": false
        }
    }
```

the resulting configuration available to KEEP is:

```json
    "versions": {
    "v1": {
            "path": "/schema/openapi.v1.json",
            "active": false
        }
    }
```

In summary, the `v1` is not loaded This is the mechanism to disable default components without packing the Jar apart.

#### Overwriting the values

All values can be [over written](https://vertx.io/docs/vertx-config/java/#_overloading_rules) by entries in the `keepconfig.d` directory. The structure needs to be the same as in the default file, but only needs the entries you want to change
