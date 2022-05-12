---
layout: default
title: Use cases
parent: HCL Domino KEEP
nav_order: 3
---

# Use cases

Domino REST APIs make the data in Notes databases available in a way that it can be used by any application, server, or middleware that speaks http(s). Let's take a look at a few examples.

## Web applications

An engineering company stores the security data sheets of their products in a Notes database. These sheets contain information about the hazards of the products and the necessary safety precautions to take. Using KEEP APIs, all of this information can be made available on a web application, allowing someone who does not have access to a Notes client to view the security data sheets on the web.

A third-party is building a vacancies website for a Domino customer. The website needs access to job details from your Domino database and will post applications for the jobs to the Domino application. However, the Domino application holds more information than the third-party needs to interact with and the application goes on a workflow subsequently. So, applications must only be submitted at the right status and data must be properly validated, else the Notes Client part will break. Using KEEP APIs, the Domino customer can manage all of this without needing skills in Java or JavaScript.

## Mobile applications

A software consultancy firm uses a Notes application for travel approval. The workflow requires the consultants to raise travel requests in the system, which are then approved by the managers. Without KEEP, the approving manager needs a computer with a Notes client installed on it to take action on the request. KEEP APIs allow you to build mobile applications that allow the managers to process the requests on their mobile devices. The KEEP APIs grant access to managers to approve, reject, or comment on requests.

## Integration with other apps

An organization maintains their presentation decks in a Notes application. The customer sales representatives use these presentations when meeting with customers. Without KEEP the representatives switch between the Notes application and Salesforce when preparing for the presentation. With the KEEP APIs, data from the Notes application can be integrated into Salesforce. Then, sales representatives have a single view of sales-related data in Salesforce and presentation decks in Domino, saving them time and making them more productive.

## Integration with third-party companies

An organization processes applicants for various third-party companies. They may have different levels of experience and provide data with varying levels of data quality. With KEEP APIs, the organization can allow REST API access for the third-party companies, confident that data verification or data fixup will not delay processing of the applicants.
