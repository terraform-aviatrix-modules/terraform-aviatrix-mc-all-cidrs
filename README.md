# terraform-aviatrix-mc-all-cidrs

### Description
Simple module that returns all possible subnets inside a given cidr.

### Compatibility
Module version | Terraform version
:--- | :---
v1.0.0 | >= 1.0

### Usage Example
```hcl
module "cidrs" {
  source  = "terraform-aviatrix-modules/mc-all-cidrs/aviatrix"
  version = "1.0.0"

  cidr       = "10.0.0.0/16"
  mask_depth = 19
}

output "cidrs" {
  value = module.cidrs.cidrlist
}

```

Output:
```
cidrs = tolist([
  "10.0.0.0/16",
  "10.0.0.0/17",
  "10.0.128.0/17",
  "10.0.0.0/18",
  "10.0.64.0/18",
  "10.0.128.0/18",
  "10.0.192.0/18",
  "10.0.0.0/19",
  "10.0.32.0/19",
  "10.0.64.0/19",
  "10.0.96.0/19",
  "10.0.128.0/19",
  "10.0.160.0/19",
  "10.0.192.0/19",
  "10.0.224.0/19",
])
```

### Variables
The following variables are required:

key | value
:--- | :---
cidr | CIDR of which you want a list of all possible subnets.

The following variables are optional:

key | default | value 
:---|:---|:---
depth | 30 | The depth to which subnets need to be generated.
exclude_cidr | false | Toggle exclusion of original CIDR in cidrlist output.

### Outputs
This module will return the following outputs:

key | description
:---|:---
cidrlist | A list object with all subnets in this CIDR.
