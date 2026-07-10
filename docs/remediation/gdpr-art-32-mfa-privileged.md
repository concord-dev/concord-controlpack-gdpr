# Every privileged identity has multi-factor authentication enforced

`GDPR-ART-32-MFA-PRIVILEGED` · framework **gdpr** · severity **critical** · Security of processing

## What this control checks

GDPR Article 32(1)(b) — "ensure the ongoing confidentiality,
integrity, availability and resilience of processing systems" —
requires strong authentication for any identity with the power to
expose or modify personal data. MFA is the bar regulators expect.

## Why it matters

The 2017 Equifax breach (143M records, $700M settlement) traced
back to an unrotated certificate and weak admin authentication.
The DPA settlement explicitly cited absent MFA on privileged
accounts as an aggravating factor.

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
concord check --controls <pack>/controls --framework gdpr --control-id GDPR-ART-32-MFA-PRIVILEGED
```

A passing run reports this control green; in CI, `concord gate` exits non-zero while it fails.

## Cross-framework mappings

```
  gdpr:
  - "Article 32(1)(b)"
  iso27001:
  - A.9.4.2
  - A.9.4.3
  nist_800_53:
  - IA-2
  - IA-2(1)
  soc2:
  - CC6.1
  cis_aws_v2:
  - "1.5"
  - "1.10"
```
