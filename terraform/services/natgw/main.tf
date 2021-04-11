data "template_file" "natgw_user_data" {
  template = file("${path.module}/files/cloud_init.yml")
  vars = {
    hostname = var.srv_name_prefix
  }
}

data "template_file" "natgw_network_config" {
  template = file("${path.module}/files/network_static.yml")
}

resource "libvirt_cloudinit_disk" "natgw_init" {
  name           = "${var.srv_name_prefix}-cloudinitcustom"
  user_data      = data.template_file.natgw_user_data.rendered
  network_config = data.template_file.natgw_network_config.rendered
}

resource "libvirt_volume" "natgw" {
  name   = "${var.srv_name_prefix}_vol"
  source = var.volumes_base_image
  format = "qcow2"
}

resource "libvirt_domain" "natgw" {
  name   = "natgw"
  memory = "512"
  vcpu   = 1

  cloudinit = libvirt_cloudinit_disk.natgw_init.id

  network_interface {
    network_name = "default"
    hostname     = "natgw"
    mac          = "52:54:00:1A:F8:D6"
  }

  network_interface {
    network_name = "dev.k8s.local"
    hostname     = "natgw"
    addresses    = ["10.241.0.254"]
    mac          = "52:54:00:1E:93:5A"
  }

  disk {
    volume_id = libvirt_volume.natgw.id
  }

  # IMPORTANT: this is a known bug on cloud images, since they expect a console
  # we need to pass it
  # https://bugs.launchpad.net/cloud-images/+bug/1573095
  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }
}
