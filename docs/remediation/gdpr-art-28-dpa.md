# Sub-processors covered by signed DPAs with valid transfer mechanisms

`GDPR-ART-28-DPA` · framework **gdpr** · severity **high** · Sub-processors

## What this control checks

GDPR Article 28 requires processors to enter into a contract with each
sub-processor that imposes equivalent obligations. Concord verifies a
cosigned DPA attestation lists every sub-processor with: name,
signed_at date, location, and (if outside the EEA) a recognised
transfer mechanism such as Standard Contractual Clauses.

## Why it matters

Sub-processor management is the single most common cause of post-Schrems-II
enforcement actions. Auditors will spot-check that named sub-processors
have current DPAs and SCC-or-equivalent transfer cover.

## Evidence

Collected from the `attestation` source (`policy_attestation` evidence type).

## What a failure looks like

This control reports a finding when any of the following hold:

- no sub-processor DPA attestation collected
- attestation kind is <value>, expected "dpa"
- DPA attestation missing sub_processors list
- sub-processor <value> has no DPA signature on file
- sub-processor <value> is outside the EEA but no transfer mechanism (SCC, adequacy) is recorded

## Remediation

Bring each affected resource or attestation listed under *What a failure looks like* into compliance, then re-collect evidence. Estimated effort: **1w**. Automated fix available: **false**.

## How to re-verify

```
concord check --controls <pack>/controls --framework gdpr --control-id GDPR-ART-28-DPA
```

A passing run reports this control green; in CI, `concord gate` exits non-zero while it fails.

