# Outputs for pfSense VM
output "pfSense_vm_id" {
  description = "ID de la VM pfSense dans Proxmox"
  value       = proxmox_vm_qemu.pfSense.vmid
}

output "pfSense_vm_name" {
  description = "Nom de la VM pfSense dans Proxmox"
  value       = proxmox_vm_qemu.pfSense.name
}

output "pfSense_target_node" {
  description = "Nœud cible de la VM pfSense dans Proxmox"
  value       = proxmox_vm_qemu.pfSense.target_node
}

output "pfSense_network_wan" {
  description = "Bridge réseau pour l'interface WAN de pfSense"
  value       = proxmox_vm_qemu.pfSense.network[0].bridge
}

output "pfSense_network_lan" {
  description = "Bridge réseau pour l'interface LAN de pfSense"
  value       = proxmox_vm_qemu.pfSense.network[1].bridge
}

output "pfSense_network_dmz" {
  description = "Bridge réseau pour l'interface DMZ de pfSense"
  value       = proxmox_vm_qemu.pfSense.network[2].bridge
}
