# Cloud audit logging captures every account action with file-integrity validation

`GDPR-ART-30-AUDIT-LOGGING` · framework **gdpr** · severity **high** · Records of processing

## What this control checks

GDPR Article 30 — records of processing activities — and Article 33
— breach notification within 72h — both presume the controller can
reconstruct what happened. CloudTrail / Cloud Audit / Azure
Activity Log are the foundation: without them, neither RoPA nor
incident response is possible.

## Why it matters

File-integrity validation matters specifically because Art. 30
records may be subpoenaed. An attacker who can rewrite the audit
trail can launder their actions; integrity validation makes that
detectable.

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
concord check --controls <pack>/controls --framework gdpr --control-id GDPR-ART-30-AUDIT-LOGGING
```

A passing run reports this control green; in CI, `concord gate` exits non-zero while it fails.

## Cross-framework mappings

```
  gdpr:
  - "Article 30"
  - "Article 33"
  iso27001:
  - A.12.4.1
  - A.12.4.2
  nist_800_53:
  - AU-2
  - AU-9
  soc2:
  - CC7.2
  cis_aws_v2:
  - "3.1"
  - "3.2"
```
