# CloudWatch / Cloud Logging log groups retain personal data for at most 90 days

`GDPR-ART-5-LOG-RETENTION` · framework **gdpr** · severity **medium** · Data minimisation

## What this control checks

GDPR Article 5(1)(c) (data minimisation) and 5(1)(e) (storage
limitation) together require personal data to be kept "no longer
than is necessary for the purposes for which it is processed".
Log groups frequently contain personal data (IPs, user IDs,
request paths); a default of "retain forever" is a regulatory
risk.

## Why it matters

Default CloudWatch retention is "never expire". Most lawful bases
for processing personal data don't survive past 90 days of
operational logs (security logs may be longer; pin those in a
different log group and tag accordingly). Failing this control
means a regulator who asks "why are you still holding personal
data from 2 years ago" gets a worse answer than they should.

## Evidence

Collected from the `steampipe` source (`?` evidence type).

## What a failure looks like

This control reports a finding when any of the following hold:

- no log_groups evidence collected
- log group <value> has no retention policy (would retain forever)
- log group <value> retains for <value> days; GDPR data-minimisation budget is <value>

## Remediation

Bring each affected resource or attestation listed under *What a failure looks like* into compliance, then re-collect evidence. Estimated effort: **5m**. Automated fix available: **true**.

## How to re-verify

```
concord check --controls <pack>/controls --framework gdpr --control-id GDPR-ART-5-LOG-RETENTION
```

A passing run reports this control green; in CI, `concord gate` exits non-zero while it fails.

## Cross-framework mappings

```
  gdpr:
  - "Article 5(1)(c)"
  - "Article 5(1)(e)"
  iso27001:
  - A.12.4.2
  - A.18.1.3
  nist_800_53:
  - SI-12
  soc2:
  - CC7.3
```
