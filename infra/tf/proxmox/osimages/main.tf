resource "proxmox_virtual_environment_download_file" "ubuntu_24_noble_qcow2_img" {
  count = length(local.pve_nodes)

  content_type = "iso"
  # NOTE: Maybe make this configurable
  datastore_id = "local"
  node_name    = local.pve_nodes[count.index]
  url          = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
  overwrite    = false
}

resource "proxmox_virtual_environment_download_file" "truenas_scale_24_10_2" {
  content_type = "iso"
  # NOTE: Maybe make this configurable
  datastore_id = "local"
  node_name    = "pve-0"
  url          = "https://download.sys.truenas.net/TrueNAS-SCALE-ElectricEel/24.10.2/TrueNAS-SCALE-24.10.2.iso"
  overwrite    = false
}
