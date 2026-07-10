# TLS 1.2+ enforced on every public-facing endpoint

`GDPR-ART-32-ENCRYPTION-IN-TRANSIT` · framework **gdpr** · severity **critical** · Security of processing

## What this control checks

GDPR Article 32(1)(a) extends "pseudonymisation and encryption" to
data in transit. This control verifies that ELBs, ALBs, CloudFront
distributions, and API Gateway endpoints enforce TLS 1.2 or higher
and never serve cleartext HTTP for personal data.

## Why it matters

Cleartext HTTP exposes personal data to passive network
eavesdropping — a high-likelihood threat on shared / public
networks. TLS < 1.2 has known cryptographic weaknesses
(BEAST, POODLE) that downgrade the encryption guarantee.

## Evidence

Collected from the `prowler` source (`?` evidence type).

## What a failure looks like

This control reports a finding when any of the following hold:

- no Prowler evidence collected (is the binary installed and credentials configured?)
- Prowler returned zero findings — controls cannot be evaluated
- <value>: <value> (resource=<value>, severity=<value>, remediation=<value>)
- manual review required: <value> on <value>

## Remediation

Bring each affected resource or attestation listed under *What a failure looks like* into compliance, then re-collect evidence. Estimated effort: **30m**. Automated fix available: **false**.

## How to re-verify

```
concord check --controls <pack>/controls --framework gdpr --control-id GDPR-ART-32-ENCRYPTION-IN-TRANSIT
```

A passing run reports this control green; in CI, `concord gate` exits non-zero while it fails.

## Cross-framework mappings

```
  gdpr:
  - "Article 32(1)(a)"
  iso27001:
  - A.13.1.1
  - A.14.1.2
  nist_800_53:
  - SC-8
  - SC-13
  soc2:
  - CC6.7
  pci_dss:
  - "4.1"
  - "4.2"
```
