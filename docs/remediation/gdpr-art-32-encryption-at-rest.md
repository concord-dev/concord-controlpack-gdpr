# All data stores backing personal data are encrypted at rest

`GDPR-ART-32-ENCRYPTION-AT-REST` · framework **gdpr** · severity **critical** · Security of processing

## What this control checks

GDPR Article 32(1)(a) requires "the pseudonymisation and encryption
of personal data". This control verifies that every customer-managed
data store that could hold personal data (RDS, EBS, S3, DynamoDB)
is encrypted at rest with a managed or customer-managed KMS key.

## Why it matters

Encryption at rest is the baseline technical measure regulators
expect under Art. 32. It protects against media-theft and
accidental disclosure when storage devices are decommissioned or
snapshots are accidentally shared.

## Evidence

Collected from the `prowler` source (`?` evidence type).

## What a failure looks like

This control reports a finding when any of the following hold:

- no Prowler evidence collected (is the binary installed and credentials configured?)
- Prowler returned zero findings — controls cannot be evaluated
- <value>: <value> (resource=<value>, severity=<value>, remediation=<value>)
- manual review required: <value> on <value>

## Remediation

Bring each affected resource or attestation listed under *What a failure looks like* into compliance, then re-collect evidence. Estimated effort: **1h**. Automated fix available: **false**.

## How to re-verify

```
concord check --controls <pack>/controls --framework gdpr --control-id GDPR-ART-32-ENCRYPTION-AT-REST
```

A passing run reports this control green; in CI, `concord gate` exits non-zero while it fails.

## Cross-framework mappings

```
  gdpr:
  - "Article 32(1)(a)"
  iso27001:
  - A.10.1.1
  nist_800_53:
  - SC-28
  soc2:
  - CC6.7
```
