# get datacenter with search criteria
data "ovirt_datacenters" "target_datacenter" {
  search = {
          criteria       = "name = ${var.dc_search_criteria} and status = up"
	  max		 = 1
          case_sensitive = false
  }
}

data "ovirt_clusters" "available_clusters_in_dc" {
  search = {
          criteria       = "datacenter = ${var.dc_search_criteria}"
          case_sensitive = false
  }
}

data "ovirt_networks" "available_networks_in_dc" {
  search = {
          criteria       = "datacenter = ${var.dc_search_criteria}"
          case_sensitive = false
  }
}

data "ovirt_storagedomains" "available_storagedomains_in_dc" {
  search = {
          criteria       = "datacenter = ${var.dc_search_criteria}"
          case_sensitive = false
  }
}

# not yet implemented by this provider
#data "ovirt_templates" "available_templates_in_dc" {
#  search = {
#          criteria       = "datacenter = ${var.dc_search_criteria}"
#          case_sensitive = false
#  }
#}

data "ovirt_vms" "available_vms_in_dc" {
  search = {
          criteria       = "datacenter = ${var.dc_search_criteria}"
          case_sensitive = false
  }
}
