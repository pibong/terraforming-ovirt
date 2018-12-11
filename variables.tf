### provider's variables for using RHV-M REST API ###
variable "ovirt_url" {
  description = "The oVirt engine URL"
  default = "https://ovirt-manager.io/ovirt-engine/api"
}

variable "ovirt_username" {
  description = "The name of user to access oVirt engine API"
  default = "foo@domain"
}

variable "ovirt_pass" {
  description = "The plain password of user to access oVirt engine API"
}


### variables for creating vm ###
variable "cluster_id" {
  description = "The ID of cluster"
  default = "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
}

variable "storagedomain_id" {
  description = "The ID of storage domain"
   default = "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
}

variable "template_id" {
  description = "The ID of VM template"
  default = "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"	# rhel7.4-cloud-init in DC_TEST
}

variable "network_id" {
  description = "The ID of network"
  default = "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
}

variable "cores" {
  default = "1"
}

variable "high_availability" {
  default = "true"
}

variable "memory" {
  default = "4096"
}

variable "name" {
  default = "test-tf-provider"
}

variable "sockets" {
  default = "1"
}

variable "threads" {
  default = "1"
}

# variables used for cloud-init
variable "host_name" {
  default = "testcloud1"
}

variable "timezone" {
  default = "Europe/Budapest"
}

variable "user_name" {
  default = "root"
}

variable "ssh_pub_key" {
  default = "ssh-rsa ...."	# set your SSHv2 pub key here
}

variable "repo_server" {
  default = "192.168.4.4"
}

variable "dns_search" {
  default = "domain"
}

variable "dns_servers" {
  default = "8.8.8.8"
}

variable "label" {
  default = "eth0"
}

variable "boot_proto" {
  default = "static"
}

variable "address" {
  default = "192.168.25.22"
}

variable "gateway" {
  default = "192.168.25.19"
}

variable "netmask" {
  default = "255.255.255.240"
}

variable "on_boot" {
  default = "true"
}

