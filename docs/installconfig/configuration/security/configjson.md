---
layout: default
title: config.json
parent: Security
grand_parent: Installing & configuring
nav_order: 6
---

## config.json

KEEP reads all config.json from KEEP core and deployed extensions. Here is a sample JSON representation of the resource:

```json
{
  "PORT": 8880,
  "ADMINPORT": 8889,
  "METRICSPORT": 8890,
  "shutdownkey": "The End is near!!",
  "AllowJwtMail": true,
  "versions": {
    "core": {
      "path": "/schema/openapi.core.json",
      "active": true
    },
    "admin": {
      "path": "/schema/openapi.admin.json",
      "active": true
    },
    "quattro": {
      "path": "/schema/openapi.quattro.json",
      "active": true
    }
  },
  "verticles": {
    "Design": {
      "worker": false,
      "className": "com.hcl.domino.keep.verticles.DominoDefaultVerticle",
      "tags": {
        "design": "com.hcl.domino.keep.dbrequests.designcode",
        "code": "com.hcl.domino.keep.dbrequests.designcode"
      },
      "threadPoolName": "codeThreads",
      "active": true
    },
    "Data": {
      "className": "com.hcl.domino.keep.verticles.DominoDefaultVerticle",
      "tags": {
        "data": "com.hcl.domino.keep.dbrequests.data"
      },
      "active": true
    },
    "Identity": {
      "worker": false,
      "className": "com.hcl.domino.keep.verticles.DominoDefaultVerticle",
      "tags": {
        "authentication": "com.hcl.domino.keep.dbrequests.identity"
      },
      "active": true
    },
    "PIM": {
      "worker": true,
      "className": "com.hcl.domino.keep.verticles.DominoDefaultVerticle",
      "tags": {
        "calendar": "com.hcl.domino.keep.dbrequests.pim",
        "settings": "com.hcl.domino.keep.dbrequests.pim",
        "mail": "com.hcl.domino.keep.dbrequests.pim",
        "meta": "com.hcl.domino.keep.dbrequests.pim",
        "contacts": "com.hcl.domino.keep.dbrequests.pim",
        "tasks": "com.hcl.domino.keep.dbrequests.pim"
      },
      "active": true
    },
    "Admin": {
      "worker": false,
      "className": "com.hcl.domino.keep.verticles.DominoDefaultVerticle",
      "tags": {
        "admin": "com.hcl.domino.keep.dbrequests.admin",
        "admin-database": "com.hcl.domino.keep.admin",
        "admin-user": "com.hcl.domino.keep.admin"
      },
      "active": true
    },
    "RestAPI": {
      "className": "com.hcl.domino.keep.verticles.HttpListener",
      "worker": true,
      "threadPoolName": "httpThreads",
      "threadPoolSize": 20,
      "versions": {
        "core": {
          "package": "com.hcl.domino.keep.handlers.core",
          "route": "/api/v1",
          "defaultClass": "com.hcl.domino.keep.handlers.core.DefaultJsonHandler",
          "defaultDatabase": "keepconfig",
          "jsonBodyLimit": 5000000,
          "filesBodyLimit": 10000000
        },
        "admin": {
          "package": "com.hcl.domino.keep.handlers.core",
          "route": "/api/admin-v1",
          "defaultClass": "com.hcl.domino.keep.handlers.core.DefaultJsonHandler",
          "defaultDatabase": "names",
          "jsonBodyLimit": 5000000,
          "filesBodyLimit": 10000000
        },
        "quattro": {
          "package": "com.hcl.domino.keep.handlers.pim",
          "route": "/api/pim-v1",
          "defaultClass": "com.hcl.domino.keep.handlers.pim.DefaultPimHandler",
          "defaultDatabase": "MAIL",
          "jsonBodyLimit": 5000000,
          "filesBodyLimit": 10000000
        }
      },
      "active": true
    },
    "AsyncAgentScheduler": {
      "worker": true,
      "className": "com.hcl.domino.keep.verticles.AgentSchedulerServiceVerticle",
      "tags": {},
      "active": true,
      "threadPoolName": "AgentScheduler",
      "threadPoolSize": 10,
      "agentDefaultMaxDurationSeconds": 3600,
      "logFrequencyMs": 30000
    }
  },
  "vertx": {
    "metric": {}
  },
  "prometheusMetrics": {
    "embeddedServerEndpoint": "/metrics",
    "enabled": true,
    "publishQuantiles": true,
    "startEmbeddedServer": true
  }
}
```

