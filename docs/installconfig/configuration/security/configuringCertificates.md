---
layout: default
title: Configuring certificates
parent: Security
grand_parent: Installing & configuring
nav_order: 3
---

## Configuring certificates / key pairs

KEEP uses certificates for up to three purposes:

- Signing JWT Tokens when you use KEEP's login API - 0..1 certificate
- Validating JWT Tokens issued by trusted Identity Providers (IdP) - 0..n certificates
- Securing HTTPs traffic - 0..1 certificate

### Obtaining certificates

For HTTPs traffic we support jks, pem and pfx format for the certificate. For the public/private key pairs, we support RSA and EC. HTTPs certificates need to be accepted by your browser and http tool, so you want to get valid certificates using one of the following approaches:

- Use [Let's Encrypt](https://letsencrypt.org/) with either Domino's cert manager or a proxy (e.g. nginx).
- Ask your infrastructure or networking team (if you have one) for valid certificates.
- Wanting the first two options, create your [own certificates using OpenSSL](https://gist.github.com/fntlnz/cf14feb5a46b2eda428e000157447309). You need to distribute the custom root CA to your users (Let's Encrypt preferred).
- For public/private key generation (used for JWT), use the KEEP management API/UI and let it generate a public/private key file pair and a certificate.

### Configuring a certificate for issuing a JWT

Add the following JSON to a file in `keepconfig.d` (extension must be `.json`):

```json
{
  "JwtUsePubPrivKey": true,
  "JwtUsePemFile": true,
  "JwtIssuer": "The issuer",
  "JwtPrivateKeyFile": "keepconfig.d/private.key.pem",
  "JwtPublicKeyFile": "keepconfig.d/public.key.pem",
  "JwtCertFile": "keepconfig.d/cert.pem",
  "JwtAlgorithm": "RSA"
}
```

**Note:** Such a file is automatically created for you when you use the KEEP management API (Port 8889) to create the files.
{: .alert .alert-danger}

### Configuring certificates for JWT validation

We support PEM formatted keys (RSA/EC). Obtain the public key from your IdP provider and add it to a location that general users can't write to. Add a json file to `keepconfig.d`:

```json
{
    "jwt":
    {
        "oicd":
        {
            "active": true,
            "algorithm": "RS256",
            "keyFile" : "10-jwt.pubkey"
        }
    }

```

### Configuring a certificate for https

The following entry configures TLS (jks, pem, pfx):

```json
{
  "TLSFile": "path.to.file",
  "TLSPassword": "password-in-clear-protect-this-wekk",
  "TLSType": "pfx"
}
```

We strongly suggest using the Domino certificate option (coming in GA) or a proxy for https termination.
