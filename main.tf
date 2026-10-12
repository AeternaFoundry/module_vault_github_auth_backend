resource "vault_github_auth_backend" "github_auth_backends" {
  for_each = var.github_auth_backends

  organization            = each.value.organization
  alias_metadata          = each.value.alias_metadata
  base_url                = each.value.base_url
  description             = each.value.description
  disable_remount         = each.value.disable_remount
  namespace               = each.value.namespace
  organization_id         = each.value.organization_id
  path                    = each.value.path
  token_bound_cidrs       = each.value.token_bound_cidrs
  token_explicit_max_ttl  = each.value.token_explicit_max_ttl
  token_max_ttl           = each.value.token_max_ttl
  token_no_default_policy = each.value.token_no_default_policy
  token_num_uses          = each.value.token_num_uses
  token_period            = each.value.token_period
  token_policies          = each.value.token_policies
  token_ttl               = each.value.token_ttl
  token_type              = each.value.token_type

  dynamic "tune" {
    for_each = each.value.tune != null ? each.value.tune : []
    content {
      allowed_response_headers     = tune.value.allowed_response_headers
      audit_non_hmac_request_keys  = tune.value.audit_non_hmac_request_keys
      audit_non_hmac_response_keys = tune.value.audit_non_hmac_response_keys
      default_lease_ttl            = tune.value.default_lease_ttl
      listing_visibility           = tune.value.listing_visibility
      max_lease_ttl                = tune.value.max_lease_ttl
      passthrough_request_headers  = tune.value.passthrough_request_headers
      token_type                   = tune.value.token_type
    }
  }
}

