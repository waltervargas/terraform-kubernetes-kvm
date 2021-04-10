data "template_file" "common_user_data" {
  count    = var.srv_nodes_count
  template = file("${path.module}/${local.common_templates_path}/cloud_init.yml")
  vars = {
    hostname = "${var.srv_name_prefix}${count.index + 1}"
  }
}

data "template_file" "common_network_config" {
  template = file("${path.module}/${local.common_templates_path}/network_dhcp.yml")
}

resource "libvirt_cloudinit_disk" "common_init" {
  count          = var.srv_nodes_count
  name           = "${var.srv_name_prefix}${count.index + 1}-cloudinitdisk"
  user_data      = data.template_file.common_user_data[count.index].rendered
  network_config = data.template_file.common_network_config.rendered
}
