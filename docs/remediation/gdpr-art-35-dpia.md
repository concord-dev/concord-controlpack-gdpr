# Data Protection Impact Assessment (DPIA) signed for high-risk processing

`GDPR-ART-35-DPIA` · framework **gdpr** · severity **high** · Governance

## What this control checks

GDPR Article 35 requires a DPIA when processing is likely to result in
high risk to data subjects. Concord verifies a cosigned DPIA attestation
exists with the four EDPB-required sections: processing description,
necessity assessment, risks identified, mitigations applied.

## Why it matters

DPIAs are the most common GDPR-paperwork ask during enterprise sales.
Auditors will ask for one specifically; not having a current signed
DPIA is a blocking finding for high-risk processing.

## Evidence

Collected from the `attestation` source (`policy_attestation` evidence type).

## What a failure looks like

This control reports a finding when any of the following hold:

- no DPIA attestation collected
- attestation kind is <value>, expected "dpia"
- DPIA missing required field: <value>
- DPIA lists risks but no mitigating measures

## Remediation

Bring each affected resource or attestation listed under *What a failure looks like* into compliance, then re-collect evidence. Estimated effort: **2d**. Automated fix available: **false**.

## How to re-verify

```
concord check --controls <pack>/controls --framework gdpr --control-id GDPR-ART-35-DPIA
```

A passing run reports this control green; in CI, `concord gate` exits non-zero while it fails.

