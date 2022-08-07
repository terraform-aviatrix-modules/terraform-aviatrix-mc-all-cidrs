locals {
  childlist = flatten([
    for i in local.range : cidrsubnets(
      var.cidr, [
        for x in range(1, pow(2, i) + 1) : i #Repeat "i" amount of times there are subnets
      ]...
    )
  ])

  cidrlist = (var.exclude_cidr ?
    local.childlist
    :
    concat(local.cidr, local.childlist)
  )
}

resource "null_resource" "validation" {
  lifecycle {
    precondition {
      condition     = local.newbits <= 10
      error_message = "Difference between CIDR length and depth cannot be more than 10 bits."
    }

    precondition {
      condition     = var.mask_depth > local.masklength
      error_message = "Depth needs to be greater than the CIDR's masklength."
    }
  }
}
