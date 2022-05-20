---
layout: default
title: Troubleshooting
parent: Installing & configuring
nav_order: 40
---

## Troubleshooting common errors with the installing and running the KEEP API service

### Domino Not Running (First-Time Setup)

If Domino is not up and running, follow the steps for [Troubleshooting one-touch Domino Setup](https://help.hcltechsw.com/domino/12.0.0/admin/inst_onetouch_troubleshooting.html).

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

### Database is not fully initialized error

You get this error when you go to your Notes client and:

1. Select File menu -> Open menu -> Open HCL Notes Application menu.
2. Select `KeepConfig.nsf` file to open.

The following error is shown:

![KeepConfigDBError]({{ '/assets/images/KeepConfigError.png' | relative_url }}){: .scale-img-fifty-percent }

**Solution**: Delete the `KeepConfig.nsf` from the Notes data directory and restart the [sample script](../../references/downloads).

> e.g. On Mac, the data directory path is `/Users/[userid]/Library/Application Support/HCL Notes Data/`

### User ID and password being requested repeatedly when using Notes for KEEP testing

Sometimes on the initial starting up of KEEP or creation of KeepConfig and KeepAgents databases, or doing things like creating a folder in mail database, you can get prompted for user ID and password repeatedly. This happens if the "Don't prompt for a password" checkbox under User Security is unchecked or if it gets reset based on the organisation's policy.

To fix this, stop your KEEP debugging session, go into Notes, go to the Notes setting under File -> Security -> User Security -> enable "Don't prompt for a password from other Notes-based programs (reduces security)", exit Notes and restart your KEEP debugging session.

This setting can get reset each time you start Notes depending upon your organization's Policy, in which case, you'll need to enable it again.
