# Set provider config
provider "ovirt" {
  username = "${var.ovirt_username}"
  url      = "${var.ovirt_url}"
  password = "${var.ovirt_pass}"
}

