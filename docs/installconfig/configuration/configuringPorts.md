---
layout: default
title: Configuring ports
parent: Installing & configuring
nav_order: 11
---

## Configuring ports

![Ports in use](../../assets/images/PortUse.png)

KEEP uses four ports which have different purposes and warrant different access/security settings. By dividing KEEP access across more than one port, an administrator can take advantage of access security provided by the operating system and/or firewall.

The ports are specified in `config.json` but can be overwritten using environment variables. See the page on [configuration](./security/configjson) for details.

### Data PORT (8880)

This is the main port used by KEEP to interact with API users. This port should be exposed to all users and be secured by https, either on KEEP or using a proxy. All access to data requires authentication.

### Healthcheck Port (8886)

Healthcheck is to check whether KEEP is up. It's a standard approach for Docker and Kubernetes environments, so any automated tooling that manages your containers can periodically check and automatically take action if the tool (in this case KEEP) is no longer working. It has a single endpoint, "/health" which responds with information about whether all parts of KEEP are responding - the eventbus, main KEEP server, KEEP management server, KEEP metrics server and access to a Domino database. It has separate security, it's own username and password. This follows the same approach as the management server, but it's a completely separate user. None of the users that have access to the rest of KEEP will have access to the healthcheck port, and the healthcheck user will not have access to other areas of KEEP.

### Management Port (8889)

The management port allows access to KEEP runtime behavior, such as current config (`/config`), runtime info (`/info`) or KEEP shutdown/restart. It should **not** be exposed to normal users but only to the administrator network.
A typical configuration is to block access to Port 8889 from anything but `localhost`. An administrator who wants to interact with the management port would use an `ssh` session to access the server and use `curl` to access the management endpoints.

### Port for Prometheus metrics (8890)

KEEP provides metrics in Prometheus format on Port 8890. When you don't collect metrics, block access to this port. When you do collect them, open access to this port to the collecting server(s) only.

### Configure for HTTPS access on Port 443

To make all ports accessible on Port 443, an https proxy server (Ingress on Kubernetes) can be used. This documentation provides two examples:

- [Proxy using multiple sub-domains](./security/httpsproxy)
- [Proxy using URL path access](./security/httpsproxy2)
