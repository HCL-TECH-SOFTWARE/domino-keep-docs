---
layout: default
title: NSF Handler
parent: Extending KEEP
nav_order: 5
---


## NSF Handler

The CORE database handlers can be found in the package `com.hcl.domino.keep.dbrequests` or in its sub-packages.

Handlers extend the [`AsyncDominoJNX`](https://github01.hclpnp.com/stephan-wissel/keep-documentation/blob/master/testapidocs/com/hcl/domino/keep/dbrequests/AsyncDominoJNXTest.html) (or a subclass) that contains the  required code.

The only function which we can implement is `ProcessMethod`

```Java
@Override
  public void process(final DbRequestParameters<JsonObject> request) throws Exception {
    request.validate();
      // Your code goes here
}
```
### DbRequestParameters
Parameter object that is used to hand over allElements that are needed to execute operations synchronously against a database for a given user.

### Request
DbRequestParameters granting access to session and database.

Inside the function processPayload 2 methods will send the results back to the EventBus with the incoming request:

- With data: `request.emit(resultData)` - can be called multiple times.
- On error `throw new KeepExceptionWrongDataRequest` - can be called only once.

We don't need to call this.onComplete(), this is handled in the abstract class already.

### Cross handler calling

For some of the calls (e.g OData, Inbox, Drafts, All Documents) an existing handler does all the work. Instead of copy and paste we can create an instance of the other handler and pass across the relevant content.

```Java
    final Query dpqr = new Query();
    dpqr.setVertx(this.vertx);
    dpqr.setRequestParams(this.requestParams);
    dpqr.setFormModeName("odata");
    dpqr.setKeepDbInfo(this.getKeepDbInfo());
    final DbRequestParametersBuilderJson builder = new DbRequestParametersBuilderJson();
    final DbRequestParameters<JsonObject> delegate =
        builder.db(request.db).factory(request.factory).client(request.client)
            .incoming(localPayload).session(request.session).validator(json -> true)
            .observer(this.emitterToObserver(this.getSubscriber())).build();
    dpqr.process(delegate);
```

### emit()
emit() is used to return results from the database operationIt can be called zero to N times.













