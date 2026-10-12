variable "github_auth_backends" {
  description = <<EOT
Map of github_auth_backends, attributes below
Required:
    - organization
Optional:
    - alias_metadata
    - base_url
    - description
    - disable_remount
    - namespace
    - organization_id
    - path
    - token_bound_cidrs
    - token_explicit_max_ttl
    - token_max_ttl
    - token_no_default_policy
    - token_num_uses
    - token_period
    - token_policies
    - token_ttl
    - token_type
    - tune (block):
        - allowed_response_headers (optional)
        - audit_non_hmac_request_keys (optional)
        - audit_non_hmac_response_keys (optional)
        - default_lease_ttl (optional)
        - listing_visibility (optional)
        - max_lease_ttl (optional)
        - passthrough_request_headers (optional)
        - token_type (optional)
EOT

  type = map(object({
    organization            = string
    alias_metadata          = optional(map(string))
    base_url                = optional(string)
    description             = optional(string)
    disable_remount         = optional(bool)
    namespace               = optional(string)
    organization_id         = optional(number)
    path                    = optional(string)
    token_bound_cidrs       = optional(set(string))
    token_explicit_max_ttl  = optional(number)
    token_max_ttl           = optional(number)
    token_no_default_policy = optional(bool)
    token_num_uses          = optional(number)
    token_period            = optional(number)
    token_policies          = optional(set(string))
    token_ttl               = optional(number)
    token_type              = optional(string)
    tune = optional(list(object({
      allowed_response_headers     = optional(list(string))
      audit_non_hmac_request_keys  = optional(list(string))
      audit_non_hmac_response_keys = optional(list(string))
      default_lease_ttl            = optional(string)
      listing_visibility           = optional(string)
      max_lease_ttl                = optional(string)
      passthrough_request_headers  = optional(list(string))
      token_type                   = optional(string)
    })))
  }))
  # Note: 4 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

