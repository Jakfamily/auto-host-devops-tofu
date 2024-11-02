terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc4"
    }
  }
}

resource "proxmox_vm_qemu" "pfSense" {
  name        = "pfSense-VM"
  target_node = "pve"
  onboot      = true
  boot        = "order=scsi0;ide2;net0"
  vmid        = 100

  memory      = 2048

  disk {
    type     = "disk"
    slot     = "scsi0"
    size     = "32G"
    storage  = "local-lvm"
    iothread = true
  }

  disk {
    type    = "cdrom"
    slot    = "ide2"
    storage = "local"
    iso     = "local:iso/pfsense.iso"
  }

  scsihw = "virtio-scsi-pci"

  network {
    model  = "virtio"
    bridge = "vmbr0"  # WAN
  }

  network {
    model  = "virtio"
    bridge = "vmbr1"  # LAN
  }

  network {
    model  = "virtio"
    bridge = "vmbr2"  # DMZ
  }

  lifecycle {
    ignore_changes = [
      disk[1],  # Ignore changes on CD/DVD
    ]
  }
}

resource "proxmox_vm_qemu" "pfSense-lan" {
  name        = "pfSense-VM-lan"
  target_node = "pve"
  onboot      = true
  boot        = "order=scsi0;ide2;net0"
  vmid        = 101

  memory      = 2048

  disk {
    type     = "disk"
    slot     = "scsi0"
    size     = "32G"
    storage  = "local-lvm"
    iothread = true
  }

  disk {
    type    = "cdrom"
    slot    = "ide2"
    storage = "local"
    iso     = "local:iso/debian12.iso"
  }

  scsihw = "virtio-scsi-pci"
  network {
    model  = "virtio"
    bridge = "vmbr2"  # DMZ
  }

  lifecycle {
    ignore_changes = [
      disk[1],  # Ignore changes on CD/DVD
    ]
  }
}

resource "proxmox_vm_qemu" "traefik" {
  name        = "traefik-VM"
  target_node = "pve"
  onboot      = true
  boot        = "order=scsi0;ide2;net0"
  vmid        = 110

  memory      = 2048

  disk {
    type     = "disk"
    slot     = "scsi0"
    size     = "20G"
    storage  = "local-lvm"
    iothread = true
  }

  disk {
    type    = "cdrom"
    slot    = "ide2"
    storage = "local"
    iso     = "local:iso/debian12.iso"
  }

  scsihw = "virtio-scsi-pci"

  network {
    model  = "virtio"
    bridge = "vmbr2"  # DMZ
  }

  lifecycle {
    ignore_changes = [
      disk[1],  # Ignore changes on CD/DVD
    ]
  }
}

resource "proxmox_vm_qemu" "docker-host" {
  name        = "docker-host-VM"
  target_node = "pve"
  onboot      = true
  boot        = "order=scsi0;ide2;net0"
  vmid        = 130

  memory      = 4096

  disk {
    type     = "disk"
    slot     = "scsi0"
    size     = "60G"
    storage  = "local-lvm"
    iothread = true
  }

  disk {
    type    = "cdrom"
    slot    = "ide2"
    storage = "local"
    iso     = "local:iso/debian12.iso"
  }

  scsihw = "virtio-scsi-pci"

  network {
    model  = "virtio"
    bridge = "vmbr2"  # DMZ
  }

  lifecycle {
    ignore_changes = [
      disk[1],  # Ignore changes on CD/DVD
    ]
  }
}

resource "proxmox_vm_qemu" "server-db" {
  name        = "db-VM"
  target_node = "pve"
  onboot      = true
  boot        = "order=scsi0;ide2;net0"
  vmid        = 140

  memory      = 2048

  disk {
    type     = "disk"
    slot     = "scsi0"
    size     = "32G"
    storage  = "local-lvm"
    iothread = true
  }

  disk {
    type    = "cdrom"
    slot    = "ide2"
    storage = "local"
    iso     = "local:iso/debian12.iso"
  }

  scsihw = "virtio-scsi-pci"

  network {
    model  = "virtio"
    bridge = "vmbr2"  # DMZ
  }

  lifecycle {
    ignore_changes = [
      disk[1],  # Ignore changes on CD/DVD
    ]
  }
}

resource "proxmox_vm_qemu" "devops" {
  name        = "devops-VM"
  target_node = "pve"
  onboot      = true
  boot        = "order=scsi0;ide2;net0"
  vmid        = 150

  memory      = 2048

  disk {
    type     = "disk"
    slot     = "scsi0"
    size     = "80G"
    storage  = "local-lvm"
    iothread = true
  }

  disk {
    type    = "cdrom"
    slot    = "ide2"
    storage = "local"
    iso     = "local:iso/debian12.iso"
  }

  scsihw = "virtio-scsi-pci"

  network {
    model  = "virtio"
    bridge = "vmbr2"  # DMZ
  }

  lifecycle {
    ignore_changes = [
      disk[1],  # Ignore changes on CD/DVD
    ]
  }
}

resource "proxmox_vm_qemu" "monitoring" {
  name        = "monitoring-VM"
  target_node = "pve"
  onboot      = true
  boot        = "order=scsi0;ide2;net0"
  vmid        = 160

  memory      = 2048

  disk {
    type     = "disk"
    slot     = "scsi0"
    size     = "100G"
    storage  = "local-lvm"
    iothread = true
  }

  disk {
    type    = "cdrom"
    slot    = "ide2"
    storage = "local"
    iso     = "local:iso/debian12.iso"
  }

  scsihw = "virtio-scsi-pci"

  network {
    model  = "virtio"
    bridge = "vmbr2"  # DMZ
  }

  lifecycle {
    ignore_changes = [
      disk[1],  # Ignore changes on CD/DVD
    ]
  }
}
