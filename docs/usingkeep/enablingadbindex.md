---
layout: default
title: Enabling a Database
parent: Using KEEP
nav_order: 1
---

## Enabling a database 

If you have a database that you would like to use with KEEP, you'll need to ensure it is on the same Domino server as KEEP and configure it. Follow the tutorial for instructions on how to do it using [AdminUI](../../tutorial/adminui) or [Postman or curl](../../tutorial/postmancurl).

It is worth noting that all the actions that you can do using the Admin UI can also be done using Postman, curl or any similar tool. 
Below are some examples to perform additional actions for database, people and application management, like adding a database, listing views, agents and forms, listing and adding application and listing and adding person.

A group of API requests is known as a collection. Each collection may have subfolders and multiple requests. Request URL or the endpoint is used to identify the link to where the API will communicate with.

---

> Note: when using the code snippets provided, replace `$Bearer` with actual Bearer value.

---

### Add a database

To add a database, run the following command. Find the applicable Request URL from the OpenAPI Specification document. Provide the body for Post request.

![Adddatabase]({{ '/assets/images/adddatabase.PNG' | relative_url }})

#### Curl code snippet

```
curl --location --request POST 'localhost:8880/api/v1/admin/database' \
--header 'Authorization: Bearer $Bearer' \
--header 'Content-Type: application/json' \
--data-raw '{
    "apiName": "demo",
    "description": "Demo database",
    "filePath": "Demo.nsf",
    "icon": "Base64 stuff, preferably SVG",
    "iconName": "Demo",
    "formulaEngine": "domino",
    "owners": [],
    "isActive": "isActive",
    "excludedViews": [],
    "agents": [],
    "storedProcedures": [],
    "dqlAccess": true,
    "dqlFormula": "@IsMember(@UserNamesList;\"LocalKeepAdmins\")",
    "allowCode": true,
    "openAccess": true,
    "applicationAccessApprovers": [
        "LocalKeepAdmins"
    ]
}'
```

### List available views

To list the views, run the following command. Find the applicable Request URL from the OpenAPI Specification document.Execute. For Get request,body is not needed.

![ListViews]({{ '/assets/images/listviews.PNG' | relative_url }})

#### Curl code snippet

```
curl --location --request GET 'localhost:8880/api/v1/lists?db=demo' \
--header 'Authorization: Bearer $Bearer' \
--header 'Accept: application/json'
```

### Retrieving views

Find the applicable Request URL from the OpenAPI Specification document. Execute. For Get request, body is not needed.

![RetrieveView]({{ '/assets/images/retrieveview.PNG' | relative_url }})

#### Curl code snippet

Please replace `$Bearer` with actual Bearer value.

Please replace `{{name}}` with actual name.

```
curl --location -g --request GET 'localhost:8880/api/v1/lists/{{name}}/default?db=demo' \
--header 'Authorization: Bearer $Bearer' \
--header 'Content-Type: application/json' \
--data-raw ''
```

### List available agents

To list the agents, run the following command. Find the applicable Request URL from the OpenAPI Specification document.Execute. For Get request, body is not needed.

![ListAgents]({{ '/assets/images/listagents.PNG' | relative_url }})

#### Curl code snippet

```
curl --location --request GET 'localhost:8880/api/v1/design/agents?db=demo' \
--header 'Authorization: Bearer $Bearer '
```

### List available forms

To list the forms, run the following command. Find the applicable Request URL from the OpenAPI Specification document.Execute. For Get request, body is not needed.

![ListForms]({{ '/assets/images/ListForms.PNG' | relative_url }})

#### Curl code snippet

```
curl --location --request GET 'localhost:8880/api/v1/design/forms?db=demo' \
--header 'Authorization: Bearer $Bearer '
```

### Creating a document

![Collection]({{ '/assets/images/Collection.PNG' | relative_url }})

Find the applicable Request URL from the OpenAPI Specification document. In Postman, include the request body in JSON format for the POST request.

In the upper right corner there is a send button. Execute it.

![Create document]({{ '/assets/images/CreateDocument.PNG' | relative_url }})

The curl command for the above can be found using the symbol.

![curl symbol]({{ '/assets/images/CreateDocument2.PNG' | relative_url }})

#### Curl code snippet

Please replace `$Bearer` with actual Bearer value.

```
curl --location --request POST 'localhost:8880/api/v1/document?db=demo' \
--header 'Authorization: Bearer $Bearer' \
--header 'Content-Type: application/json' \
--data-raw '{
    "first_name": "George",
    "last_name": "Branthwaite",
    "email": "gbranthwaite0@nba.com",
    "gender": "Male",
    "ip_address": "91.254.204.27",
    "Color": "Red",
    "Pet": "Black-capped chickadee",
    "Form": "Customer"
}'
```

### Retrieving a document

Find the applicable Request URL from the OpenAPI Specification document.Execute.For Get request ,body is not needed.

