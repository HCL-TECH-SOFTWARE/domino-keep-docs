---
layout: default
title: Using Postman and curl
parent: Tutorial
nav_order: 2
---

## Using Postman and curl

This tutorial shows how to configure and use a database using Postman and curl. Download the database `Demo.nsf` from [Resources](../../references/downloads) and follow along. We also have a Postman collection under [Resources](../../references/downloads) to download and used for quick learning. 

### Prepare database access

First, copy the demo database to the server.

Download demo.nsf. Then, use the following command to copy demo.nsf to the server. Replace `$Server` with actual server name. 
 
```
docker cp Demo.nsf $Server:/local/notesdata/Demo.nsf
```

### Login

Provide the user name and password for login.

![Login]({{ '/assets/images/PostmanLogin.PNG' | relative_url }})

#### Curl code snippet

Replace `$password` with actual password value and `$username` with actual user name value. 

```
curl --location --request POST 'localhost:8880/api/v1/auth' \
--header 'Content-Type: application/json' \
--data-raw '{
"password" : $password,	
 "username" : $username
}'
```

### List available databases

Use the following command to list all the databases: 

![AllDatabases]({{ '/assets/images/AllDatabasesPostman.PNG' | relative_url }})

#### Curl code snippet

Replace `$Bearer` with the actual Bearer value.

```
curl --location --request GET 'localhost:8880/api/v1/admin/nsf' \
--header 'Authorization: Bearer $Bearer'
```

### Verify the views and forms for the demo database

Use the following commands to check the views and forms in the database.

![PostmanViews]({{ '/assets/images/PostmanViews.PNG' | relative_url }})

#### Curl code snippet

Please replace `$Bearer` with actual Bearer value.

```
curl --location --request GET 'localhost:8880/api/v1/lists?db=demo' \
--header 'Authorization: Bearer $Bearer' \
--header 'Accept: application/json'
```

![PostmanForms]({{ '/assets/images/PostmanForms.PNG' | relative_url }})

#### Curl code snippet

Please replace `$Bearer` with actual Bearer value.

```
curl --location --request GET 'localhost:8880/api/v1/design/forms?db=demo' \
--header 'Authorization: Bearer $Bearer'
```

### Create document
 
Use the following command to provide the body for the create document POST request.

![CreateDocument]({{ '/assets/images/CreateDocument.PNG' | relative_url }})

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

### Retrieve document

Use the following command to retrieve a document.

![RetrieveDocument]({{ '/assets/images/retrievedoc.PNG' | relative_url }})

#### Curl code snippet

Please replace `$Bearer` with actual Bearer value.Also replace `{{UNID_0}}` with actual unid.

```
curl --location -g --request GET 'localhost:8880/api/v1/document/{{UNID_0}}/default?db=demo' \
--header 'Authorization: Bearer $Bearer' \
--header 'Content-Type: application/json' \
--data-raw ''
```

### Delete document

Use the following command to delete a document.

![DeleteDocument]({{ '/assets/images/Deletedoc.PNG' | relative_url }})

#### Curl code snippet

Please replace `$Bearer` with actual Bearer value.Also replace `{{UNID_0}}` with actual unid.

```
curl --location -g --request DELETE 'localhost:8880/api/v1/document/{{UNID_0}}/default?db=demo' \
--header 'Authorization: Bearer $Bearer' \
--header 'Content-Type: application/json' \
--data-raw ''
```

### Verify that the document is deleted 

To verify that the document is deleted, try retrieving it again. Retrieve should fail.

![DocumentRetrieve]({{ '/assets/images/DocumentRetrieve.PNG' | relative_url }})

### Logout

Use the following command to log out.

![Logout]({{ '/assets/images/Logout.PNG' | relative_url }})

#### Curl code snippet

Please replace `$Bearer` with actual Bearer value.

```
curl --location --request POST 'localhost:8880/api/v1/auth/logout' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer $Bearer' \
--data-raw '{"Logout" : "Yea"}'
```

### Shutdown

Finally, use the following command to shut down. Provide the body for the POST request.

![Shutdown]({{ '/assets/images/Shutdown.PNG' | relative_url }})

#### Curl code snippet

Please replace `$Bearer` with actual Bearer value.

```
curl --location --request POST 'http://127.0.0.1:8889/shutdown' \
--header 'Authorization: Bearer $Bearer' \
--header 'Content-Type: application/json' \
--data-raw '{
	"shutdownkey" : "The End is near!!",
	"StopServer" : true
    }'
```
