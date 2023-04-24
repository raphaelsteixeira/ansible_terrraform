resource "oci_core_vcn" "vcn" {
  # We still allow module users to declare a cidr using `vcn_cidr` instead of the now recommended `vcn_cidrs`, but internally we map both to `cidr_blocks`
  # The module always use the new list of string structure and let the customer update his module definition block at his own pace.
  cidr_blocks    = var.vcn_cidrs[*]
  compartment_id = var.compartment_id
  display_name   = var.label_prefix == "none" ? var.vcn_name : "${var.label_prefix}-${var.vcn_name}"
  dns_label      = var.vcn_dns_label
  is_ipv6enabled = var.enable_ipv6

  #freeform_tags = var.freeform_tags
  #defined_tags  = var.defined_tags

  lifecycle {
    #ignore_changes = [defined_tags, dns_label, freeform_tags]
  }
}
