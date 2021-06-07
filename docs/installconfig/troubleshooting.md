---
layout: default
title: Troubleshooting
parent: Installing & configuring
nav_order: 10
---

## Troubleshooting common errors with the installing and running the Keep API service

### Address already in use error

You get this error when you run the [sample script](../../references/downloads) with the sample Notes database:

> 2021-01-28 15:39:07 ERROR Launch:707 - Management server failed to launch on 0.0.0.0:8889  
> 2021-01-28 15:39:07 ERROR Launch:258 - Fatal  
> java.net.BindException: Address already in use

**Solution**: Kill the process that's using the jar file. Use the Windows Task Manager, or on a Mac/Linux, do this:

```bash
ps -eaf | grep launch.class
kill -9 [pid number]
```

#### Database is not fully initialized error

You get this error when you go to your Notes client and:

1. Select File menu -> Open menu -> Open HCL Notes Application menu.
2. Select `KeepConfig.nsf` file to open.

The following error is shown:

![KeepConfigDBError]({{ '/assets/images/KeepConfigError.png' | relative_url }}){: .scale-img-fifty-percent }

**Solution**: Delete the `KeepConfig.nsf` from the Notes data directory and restart the [sample script](../../references/downloads). 

> e.g. On Mac, the data directory path is `/Users/[userid]/Library/Application Support/HCL Notes Data/`