{: .resize-config-json}

### Properties

A current `config.json` has the following top-level properties. These properties are case-sensitive.

| Property          | Type                                           | Description                                                                                                                                                                                                                              |
| :---------------- | :--------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ADMINPORT         | int (0 to 65353)                               | (default 8889) Commands regarding the runtime, e.g. config and shutdown, should only be exposed to an admin network/workstation.                                                                                                         |
| AllowJwtMail      | Boolean                                        | True to allow email to be sent via a JWT token.                                                                                                                                                                                          |
| LOG_DIR           | String                                         | Parameter for the directory in which to write logs.                                                                                                                                                                                      |
| METRICSPORT       | int (0 to 65353)                               | (default 8890) Port for Prometheus metrics                                                                                                                                                                                               |
| PORT              | int (0 to 65353)                               | (default 8880) The port for regular API access.                                                                                                                                                                                          |
| prometheusMetrics | [prometheusParameters](#prometheus-parameters) | Parameters to hand over to the Prometheus task from vert.x.                                                                                                                                                                              |
| shutdownkey       | String                                         | Key to be passed to trigger a server shutdown. This is hashed out in the "/config" endpoint and only accessible by looking at the relevant config files. Note, this may have been overloaded in a config file in the config.d directory. |
| versions          | [versionParameters](#version-parameters)       | List of the OpenAPI definition files to load.                                                                                                                                                                                            |
| verticles         | [verticlesParameters](#restapi-verticle)       | The verticles to load.                                                                                                                                                                                                                   |
| vertx             | [vertxParameters](#vertx-parameters)           | Parameters to hand to the start of vert.x, see [the vert.x documentation](https://vertx.io/docs/apidocs/io/vertx/core/VertxOptions.html) for details.                                                                                    |

### Prometheus Parameters

| Property               | Type    | Description                        |
| :--------------------- | :------ | :--------------------------------- |
| embeddedServerEndpoint | String  | Route path to metrics.             |
| enabled                | Boolean | True to enable metrics collection. |
| publishQuantiles       | Boolean | True to publish Qantiles.          |
| startEmbeddedServer    | Boolean | True to start embedded server.     |

### Version Parameters

Versions has a named list of entries with two parameters:

| Property | Type    | Description                                                                                                                                                                       |
| :------- | :------ | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| path     | String  | Path used by [`getResourceAsStream`](https://docs.oracle.com/javase/8/docs/api/java/lang/Class.html#getResourceAsStream-java.lang.String-) to load an OpenAPI specification file. |
| active   | Boolean | Whether the spec is loaded.                                                                                                                                                       |

The name of the entries must match the name used in versions of the RestAPI verticle (See [below](#restapi-verticle) ).

### Vert.x Parameters

| Property | Type                                     | Description                   |
| :------- | :--------------------------------------- | :---------------------------- |
| metrics  | [metricsParameters](#metrics-parameters) | Parameter for vert.x metrics. |

#### Metrics Parameters

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

### Verticle Parameters

Verticles define a separate unit of work for particular tags. For the RestAPI verticle, see [below](#restapi-verticle). The rest have a standard set of parameters:

| Property       | Type    | Description                                                                                                                                                                                                                                                                                     |
| :------------- | :------ | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| active         | Boolean | Whether this verticle is loaded.                                                                                                                                                                                                                                                                |
| className      | String  | Parameter for the class to use for the verticle. Typically this is `com.hcl.domino.keep.verticles.DominoDefaultVerticle`, unless you need to extend that class.                                                                                                                                 |
| tags           | Object  | Parameter for tags from OpenAPI specs to allocate to this verticle and the package in which to find the NSFHandlers.                                                                                                                                                                            |
| instances      | int     | Relevant only for RestAPI verticle, loads multiple instances that each use a thread pool. You will need to be aware of the number of cores available and scalability, see the [Vert.x documentation](https://vertx.io/docs/vertx-core/java/#_specifying_number_of_verticle_instances)           |
| threadPoolName | String  | If a worker verticle should use a dedicated pool instead of the generic worker thread pool, define a thread pool name. If the same threadPoolName is used by multiple verticles, the thread pool is shared across those verticles.                                                              |
| threads        | int     | Used only for AsyncAgentScheduler, the number of threads to assign to the Worker Executor, see [Vert.x documentation](https://vertx.io/docs/vertx-core/java/#blocking_code).                                                                                                                    |
| worker         | Boolean | To make this a [worker verticle](https://medium.com/@levon_t/java-vert-x-starter-guide-part-2-worker-verticles-c49866df44ab). Worker verticles do not run on the event loop thread but on worker threads from a preconfigured pool of 20 threads. This should be used for heavy-duty verticles. |

The following are types of verticles with additional parameters:

#### AsyncAgentScheduler Verticle

This is the verticle for running async agents - calls to "/run/agent" with "async" set to true in the payload. In a Notes client you can look at KeepAgents.nsf for the asynchronous agents that are running or have run. The properties for this verticle include the [above](#vertical-parameters), plus these two:

| Property                       | Type | Description                                                                                                                                    |
| :----------------------------- | :--- | :--------------------------------------------------------------------------------------------------------------------------------------------- |
| agentDefaultMaxDurationSeconds | int  | Parameter for setting a timeout for asynchronous agents, in seconds. A value of -1 will allow all agents to run to completion without timeout. |
| logFrequencyMs                 | int  | Parameter for the frequency to log messages of running async agents to the console.                                                            |

#### RestAPI Verticle

This is the verticle for managing WebHandlers. "worker", "threadPoolName", "threadPoolSize", "className" and "active" parameters are as for the other verticles. This verticle also has a "versions" parameter. It maps to the top-level "versions" parameter and has the following properties:

| Property        | Type   | Description                                                                                                                                                                                                                                                                                                       |
| :-------------- | :----- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| defaultClass    | String | Parameter for the class to use for the WebHandler if no specific class is defined. `com.hcl.domino.keep.handlers.v1.DefaultJsonHandler` will handle any authenticated endpoint that receives either no body or a body with ContentType as "application/json" and responds with ContentType as "application/json". |
| defaultDatabase | String | Parameter for the KEEP Database to use if there is no query parameter for "db" passed.                                                                                                                                                                                                                            |
| filesBodyLimit  | int    | Parameter for the maximum size of the body if including files.                                                                                                                                                                                                                                                    |
| jsonBodyLimit   | int    | Parameter for the maximum size of the request body as JSON.                                                                                                                                                                                                                                                       |
| package         | String | Parameter for the package in which to find the WebHandlers for this version.                                                                                                                                                                                                                                      |
| route           | String | Parameter for the URL path for all OpenAPI endpoints for this spec.                                                                                                                                                                                                                                               |

### Remarks

#### Named elements vs. arrays

All configuration entries are **named** entries and not arrays since named entries can be merged in the configuration while arrays can only be overwritten.

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

the resulting configuration available to KEEP will be:

```json
    "versions": {
    "v1": {
            "path": "/schema/openapi.v1.json",
            "active": false
        }
    }
```

To summarize, the `v1` will not get loaded. This is the mechanism to disable default components without packing the Jar apart.

#### Overwriting the values

All values can be [over written](https://vertx.io/docs/vertx-config/java/#_overloading_rules) by entries in the `keepconfig.d` directory. The structure needs to be the same as in the default file, but only needs the entries you want to change
