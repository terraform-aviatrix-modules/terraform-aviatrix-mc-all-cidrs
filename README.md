# terraform-aviatrix-mc-all-cidrs

### Description
\<Provide a description of the module>

### Compatibility
Module version | Terraform version
:--- | :--- | :--- | :---
v1.0.0 | >= 1.0

### Usage Example
```
module "cidrs" {
  source  = "terraform-aviatrix-modules/mc-all-cidrs/aviatrix"
  version = "1.0.0"

  cidr = "10.0.0.0/16"
}
```

### Variables
The following variables are required:

key | value
:--- | :---
cidr | Cidr of which you want a list of all possible subnets.

The following variables are optional:

key | default | value 
:---|:---|:---
\<keyname> | \<default value> | \<description of value that should be provided in this variable>

### Outputs
This module will return the following outputs:

key | description
:---|:---
\<keyname> | \<description of object that will be returned in this output>
