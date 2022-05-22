---
layout: default
title: Configuring identity provider
parent: Security
grand_parent: Installing & configuring
nav_order: 4
---

## Configuring identity provider

In its default configuration, KEEP uses Domino as its identity provider (IdP).
This allows you to start evaluating and testing out-of-the-box. To enable this, users need to have an http password configured in Domino, which is good enough for internal use.

However, for an actual deployment, you might want to configure your own IdP and authentication flow. The only IdP requirements are use of a supported algorithm for signing and a token with the expected format.

### Identity providers

KEEP supports identity providers, that can produce JWT access tokens e.g:

- Microsoft Active Directory
- Redhat [Keycloak](https://keycloak.org/)
- Tivoli Federate Identity Manager
- Okta
- Auth0
- [Roll your own](./customIdp)

Check out the [Keycloak](./configuringKeycloak) example configuration
{: .alert .alert-info}

### Example JWT

```bash
eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJUaGUgRGVtbyBXaXp6YXJkIiwic3ViIjoiQ049RG9jdG9yIE5vdGVzL0
89UHJvamVjdEtlZXAiLCJzY29wZXMiOiJNQUlMICREQVRBIiwiaWF0IjoxNjE4NTA2MzM5LCJleHAiOjE2MTg1MDk5MzksI
mF1ZCI6IkRvbWlubyJ9.HJC2MTu8OPT8KnsZnLWqIIc3CoPaEmzQwnygEaRjapk
```

When decoded, this translates to-

```json
{
  "iss": "The Demo Wizzard",
  "sub": "CN=Doctor Notes/O=ProjectKeep",
  "scope": "MAIL $DATA",
  "iat": 1618506339,
  "exp": 1618509939,
  "aud": "Domino"
}
```

- **iss**: "Issuer" - Name of the IdP providing the claim.
- **sub**: "Subject" - The full qualified X500 expanded Notes name, starting with `CN=`.
- **scope**: "Scopes" - Databases and services that the user accesses. See details on [the scopes page](../../../howkeepworks/scopes).
- **iat**: "Issued at" - Epoch time of creation.
- **exp**: "Expiry" - Epoch time of expiration. Must fit into `maxJwtDuration` number of minutes.
- **aud**: "Audience" - **MUST** be `Domino` (case-sensitive).

### Adding your own IdP

You need to create a JSON file in the `keepconfig.d` directory and allow access to the public key from your IdP. The JSON file will look like this:

```json
{
  "disableJwtExpiryCheck": false,
  "jwt": {
    "oidc": {
      "active": true,
      "algorithm": "RS256",
      "keyFile": "10-jwt.pubkey"
    }
  }
}
```

- disableJwtExpiryCheck : Ensure JWT expiration is enforced (default is true).
- jwt: Entry is related to JWT authorization.
- oicd: The name you give your IdP. It could be `Rumpelstielzchen` but needs to be unique on your server.
- active: True/false.
- algorithm: Currently supported: `RS256`.
- keyFile: Path to public key file, either relative to `keepconfig.d`or an absolute path.

KEEP supports more than one IdP, distinguished by the name (`oicd` in the example). The more identity providers you configure, the longer access checking takes, since KEEP checks every provider's key until it finds a match.
