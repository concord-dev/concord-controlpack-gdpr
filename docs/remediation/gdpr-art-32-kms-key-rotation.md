# Customer-managed KMS keys rotate at least annually

`GDPR-ART-32-KMS-KEY-ROTATION` · framework **gdpr** · severity **high** · Security of processing

## What this control checks

GDPR Article 32(1)(d) requires "regular testing, assessing and
evaluating the effectiveness of technical measures". Key rotation
is the operational test of the encryption guarantee — a key that
never rotates degrades its protective value over time as exposure
risk accumulates.

## Why it matters

NIST SP 800-57 recommends a cryptoperiod of at most one year for
symmetric data-encryption keys. AWS KMS, GCP KMS, and Azure Key
Vault all support automatic annual rotation; Prowler verifies the
setting is enabled for every customer-managed key.

## Evidence

Collected from the `prowler` source (`?` evidence type).

## What a failure looks like

This control reports a finding when any of the following hold:

- no Prowler evidence collected (is the binary installed and credentials configured?)
- Prowler returned zero findings — controls cannot be evaluated
- <value>: <value> (resource=<value>, severity=<value>, remediation=<value>)
- manual review required: <value> on <value>

## Remediation

Bring each affected resource or attestation listed under *What a failure looks like* into compliance, then re-collect evidence. Estimated effort: **5m**. Automated fix available: **true**.

## How to re-verify

```
concord check --controls <pack>/controls --framework gdpr --control-id GDPR-ART-32-KMS-KEY-ROTATION
```

A passing run reports this control green; in CI, `concord gate` exits non-zero while it fails.

## Cross-framework mappings

```
  gdpr:
  - "Article 32(1)(d)"
  iso27001:
  - A.10.1.2
  nist_800_53:
  - SC-12
  - SC-12(3)
  soc2:
  - CC6.7
```
