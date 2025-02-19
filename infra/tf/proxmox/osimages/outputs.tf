output "ubuntu_24_noble" {
  description = "Ubuntu 24 images on various nodes"
  value       = proxmox_virtual_environment_download_file.ubuntu_24_noble_qcow2_img
}
