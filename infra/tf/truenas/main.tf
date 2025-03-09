locals {
  server_defaults = {
    agent = {
      enabled = false
    }
    stop_on_destroy = true
    network_device = {
      bridge = "vmbr0"
    }
    operating_system = {
      type = "l26"
    }
    gateway = "192.168.0.1" # NOTE: Probably should be in the locals.tf file
    tags    = ["terraform", "truenas", "scale"]
  }

}

resource "proxmox_virtual_environment_vm" "truenas_scale" {
  name        = "truenas-scale-0"
  vm_id       = 200
  description = "TrueNas Scale Server"
  tags        = local.server_defaults.tags

  node_name = "pve-0"

  agent {
    enabled = local.server_defaults.agent.enabled
  }

  stop_on_destroy = local.server_defaults.stop_on_destroy

  startup {
    order      = "3"
    up_delay   = "60"
    down_delay = "60"
  }

  cpu {
    cores = 2
  }

  memory {
    dedicated = 8192
    floating  = 8192
  }

  scsi_hardware = "virtio-scsi-single"
  cdrom {
    file_id = "local:iso/TrueNAS-SCALE-24.10.2.iso"
  }
  disk {
    datastore_id = "local-lvm"
    file_format  = "raw"
    interface    = "sata0"
    size         = 32
    ssd          = true
  }

  initialization {
    ip_config {
      ipv4 {
        address = "192.168.0.40/24"
        gateway = local.server_defaults.gateway
      }
    }

  }

  network_device {
    bridge = local.server_defaults.network_device.bridge
  }

  operating_system {
    type = local.server_defaults.operating_system.type
  }

  started = false

  hostpci {
    device = "hostpci0"
    id     = "0000:00:11.4"
  }

}

