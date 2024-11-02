variable "vm_name" {
  description = "Nom de la VM pfSense"
  type        = string
  default     = "pfSense-VM"
}

variable "node" {
  description = "Nom du noeud Proxmox"
  type        = string
  default     = "pve"
}

variable "vmid" {
  description = "ID de la VM"
  type        = number
  default     = 100
}

variable "memory" {
  description = "Mémoire de la VM en MB"
  type        = number
  default     = 2048
}

variable "disk_size" {
  description = "Taille du disque en Go"
  type        = string
  default     = "32G"
}

variable "storage" {
  description = "Stockage pour le disque"
  type        = string
  default     = "local-lvm"
}

variable "iso_storage" {
  description = "Stockage pour l'ISO"
  type        = string
  default     = "local"
}

variable "iso_file" {
  description = "Nom de l'ISO pour l'installation"
  type        = string
  default     = "local:iso/pfsense.iso"
}

variable "wan_bridge" {
  description = "Pont réseau pour WAN"
  type        = string
  default     = "vmbr0"
}

variable "lan_bridge" {
  description = "Pont réseau pour LAN"
  type        = string
  default     = "vmbr1"
}

variable "dmz_bridge" {
  description = "Pont réseau pour DMZ"
  type        = string
  default     = "vmbr2"
}
