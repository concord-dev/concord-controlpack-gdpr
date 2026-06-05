package concord.gdpr.art_30_ropa

import rego.v1

# GDPR Article 30 — Records of Processing Activities (ROPA).
# Composes with concord.gdpr.attestation for the common attestation checks.
# Adds Art-30-specific required fields: a non-empty processing_activities[]
# with controller, purposes, categories, retention.

required_fields := {"processing_activities", "controller", "dpo_contact"}

deny contains msg if {
    not input.attestation
    msg := "no ROPA attestation collected"
}

deny contains msg if {
    input.attestation.kind != "ropa"
    msg := sprintf("attestation kind is %q, expected \"ropa\"", [input.attestation.kind])
}

deny contains msg if {
    some f in required_fields
    not input.attestation.attested_fields[f]
    msg := sprintf("ROPA missing required field: %s", [f])
}

deny contains msg if {
    count(input.attestation.attested_fields.processing_activities) == 0
    msg := "ROPA has zero processing activities recorded"
}

deny contains msg if {
    some pa in input.attestation.attested_fields.processing_activities
    not pa.retention_period
    msg := sprintf("processing activity %q has no retention period", [pa.name])
}
