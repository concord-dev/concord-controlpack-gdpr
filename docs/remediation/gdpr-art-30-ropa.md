# Records of Processing Activities (ROPA) attested by the DPO

`GDPR-ART-30-ROPA` · framework **gdpr** · severity **high** · Governance

## What this control checks

GDPR Article 30 requires both controllers and processors to maintain a
Records of Processing Activities document. Concord doesn't try to
generate this — it verifies that the org has a cosign-signed YAML
check-in (the attestation) with the schema required by the EDPB
template (controller, processing activities, retention, etc.).

## Why it matters

Article 30 is one of the most reliably-cited GDPR articles in
enforcement actions. Audit-evidence-wise it's paperwork: a current,
signed ROPA that names a DPO and lists every processing activity.

## Evidence

Collected from the `attestation` source (`policy_attestation` evidence type).

## What a failure looks like

This control reports a finding when any of the following hold:

- no ROPA attestation collected
- attestation kind is <value>, expected "ropa"
- ROPA missing required field: <value>
- ROPA has zero processing activities recorded
- processing activity <value> has no retention period

## Remediation

Bring each affected resource or attestation listed under *What a failure looks like* into compliance, then re-collect evidence. Estimated effort: **1d**. Automated fix available: **false**.

## How to re-verify

```
concord check --controls <pack>/controls --framework gdpr --control-id GDPR-ART-30-ROPA
```

A passing run reports this control green; in CI, `concord gate` exits non-zero while it fails.

## Cross-framework mappings

```
  iso27001:
  - "A.5.34"
```
