---
layout: default
title: Development Environment
parent: Extending KEEP
nav_order: 1
has_children: true
---

## Development Environment

### Introduction

This section describes the steps you will need to take, and the tools you will need to install, to setup a basic KEEP development environment.  The steps listed here should be done in this order, as each step generally depends on the step before it.

1. **[Setup HCL Notes](setupnotes.md):** Install Notes and connect it to your Mail server.

2. **[Setup Java 8](setupjava.md):** Install the OpenJDK version of Java 8 and configure it to run KEEP builds. (Java 8, not 7-- or 9++)

3. **[Setup Git](setupsrc.md):** Download the KEEP source code from Git. Pro Tip: Use a [GUI](https://www.sourcetreeapp.com/)

4. **[Setup Eclipse](eclipse.md)** (optional) You can use any IDE you fancy.

5. **[Run a Maven Build](runbuild.md):** Set up a Maven build environment, so that you can build the KEEP source code.

6. **[Run KEEP](runkeep.md):** Set up and configure the KEEP runtime environment, so that you can run the KEEP APIs on your local machine.

7. **[Run KEEP with Docker](testdata.md):** Set up a Docker based KEEP development environment.

8. **[Test Data for Docker KEEP](testdata.md):** Set up test users and test data to use with your KEEP Docker image.

9. **[Admin User Interface Training](adminui.md):** Learn to write code for the Admin User Interface.

### Dependency checks

- Execute `mvn versions:display-dependency-updates` to check for updated dependencies
- Execute `mvn versions:display-plugin-updates` to check for newer plugins


### Produce UML from PlantUML text files

Maven is setup to (manually) generate [PlantUML](https://plantuml.com/) diagrams for use in Maven sites. Unfortunately the plugin uses Java11, while KEEP is stuck on Domino's Java8 so some manual steps are involved:

- Source directory: `src/main/plantuml` all files `*.txt`
- Target directory: `src/site/resourc/assets/images/uml` (so they can be used in site)
- Temporarily witch to Java11
- Execute `mvn com.github.funthomas424242:plantuml-maven-plugin:generate`
- Execute `mvn site` to incorporate new images in site

### Switching to Java11 on macOS

macOS allows multiple Java instances being installed, to switch you can repoint `JAVA_HOME`. When done in terminal the change only lasts for that terminal session.

- Show Java versions available: `/usr/libexec/java_home -V`
- Switch a version: `export JAVA_HOME=````/usr/libexec/java_home -v 11.0.4``` (Pick one of the previous displayed)