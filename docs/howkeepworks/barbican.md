---
layout: default
title: The Barbican
parent: How KEEP Works
nav_order: 4
---
## The Barbican

> _A [barbican](https://en.wikipedia.org/wiki/Barbican) (from Old French: barbacane) is a fortified outpost or gateway, such as an outer defense of a city or castle, or any tower situated over a gate or bridge which was used for defensive purposes._

The Barbican in KEEP decides what a given user can read from or write to a document. The following constraints apply:

- Documents can only be read when they have a `Form` item that is configured in `keepconfig` to allow access.
- Only the fields that are configured can be created, read, or updated.
- _Exception_: If NO fields are configured in keepconfig, all fields on the form can be accessed. As a best practice, define fields to constitute the schema for the document at this mode. A warning is logged to the console, if fields are not set. On write access, this ensures unexpected fields are not submitted.
- An item in a document can be accessed only if there is a matching field on the form or a field configured in `keepconfig`.

![Field Access in Barbican]({{'/assets/images/Barbican-filter.png' | relative_url }})

The Barbican functions as the schema definition for the KEEP API.

### Reading documents

![Reading documents in Barbican]({{ '/assets/images/Barbican-read.png' | relative_url }}){: .scale-img-eighty-percent }

### Updating documents

![Updating documents in Barbican]({{ '/assets/images/Barbican-write.png' | relative_url }}){: .scale-img-eighty-percent }

### Creating documents

![Creating documents in Barbican]({{ '/assets/images/Barbican-create.png' | relative_url }}){: .scale-img-eighty-percent }

### Form Modes
Form Modes are used to manage access to documents. 

Let's take a simple example of the approval workflow, where the requestor submits an expense report for approval to understand this better.

The requestor has read and write access to the subject, body and amount fields of the expense report. She fills in the details and the request when goes to the approver. The approver has different access rights to the different fields of the same form. She only has read access to the subject, body and amount fields but read as well as write access for updating the approval status. Now, let us add an auditor in the same scenario. The auditor has only read access to subject, body, amount and approval status field. She, however, has read and write access to fill in the audit status, which are non-editable for either the requestor or the approver.

This assigning of access to documents to different users, based on their roles, can easily be done using Form Modes. Managing the Form Modes can be done via the Domino KEEP Admin GUI.

### Further readings

Check the pages about the [Admin UI](../../usingkeep/administrationui) and go through the [Tutorials](../../tutorial/index).


