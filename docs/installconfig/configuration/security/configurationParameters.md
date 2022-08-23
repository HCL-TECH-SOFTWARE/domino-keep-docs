---
layout: default
title: Configuration parameters
parent: Security
grand_parent: Installing & configuring
nav_order: 2
---

## Configuration parameters

### Configuration

Project KEEP comes with reasonable default configuration settings. They allow you to start evaluating and testing out-of-the-box. For an actual deployment, you want to understand the details as outlined here.

### Understanding configuration

The configuration follows the concept of and Overlay File System, where the base configuration is retrieved from the jar file and then overlaid with all the JSON files (if present) in the keepconfig.d directory within the Notes data directory and finally, the environment parameters, if any of those exist.

### Environment

Parameters are case sensitive

| Parameter            | Description                                                                      |
| :------------------- | :------------------------------------------------------------------------------- |
| PORT : 8880          | HTTP(S) port for the KEEP service.                                               |
| ADMINPORT : 8889     | HTTP Port for the Admin listener. It should not be reachable from outside.       |
| METRICSPORT: 8890    | Endpoint for Prometheus Metrics.                                                 |
| GodeMode: true/false | Should local users in KeepConfig be recognized.                                  |
| JwtDuration          | Lifetime in minutes for the internal JWT provider. Default value is 60mins.      |
| JwtMaxDuration       | Maximum lifetime in minutes that the JWT tokens get accepted.                    |
| DEBUG: true/false    | Debug mode. Creates more console output.                                         |
| PEMCert              | if your TLS is PEM format (e.g. LetsEncrypt), the path to the certificate file.  |
| TLSFile              | TLS file with key for jks, pem or pfx.                                           |
| TLSPassword          | password for jks and pfx key file.                                               |
| shutdownkey          | passphrase for posting to http://localhost:adminport/shutdown to shut down KEEP. |

### Configuration retrieval

The current configuration can be retrieved (with sensitive information masked) on the management port:
e.g. https://keep.yourserver.io:8889/config.
