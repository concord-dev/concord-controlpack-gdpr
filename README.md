# concord-controlpack-gdpr

GDPR (EU) control pack for [Concord](https://github.com/concord-dev/concord).
Ships eight starter controls covering the most-cited GDPR articles for
SaaS infrastructure compliance.

## Install

```sh
concord controlpack install ghcr.io/concord-dev/concord-controlpack-gdpr:v0.1.0
concord check
```

## Controls

| ID | Article |
|---|---|
| gdpr-art-5-log-retention | Art. 5 — log retention |
| gdpr-art-25-no-public-storage | Art. 25 — privacy by design (S3 public access) |
| gdpr-art-30-audit-logging | Art. 30 — records of processing (CloudTrail) |
| gdpr-art-32-backup-retention | Art. 32 — backup retention |
| gdpr-art-32-encryption-at-rest | Art. 32 — encryption at rest |
| gdpr-art-32-encryption-in-transit | Art. 32 — TLS in transit |
| gdpr-art-32-kms-key-rotation | Art. 32 — KMS key rotation |
| gdpr-art-32-mfa-privileged | Art. 32 — MFA on privileged accounts |

## Evidence sources

This pack consumes evidence from the following Concord plugins:

- `prowler` ≥ v1.0.0 (cloud security checks with GDPR mappings)
- `aws` ≥ v1.0.0 (raw AWS evidence for `gdpr-art-5-log-retention`)

Install them before running `concord check`, or rely on the bundled
fixtures (`./tests/fixtures/`) for offline testing.

## Layout

```
pack.yaml               # metadata + control list + evidence_sources
controls/               # one YAML per control
policies/               # Rego policies
tests/fixtures/         # offline-mode test fixtures
```
