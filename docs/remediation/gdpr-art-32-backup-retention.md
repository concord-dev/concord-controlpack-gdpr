# RDS / EBS / RDS-Aurora backups retain for the documented period

`GDPR-ART-32-BACKUP-RETENTION` · framework **gdpr** · severity **high** · Security of processing

## What this control checks

GDPR Article 32(1)(c) requires "the ability to restore the
availability and access to personal data in a timely manner in the
event of a physical or technical incident". Without a verified
backup posture, that ability is wishful thinking.

## Why it matters

The Ferrari 2023 breach showed a recovery posture that worked on
paper but had no actively-tested backup; ransomware took 72 hours
longer to recover than the published RTO. Prowler validates the
cloud-side knobs: backup enabled, retention non-zero, encryption
enabled on snapshots.

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
concord check --controls <pack>/controls --framework gdpr --control-id GDPR-ART-32-BACKUP-RETENTION
```

A passing run reports this control green; in CI, `concord gate` exits non-zero while it fails.

## Cross-framework mappings

```
  gdpr:
  - "Article 32(1)(c)"
  iso27001:
  - A.12.3.1
  - A.17.1.2
  nist_800_53:
  - CP-9
  - CP-10
  soc2:
  - A1.2
```
