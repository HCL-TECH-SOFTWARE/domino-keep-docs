---
layout: default
title: HTTPS - multi domain
parent: Security
grand_parent: Installing & configuring
nav_order: 11
---

## Configuring nginx as an HTTPS proxy with subdomains

A typical deployment using a proxy looks like this:

![Nginx Proxy]({{ '/assets/images/NginxProxy.png' | relative_url }})

Domino's own http runs on Port 81 and https is handled by the nginx proxy. The proxy also handles the assignment of subdomains to the correct ports. We will use three domains:

- keep.someserver.keep - access to the API
- domino.someserver.keep - access to Domino
- quatto.someserver.keep - access to an application

Alternatively, the proxy can be configured to use a single Domain and [use location routing](./httpsproxy2) to achive the same result.

We start with a Port 80 configuration and then let [CertBot](https://certbot.eff.org/) handle the SSL configuration thereafter.

This example is using [Nginx](https://www.nginx.com/) and [Let's Encrypt](https://letsencrypt.org/).

```bash

server {
 server_name domino.projectkeep.rocks projectkeep.rocks;

 root /usr/share/nginx/html;

        error_page 500 502 503 504 /50x.html;
            location = /50x.html {
        }

 location / {
     proxy_set_header X-Real-IP $remote_addr;
     proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
     proxy_set_header Host $host;
     proxy_pass http://127.0.0.1:81/;
 }


    listen [::]:80;
    listen 80;

}

server {
 server_name keep.projectkeep.rocks;

 root /usr/share/nginx/html;

        error_page 500 502 503 504 /50x.html;
            location = /50x.html {
        }

 location / {
     proxy_set_header X-Real-IP $remote_addr;
     proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
     proxy_set_header Host $host;
     proxy_pass http://127.0.0.1:8880/;
 }


    listen [::]:80;
    listen 80;

}

server {
 server_name jmap.projectkeep.rocks;

 root /usr/share/nginx/html;

        error_page 500 502 503 504 /50x.html;
            location = /50x.html {
        }

 location / {
     proxy_set_header X-Real-IP $remote_addr;
     proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
     proxy_set_header Host $host;
     proxy_pass http://127.0.0.1:3001/;
 }


    listen [::]:80;
    listen 80;

}

server {
        server_name ews.projectkeep.rocks mail.projectkeep.rocks autodiscover.projectkeep.rocks;

        root /usr/share/nginx/html;

        error_page 500 502 503 504 /50x.html;
            location = /50x.html {
        }

 location / {
     proxy_set_header X-Real-IP $remote_addr;
     proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
     proxy_set_header Host $host;
     proxy_pass http://127.0.0.1:3000/;
 }

    listen [::]:80;
    listen 80;

}

```

Once deployed, use [Certbot](https://certbot.eff.org/) to activate SSL. Remember to adjust your host name.

The resulting system layout looks as follows. KEEP can also be installed together with Domino directly on the server (or virtual machine), but the diagram is the same.

![Proxy system diagram]({{ '/assets/images/ProxySetup.png' | relative_url }})

The flow is the same as [single domain flow](./httpsproxy2). The key is the nginx configuration.
