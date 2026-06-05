package concord.gdpr.attestation

import rego.v1

# Shared reducer for GDPR controls backed by policy_attestation evidence.
#
# A policy_attestation is a signed YAML check-in by an accountable owner
# (DPO, legal lead). The collector verifies the signature against an
# allowlist of cosign identities; this policy verifies the *content*
# satisfies the control's structural requirements.
#
# Expected shape:
#   input.attestation = {
#     kind:        "ropa" | "dpia" | "dpa" | ...
#     owner:       string   # email
#     attested_at: RFC3339 timestamp
#     expires_at:  RFC3339 timestamp  (12-month review cadence by default)
#     version:     int
#     attested_fields: { ... per-kind required keys }
#   }
#
# Per-control Rego adds: required `kind`, required `attested_fields` keys.

deny contains msg if {
    not input.attestation
    msg := "no attestation collected — sign and check in the required policy artifact"
}

deny contains msg if {
    input.attestation.expires_at
    time.parse_rfc3339_ns(input.attestation.expires_at) <= time.now_ns()
    msg := sprintf("attestation expired on %s — re-sign with the current owner", [input.attestation.expires_at])
}

deny contains msg if {
    not input.attestation.owner
    msg := "attestation has no accountable owner recorded"
}

warn contains msg if {
    input.attestation.expires_at
    expiry := time.parse_rfc3339_ns(input.attestation.expires_at)
    expiry <= (time.now_ns() + 30 * 24 * 3600 * 1000 * 1000 * 1000)
    expiry > time.now_ns()
    msg := sprintf("attestation expires within 30 days (%s) — schedule re-sign", [input.attestation.expires_at])
}
