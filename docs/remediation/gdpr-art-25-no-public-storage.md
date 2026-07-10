# No object-storage buckets allow public access

`GDPR-ART-25-NO-PUBLIC-STORAGE` · framework **gdpr** · severity **critical** · Privacy by design

## What this control checks

GDPR Article 25 — "data protection by design and by default" —
requires the default setting to be the most privacy-preserving.
A publicly-readable bucket is the canonical violation: an operator
accidentally exposes a file that contains personal data.

## Why it matters

The most common GDPR breach pattern in the wild is "S3 bucket left
public" — Capital One, Verizon, Dow Jones, etc. Defense in depth:
detect at the resource level even when the application layer claims
to protect data.

## Evidence

Collected from the `prowler` source (`?` evidence type).

## What a failure looks like

This control reports a finding when any of the following hold:

- no Prowler evidence collected (is the binary installed and credentials configured?)
- Prowler returned zero findings — controls cannot be evaluated
- <value>: <value> (resource=<value>, severity=<value>, remediation=<value>)
- manual review required: <value> on <value>

## Remediation

Bring each affected resource or attestation listed under *What a failure looks like* into compliance, then re-collect evidence. Estimated effort: **10m**. Automated fix available: **false**.

## How to re-verify

```
concord check --controls <pack>/controls --framework gdpr --control-id GDPR-ART-25-NO-PUBLIC-STORAGE
```

A passing run reports this control green; in CI, `concord gate` exits non-zero while it fails.

## Cross-framework mappings

```
  gdpr:
  - "Article 25"
  - "Article 32(1)(b)"
  iso27001:
  - A.9.4.1
  cis_aws_v2:
  - "2.1.5"
  soc2:
  - CC6.1
```
