resource "proxmox_virtual_environment_download_file" "ubuntu_24_noble_qcow2_img" {
  count = length(local.pve_nodes)

  content_type = "iso"
  # NOTE: Maybe make this configurable
  datastore_id = "local"
  node_name    = local.pve_nodes[count.index]
  url          = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
  overwrite    = false
}
