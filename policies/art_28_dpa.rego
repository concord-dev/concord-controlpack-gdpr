package concord.gdpr.art_28_dpa

import rego.v1

# GDPR Article 28 — Data Processing Agreements with sub-processors.
# Each enumerated sub-processor must have a signed DPA on file (attested
# via the cosigned check-in) and a current SCC reference if outside the EEA.

deny contains msg if {
    not input.attestation
    msg := "no sub-processor DPA attestation collected"
}

deny contains msg if {
    input.attestation.kind != "dpa"
    msg := sprintf("attestation kind is %q, expected \"dpa\"", [input.attestation.kind])
}

deny contains msg if {
    not input.attestation.attested_fields.sub_processors
    msg := "DPA attestation missing sub_processors list"
}

deny contains msg if {
    some sp in input.attestation.attested_fields.sub_processors
    not sp.dpa_signed_at
    msg := sprintf("sub-processor %q has no DPA signature on file", [sp.name])
}

deny contains msg if {
    some sp in input.attestation.attested_fields.sub_processors
    sp.outside_eea == true
    not sp.transfer_mechanism
    msg := sprintf("sub-processor %q is outside the EEA but no transfer mechanism (SCC, adequacy) is recorded", [sp.name])
}
