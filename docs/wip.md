---
layout: default
title: Work in progress
nav_order: 8
description: "Early access means it isn't complete yet"
---

## Work in progress and limitations

Early Access software isn't complete or perfect. This is what we know that you need to watch out for:

- When saving new documents, you need to check `Compute with form` in the `Default` form mode to ensure data types and Readers/Authors/Names are captured correctly
- KEEP does show only one Form/Folder/View per name/alias. If you have duplicates only the first is shown.
- When you rename a design element in Domino Designer, you have to update the KEEP configuration too .
- DQL does not support new v12 DQL functionality yet.
- Validation rules in Form Access Modes are supported in the API, but not yet exposed in Web Admin GUI.
- Fields from subforms are not displayed in Form Access Modes in the Web Admin GUI.
- In the Web Admin GUI, you can only select fields on the Form for read or write access. However, via the API you can expose arbitrary field names, in the same way you can add fields on-the-fly in LotusScript agents or @Formula.
- **allowAnyField** in the Form Access Mode schema has no impact at this time.
- There is no functionality to change a document's Form name or compute with a different Form.
- Some agents will not run outside Notes Client, e.g. they run on selected entries. Using the **/design/agents** endpoint, you can check the @validForKeep property. In this release, the Web Admin GUI does not exclude or identify those.
-  @validForKeep does not look at the code for the existence of NotesUI classes...which will generate an error if the agent is called from outside Notes Client.
- In the KEEP Database Config you can define a **dqlFormula**. This will be applied to further restrict access to running DQL queries. But it is not yet exposed in the Web Admin GUI.
- In the KEEP Database Config there are **owners**, **applicationAccessApprovers** and **storedProcedures**. They are not exposed in the Web Admin GUI and not actively used in the API at this time.  
  - **owners** is intended to store the business owners for a Keep Database, for reference only. This may be removed in the future.
  - **applicationAccessApprovers** is designed to support an approval process for KEEP Applications. However, considering a KEEP Application can use multiple KEEP Databases, the right approach to approval is not obvious. Should approvals be in parallel? What happens if one approver rejects it? How should multiple approvers for the same KEEP Database be handled? What happens if one approver is on leave? Or do we let customers build that process flow themselves?
  - **storedProcedures**...kind of like agents, but without needing to install / launch Domino Designer.
- KEEP Applications currently default to approved status.
