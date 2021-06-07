---
layout: default
title: OData
parent: Tutorial
nav_order: 4
---

## OData

Domino KEEP allows exporting of data from Notes databases to [OData](https://www.odata.org) format, which can then be read by applications like Excel for Windows, Salesforce, SAP and Business Intelligence. 
This means that the data in a Notes database can be displayed in something as simple as Excel with just a few clicks.

Go to Excel and create a blank Workbook. Select Data -> Get Data -> From Other Sources -> From ODataFeed.

![FromODataFeed]({{ '/assets/images/FromODataFeed.png' | relative_url }})

Point it to an application on the Domino server. Here, we point to a To-do application.
![serverURL]({{ '/assets/images/serverURL.png' | relative_url }})

Hit OK.
![NotesDatabase]({{ '/assets/images/NotesDatabase.png' | relative_url }})

Select Load to display the Notes data in Excel. The structure of the Notes database is understood.
![NotesDataInExcel]({{ '/assets/images/NotesDataInExcel.png' | relative_url }})

The Excel sheet is a live document. Any update to the Notes database is seen when you select Refresh. 

At the moment, we only support basic authentication.
