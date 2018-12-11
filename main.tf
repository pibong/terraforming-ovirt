# Create cloud-init scutom-script from template templates/cloud-init-script.yml.tpl
data "template_file" "cloud_init_script" {
  template = "${file("${path.module}/templates/cloud-init-script.yml.tpl")}"

  vars {
    ssh_pub_key = "${var.ssh_pub_key}"
    repo_server = "${var.repo_server}"
    hostname	= "${var.host_name}"   
  }
}

# Render cloud init template
data "template_cloudinit_config" "ovirt_cloud_init" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.cloud_init_script.rendered}"
  }
}

# Create vm from cloud-init template
resource "ovirt_vm" "vm" {
  name = "${var.name}"

  cluster_id = "${var.cluster_id}"
  template_id = "${var.template_id}"

  memory = "${var.memory}"
  cores = "${var.cores}"
  sockets = "${var.sockets}"
  threads = "${var.threads}"
  high_availability = "${var.high_availability}"

  initialization {
    authorized_ssh_key = "${var.ssh_pub_key}"

    host_name = "${var.host_name}"
    timezone = "${var.timezone}"
    user_name = "${var.user_name}"
    #custom_script = "${data.template_cloudinit_config.ovirt_cloud_init.rendered}"
    custom_script = "${data.template_file.cloud_init_script.rendered}"
    dns_search = "${var.dns_search}"
    dns_servers = "${var.dns_servers}"
    
    nic_configuration {
      label = "${var.label}"
      boot_proto = "${var.boot_proto}"
      address = "${var.address}"
      gateway = "${var.gateway}"
      netmask = "${var.netmask}"
      on_boot = "${var.on_boot}"
    }
  }
}

