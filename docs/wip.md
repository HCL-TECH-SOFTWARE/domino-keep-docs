---
layout: default
title: Work in progress
nav_order: 8
description: "Early access means it isn't complete yet"
---

## Work in progress and limitations

Early Access software isn't complete or perfect. This is what we know that you need to watch out for:

- The GUI will be subject to an UX review - we are not happy with it yet
- KEEP does show only one Form/Folder/View per name/alias. If you have duplicates only the first is shown.
- When you rename a design element in Domino Designer, you have to update the KEEP configuration **manually** too .
- Validation rules in Form Access Modes are supported in the API, but not yet exposed in Web Admin GUI.
- Fields from subforms are not displayed in Form Access Modes in the Web Admin GUI.
- In the Web Admin GUI, you can only select fields on the Form for read or write access. However, via the API you can expose arbitrary field names, in the same way you can add fields on-the-fly in LotusScript agents or @Formula. You can pick fields from any form
- Some agents will not run outside Notes Client, e.g. they run on selected entries. Using the **/design/agents** endpoint, you can check the @validForKeep property. In this release, the Web Admin GUI does not exclude or identify those.
- @validForKeep does not look at the code for the existence of NotesUI classes...which will generate an error if the agent is called from outside Notes Client.
- In the KEEP Database Config you can define a **dqlFormula**. This will be applied to further restrict access to running DQL queries. But it is not yet exposed in the Web Admin GUI.
