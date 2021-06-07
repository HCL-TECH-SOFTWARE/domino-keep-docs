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

### Further readings

Check the pages about the [Admin UI](../../usingkeep/administrationui) and go through the [Tutorials](../../tutorial/index).


