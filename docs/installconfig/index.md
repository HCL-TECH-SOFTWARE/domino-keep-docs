---
layout: default
title: Installing & configuring
nav_order: 3
has_children: true
---

## Installation

---

> **NOTE**: The Early Access June release contains only a [Docker image](installation/docker). The installer described here is planned for a later code drop.

---

After [downloading {{ site.version}} ]({{ site.flexnet_url }}), KEEP can be installed on:

- Notes Client on [macOS](installation/mac)
- Notes Client on [Windows](installation/win)
- Domino Server on [Windows](installation/win)
- Domino Server on [Linux](installation/linux)
- Domino Server on [Docker or Kubernetes](installation/docker)

All platforms use a Java-based installer except the Docker which uses a Docker image. The installer and Docker image can be downloaded from your Flexnet account. Speak to your HCL seller to gain access if not sure.

The installer requires a series of parameters. Details are explained on the operating system pages.

```bash
Usage: keepinstaller [-ahv] -d=<dataDir> -i=<notesIni> -k=<keepDir> -p=<programDir>
Installs Domino KEEP on a Windows/Linux server or Windows/macOS client
  -a, --accept              Automatically accept terms & ccoditions.
  -d, --dataDir=<dataDir>   Directory of your HCL Notes or Domino data.
  -h, --help                Show this help message and exit.
  -i, --ini=<notesIni>      HCL Notes/Domino notes.ini file.
  -k, --keepDir=<keepDir>   Directory for the KEEP binary installation.
  -p, --programDir=<programDir>
                            Directory where HCL Notes or Domino is installed.
  -v, --version             Print version information and exit.
```

## Hosting your static application

A typical use case for KEEP is to build a web UI with the flavor of the day web development framework like Angular, ReactJS, Swelte etc. These frameworks usually generate a `build` directory with a set of static files.

You can copy that directory to `keepweb.d` in your Domino data directory and KEEP will serve them on the `/keepweb/` URL path. This eliminates the need for [CORS](../usingkeep/keepapplications) configuration.

## Configuration & Security

KEEP is preconfigured with settings that allow you to get started right away. However, you should familiarize yourself with all [configuration parameters](../installconfig/configuration/parameters) and [security](../installconfig/configuration/security/index) settings before you deploy into a production environment.

### Understanding configuration

The configuration follows the concept of [an Overlay File System](https://www.datalight.com/blog/2016/01/27/explaining-overlayfs-%E2%80%93-what-it-does-and-how-it-works/). The base configuration is retrieved from the installation directory or `jar` file. Then, it is overlayed with any JSON files in the `keepconfig.d` directory within the Notes data directory and then finally, with any environment parameters.

### Hierarchy

![The call hierarchy](../assets/images/ActualConfiguration.png)

All files contribute JSON, which are overlayed on top of each other. JSON elements with the same name get overwritten. Arrays are replaced and not overwritten.

The JSON files in `keepconfig.d` are processed in alphabetical order. Last entry wins. This processing order allows you, for example, to disable elements temporarily through settings in a `z-final-words.json` file without impacting the permanent configuration.

For more information, see [the vert.x overloading rules](https://vertx.io/docs/vertx-config/java/#_overloading_rules).

### Example

Given the files `config.json`, `a.json`, and the environment variable `PORT=8564` you get the result `result.json` as shown below:

#### config.json

```json
{
   “PORT” : 8880,
   “AllowJwtMail” : true,
  “versions” : {
      “core” : {
          “path” : “/schema/openapi.core.json”,
          “active” : true
      }
   }
}
```

#### a.json

```json
{
  “dance” : “tango”,
  “PORT” : 1234,
  “versions” : {
      “core” : {
          “active” : false
      },
      “special” : {
         “path” : “/schema/openapi.special.json”,
         “active” : true
      }
   }
}
```

Merge these 2 files, apply the environment varbles

#### result.json

```json
{
  “PORT” : 8564,
  “AllowJwtMail” : true,
  “dance” : “tango”,
  “versions” : {
      “core” : {
          “path” : “/schema/openapi.core.json”,
          “active” : false
      },
      “special” : {
         “path” : “/schema/openapi.special.json”,
         “active” : true
      }
   }
}
```

The actual result can be inspected on the KEEP management API, like [on a local install](http://localhost:8889/config).

### Important Notes

> JSON overlay doesn't allow you to **remove** JSON elements, so most settings have an `active` parameter that
> can be set false in an overlay.
