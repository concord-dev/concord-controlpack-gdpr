package concord.gdpr.art_35_dpia

import rego.v1

# GDPR Article 35 — Data Protection Impact Assessment for high-risk processing.

required_fields := {"processing_description", "necessity_assessment",
                    "risks_to_data_subjects", "mitigating_measures"}

deny contains msg if {
    not input.attestation
    msg := "no DPIA attestation collected"
}

deny contains msg if {
    input.attestation.kind != "dpia"
    msg := sprintf("attestation kind is %q, expected \"dpia\"", [input.attestation.kind])
}

deny contains msg if {
    some f in required_fields
    not input.attestation.attested_fields[f]
    msg := sprintf("DPIA missing required field: %s", [f])
}

deny contains msg if {
    count(input.attestation.attested_fields.mitigating_measures) == 0
    msg := "DPIA lists risks but no mitigating measures"
}
