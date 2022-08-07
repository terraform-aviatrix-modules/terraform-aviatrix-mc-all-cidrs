locals {
  childlist = flatten([
    for newbits in local.newbit_range : cidrsubnets(
      var.cidr, [
        for x in range(1, pow(2, newbits) + 1) : newbits #Repeat newbits amount of times there are subnets to generate all subnets
      ]...
    )
  ])

  # If var.exclude_cidr = true, only return child subnets without adding var.cidr to the list.
  cidrlist = (var.exclude_cidr ?
    local.childlist
    :
    concat([var.cidr], local.childlist)
  )
}

resource "null_resource" "validation" {
  lifecycle {
    precondition {
      condition     = local.newbits <= 10
      error_message = "Difference between CIDR length and mask_depth cannot be more than 10 bits."
    }

    precondition {
      condition     = var.mask_depth > local.masklength
      error_message = "Depth needs to be greater than the CIDR's masklength."
    }
  }
}
