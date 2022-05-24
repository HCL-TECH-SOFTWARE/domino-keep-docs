---
layout: default
title: Postman
parent: User Tools
grand_parent: References
nav_order: 2
---

## Postman

### Introduction

Postman is a collaborative platform for designing and building APIs. It contains a number of useful features, including the ability to include a unit test within each API record.

### Installation and configuration

After Postman is up and running, it needs to be configured to run the KEEP APIs. This involves importing two sets of files- Collections and Environments.

#### Collections

**Collections** are groups of API calls, which appear in the left-hand navigation on the "Collections" tab. They can be separated further into folders. The folders used correspond to the tags in our OpenAPI specs.

1. Click the **Import** button in the upper left, followed by **Choose Files**.

2. To access the resources, click [downloads](../../downloads) to view the collections information.

#### Environments

**Environments** are sets of environment variables, which appear in the grey shaded drop-down menu at top right. This allows you to select the current environment to use. Beside the drop-down is an "eye" button to view the current environment and a "cog" button to manage all environments.

1. Click the **Import** button on the upper left, followed by **Choose Files**.

2. To access the resources, click [downloads](../../downloads) to view the environments information.

3. You only need to add variables to the environment, if they need default values.

### Authentication

Nearly all the KEEP APIs fail if your login credentials are not authenticated. Logging with valid authentication is the first step. There are a couple of approaches:

1. Expand **Project KEEP API \ authentication** in the left nav.

2. Select **Admin Login** and open up the Body section. You will see this:

![Auth Example]({{ '/assets/images/AuthExample.png' | relative_url }})

Set the password to **password** and user name to **John Doe** and then click **Send** to be logged in. Another approach is to access through Environment variables **AdminPassword** and **AdminName**.

### Environment Variables

In some of the KEEP APIs, you see fields surrounded by double brackets like **\{\{HOST}}** or **\{\{AdminName}}**. These fields represent user inputs and should generally not be hardcoded. For KEEP, the environment variables are packaged in the relevant environment you imported in.

1. Click the **eyeball icon** to the right of the environment box:

![Postman Env]({{ '/assets/images/PostmanEnv.png' | relative_url }})

This shows the current settings of the environment variables and allows you to create more environment variables. For example, you could set **AdminName** to **John Doe** from here.

### The basics

There are a number of tutorials on the Postman application. This section gives a quick overview of the Postman user interface.

![Postman UI]({{ '/assets/images/PostmanUI.png' | relative_url }})

#### Top Navigation

The black banner at the top of the screen contains product-wide features. In the upper left corner, you'll see **New** for creating new Postman objects and **Import** for importing Postman Collections. The **Runner** button lets you run a series of APIs without having to click on each one individually. In the upper right corner, are Postman's settings under the **wrench icon**.

#### Left Navigation

The left navigation contains a **History** tab that acts much like a browser history. It lists a history of the APIs you have run. The **Collections** tab is where you'll find the KEEP API Collection.

#### Content

The upper half of the main content section contains a description of the **request** you are about to send. It can be edited in place prior to making the request. The bottom half of the screen is reserved for the **response** to your request.

### References

Postman Homepage: <https://www.postman.com/>
Postman Learning Center: <https://learning.postman.com/>
Postman Key Concepts: <https://learning.postman.com/concepts/>
Short Postman Tutorial: <https://www.youtube.com/watch?v=t5n07Ybz7yI>
