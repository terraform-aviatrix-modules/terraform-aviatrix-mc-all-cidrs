variable "cidr" {
  description = "Cidr of which you want a list of all possible subnets."
  type        = string

  validation {
    condition     = can(cidrnetmask(var.cidr))
    error_message = "This does not like a valid CIDR."
  }
}

variable "mask_depth" {
  description = "The depth with which all subnets need to be created."
  type        = number
  default     = 30
}

variable "exclude_cidr" {
  description = "Toggle exclusion of original CIDR in cidrlist output."
  type        = bool
  default     = false
}

locals {
  masklength   = tonumber(split("/", var.cidr)[1])
  newbits      = var.mask_depth - local.masklength
  newbit_range = range(1, local.newbits + 1)
}

