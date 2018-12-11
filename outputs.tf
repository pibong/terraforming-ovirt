# create web host entries for ansible template, based on file ansible_hosts.tpl : ${hostname} ansible_host=${ip_address}
data "template_file" "ansible_host" {
  #count    = "${length(ovirt_vm.vm.*.id)}"
  #template = "${file("templates/ansible_host.tpl")}"
  template = "${file("${path.module}/templates/ansible_host.tpl")}"


  vars {
    #ip_address = "${local.web_hosts[count.index]}"
    ip_address = "${var.address}"
    hostname = "${var.host_name}"
  }
}

# create dynamically an ansible inventory, based on the given template file ansible_inventory.tpl
data "template_file" "ansible_inventory" {
  #template = "${file("templates/ansible_inventory.tpl")}"
  template = "${file("${path.module}/templates/ansible_inventory.tpl")}"

  vars {
    ovirt_vms  = "${join("", data.template_file.ansible_host.*.rendered)}"
  }
}


output "ansible_inventory" {
  value = "${data.template_file.ansible_inventory.rendered}"
}

#output "cloud-init_script" {
#  value = "${data.template_file.cloud_init_script.rendered}"
#}

#output "cloud-init_script" {
#  value = "${data.template_cloudinit_config.ovirt_cloud_init.rendered}"
#}

