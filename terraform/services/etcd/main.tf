resource "libvirt_volume" "etcd" {
  count = var.srv_nodes_count

  name   = "${var.srv_name_prefix}_vol${count.index + 1}"
  source = var.volumes_base_image
  format = "qcow2"
}

resource "libvirt_domain" "etcd" {
  count = var.srv_nodes_count

  name   = "etcd${count.index}"
  memory = "512"
  vcpu   = 1

  cloudinit = libvirt_cloudinit_disk.common_init[count.index].id

  network_interface {
    macvtap  = var.macvtap_interface
    hostname = "etcd${count.index}"
  }

  disk {
    volume_id = libvirt_volume.etcd[count.index].id
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
