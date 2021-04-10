## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_libvirt"></a> [libvirt](#requirement\_libvirt) | 0.6.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_libvirt"></a> [libvirt](#provider\_libvirt) | 0.6.3 |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [libvirt_cloudinit_disk.common_init](https://registry.terraform.io/providers/dmacvicar/libvirt/0.6.3/docs/resources/cloudinit_disk) | resource |
| [libvirt_domain.etcd](https://registry.terraform.io/providers/dmacvicar/libvirt/0.6.3/docs/resources/domain) | resource |
| [libvirt_volume.etcd](https://registry.terraform.io/providers/dmacvicar/libvirt/0.6.3/docs/resources/volume) | resource |
| [template_file.common_network_config](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.common_user_data](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_macvtap_interface"></a> [macvtap\_interface](#input\_macvtap\_interface) | The interface name to use with macvtap | `string` | n/a | yes |
| <a name="input_srv_name_prefix"></a> [srv\_name\_prefix](#input\_srv\_name\_prefix) | The srv name prefix | `string` | n/a | yes |
| <a name="input_srv_nodes_count"></a> [srv\_nodes\_count](#input\_srv\_nodes\_count) | The number of srv nodes. | `number` | n/a | yes |
| <a name="input_volumes_base_image"></a> [volumes\_base\_image](#input\_volumes\_base\_image) | The base image used to create volumes. | `string` | n/a | yes |

## Outputs

No outputs.