![RetrieveDoc]({{ '/assets/images/retrievedoc.PNG' | relative_url }})

#### Curl code snippet

Please replace `$Bearer` with actual Bearer value.

Please replace `{{UNID_0}}` with actual UNID. 

```
curl --location -g --request GET 'localhost:8880/api/v1/document/{{UNID_0}}/default?db=demo' \
--header 'Authorization: Bearer $Bearer' \
--header 'Content-Type: application/json' \
--data-raw ''
```

### List available applications

To live the available applications, run the following command. Find the applicable Request URL from the OpenAPI Specification document.Execute. For Get request, body is not needed.

![ListApplications]({{ '/assets/images/ListApplications.PNG' | relative_url }})

#### Curl code snippet

```
curl --location --request GET 'localhost:8880/api/v1/admin/applications/all' \
--header 'Authorization: Bearer $Bearer ' \
--header 'Content-Type: application/json' \
--data-raw '{
	"appName": "My Second Application",
	"databasesRequested": [
		"keepconfig",
		"demo"
		]
}'
```
#### Add an application

To add an application, run the following command. Find the applicable Request URL from the OpenAPI Specification document. Provide the body for Post request.

![AddApplicationPostman]({{ '/assets/images/AddApplicationPostman.PNG' | relative_url }})

##### Curl code snippet

```
curl --location --request POST 'localhost:8880/api/v1/admin/application' \
--header 'Authorization: Bearer $Bearer ' \
--header 'Content-Type: application/json' \
--data-raw '{
	"appName": "My Demo Application",
	"databasesRequested": [
		"demo"
		]
}'
```

### List available people

To list the available people, run the following command. Find the applicable Request URL from the OpenAPI Specification document.Execute. For Get request, body is not needed.

![ListPeople]({{ '/assets/images/ListPeople.PNG' | relative_url }})

#### Curl code snippet

```
curl --location --request GET 'localhost:8880/api/pim-v1/public/people' \
--header 'Authorization: Bearer $Bearer' \
--data-raw ''
```

### Add a person

To add a person, run the following commands. Find the applicable Request URL from the OpenAPI Specification document. Provide the body for Post request.

![AddPersonPostman]({{ '/assets/images/AddPersonPostman.PNG' | relative_url }})

#### Curl code snippet

```
curl --location --request POST 'localhost:8880/api/pim-v1/public/person' \
--header 'Authorization: Bearer $Bearer ' \
--header 'Content-Type: application/json' \
--data-raw '{
    "Form": "Person",
    "Type": "Person",
    "Title": "",
    "FirstName": "Demo",
    "MiddleInitial": "",
    "LastName": "",
    "Suffix": "",
    "CompanyName": "",
    "email_1": "",
    "OfficeCity": "",
    "OfficePhoneNumber": "",
    "PhoneNumber": "",
    "CellPhoneNumber": "",
    "primaryPhoneNumber": "",
    "FullNameInput": "Demo ",
    "AltFullName": "",
    "AltFullNameLanguage": "",
    "InternetAddress": "",
    "FullName": "Demo ",
    "MailAddress": "",
    "ELabel2": "Personal",
    "ELabel3": "Assistant",
    "ELabel4": "Business2",
    "Elabel5": "Personal2"
}'
```

### List available groups

To list the available groups, run the following command. Find the applicable Request URL from the OpenAPI Specification document.Execute. For Get request, body is not needed.

![ListGroups]({{ '/assets/images/ListGroups.PNG' | relative_url }})

#### Curl code snippet

```
curl --location --request GET 'localhost:8880/api/pim-v1/public/groups' \
--header 'Authorization: Bearer $Bearer' \
--data-raw ''
```

### Add a group

To add a group, run the following command. Find the applicable Request URL from the OpenAPI Specification document. Provide the body for Post request.

![AddGroupPostman]({{ '/assets/images/AddGroupPostman.PNG' | relative_url }})

#### Curl code snippet

```
curl --location --request POST 'localhost:8880/api/pim-v1/public/group' \
--header 'Authorization: Bearer $Bearer' \
--header 'Content-Type: application/json' \
--data-raw '{
    "ExcludeFromView":[
      "D",
      "S",
      "A"
    ],
    "PROTECTFROMARCHIVE":1.0,
    "Form":"Group",
    "ListDescription":"Sample Test Group",
    "Confidential":"",
    "Comment":"",
    "ListOwner":"CN=Michael Angelo Silva/OU=Philippines/O=PNPHCL",
    "LocalAdmin":"CN=Michael Angelo Silva/OU=Philippines/O=PNPHCL",
    "AvailableForDirSync":"1",
    "DocumentAccess":"[GroupModifier]",
    "GroupType":"0",
    "ListName":"Test Group",
    "Readers":"",
    "Members":"",
    "Categories":"",
    "Type":"Group",
    "GroupTitle":"0",
    "SavedUpdate":"1"
  }'
```
