# resource "proxmox_vm_qemu" "pfSense" {
#   name        = "pfSense-VM"
#   target_node = "pve"
#   onboot      = true
#   boot        = "order=scsi0;ide2;net0"
#   vmid        = 100

#   memory      = 2048

#   disk {
#     type     = "disk"
#     slot     = "scsi0"
#     size     = "32G"
#     storage  = "local-lvm"
#     iothread = true
#   }

#   disk {
#     type    = "cdrom"
#     slot    = "ide2"
#     storage = "local"
#     iso     = "local:iso/pfsense.iso"
#   }

#   scsihw = "virtio-scsi-pci"

#   network {
#     model  = "virtio"
#     bridge = "vmbr0"  # WAN
#   }

#   network {
#     model  = "virtio"
#     bridge = "vmbr1"  # LAN
#   }

#   network {
#     model  = "virtio"
#     bridge = "vmbr2"  # DMZ
#   }

#   lifecycle {
#     ignore_changes = [
#       disk[1],  # Ignore changes on CD/DVD
#     ]
#   }
# }
terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc4"
    }
  }
}

resource "proxmox_vm_qemu" "pfSense" {
  name        = var.vm_name
  target_node = var.node
  onboot      = true
  boot        = "order=scsi0;ide2;net0"
  vmid        = var.vmid

  memory      = var.memory

  disk {
    type     = "disk"
    slot     = "scsi0"
    size     = var.disk_size
    storage  = var.storage
    iothread = true
  }

  disk {
    type    = "cdrom"
    slot    = "ide2"
    iso     = var.iso_file
  }

  scsihw = "virtio-scsi-pci"

  network {
    model  = "virtio"
    bridge = var.wan_bridge
  }

  network {
    model  = "virtio"
    bridge = var.lan_bridge
  }

  network {
    model  = "virtio"
    bridge = var.dmz_bridge
  }

  lifecycle {
    ignore_changes = [
      disk[1],  # Ignore les changements sur le CD/DVD
    ]
  }
}
