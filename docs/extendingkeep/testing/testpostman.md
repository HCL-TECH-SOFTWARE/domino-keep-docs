---
layout: default
title: Postman Test
parent: Testing
grand_parent: Extending KEEP
nav_order: 3
---

## Postman Test

[Postman](https://www.postman.com) is a tool used for API Testing. Because KEEP doesn't use a GUI, you can't do manual or automated testing.  We can send a request and get a response through the API protocols. Through the response we can verify the status codes to see whether the protocols are working. With the help of Postman we can test the API's.

The KEEP core includes the following APIs:
- Admin-vi
- Ci-cd
- Core-vi
- Pim-v1

Under each API are JSON files. Postman accepts a JSON request and sends the response. In Postman we can create collections, create a request, send a request and get a response. If you have a readymade JSON we can import those files. In github if you access the path you have Collections and Environments. In Collections you have 4 API's. In the API's you have JSON files. You can test the API's under different environments like UAT, testing. The JSON files can be imported in our Postman application. The user can import the JSON files by clicking on the Import button. When you click on Import you can import a file, folder, by fetching the links we can import JSON files. Normally we click on upload file button to get the JSON files.

You can click on import file to download the file to the respective folders. Also you can create a copy of a imported file.The user can replace the imported file also.Files will be stored under respective folders. Under respective folders we will have a set of requests.
Under Postman path there will Collections, Environments and User defined folders as well.
Folders contains API's. API's contains JSON files.
Under manage Environments you will have different fields like Variables, Inital Value and Current Value. 
Under Variable field you will have contents like AdminName, AdminPassword,PIMHOST and HOST.

Then user will declare global variables depending on the request. In GUI's you login to a webpage and start testing like the same way you do the testing in API's based on the HOST.When the user runs the request it will give success and it will show the output.

All the testing part will done in the application HCL Notes.  User creates a request and clicks on Send , the request will be sent and its gives the output. If any error is there it will show the error, if it is success it will show the status as success.


