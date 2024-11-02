# variables global
variable "proxmox_url" {
  description = "URL de l'API Proxmox"
  type        = string
}

variable "proxmox_user" {
  description = "Utilisateur pour l'API Proxmox"
  type        = string
}

variable "proxmox_password" {
  description = "Mot de passe pour l'utilisateur API Proxmox"
  type        = string
  sensitive   = true
}

variable "proxmox_tls_insecure" {
  description = "Désactiver la vérification TLS pour l'API Proxmox"
  type        = bool
  default     = false
}
