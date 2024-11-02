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

# Outputs for pfSense LAN client VM
output "pfSense_lan_vm_id" {
  description = "ID de la VM pfSense LAN client dans Proxmox"
  value       = proxmox_vm_qemu.pfSense-lan.vmid
}

output "pfSense_lan_vm_name" {
  description = "Nom de la VM pfSense LAN client dans Proxmox"
  value       = proxmox_vm_qemu.pfSense-lan.name
}

# Outputs for Traefik VM
output "traefik_vm_id" {
  description = "ID de la VM Traefik dans Proxmox"
  value       = proxmox_vm_qemu.traefik.vmid
}

output "traefik_vm_name" {
  description = "Nom de la VM Traefik dans Proxmox"
  value       = proxmox_vm_qemu.traefik.name
}

# Outputs for Docker Host VM
output "docker_host_vm_id" {
  description = "ID de la VM Docker Host dans Proxmox"
  value       = proxmox_vm_qemu.docker-host.vmid
}

output "docker_host_vm_name" {
  description = "Nom de la VM Docker Host dans Proxmox"
  value       = proxmox_vm_qemu.docker-host.name
}

# Outputs for Database Server VM
output "server_db_vm_id" {
  description = "ID de la VM Database Server dans Proxmox"
  value       = proxmox_vm_qemu.server-db.vmid
}

output "server_db_vm_name" {
  description = "Nom de la VM Database Server dans Proxmox"
  value       = proxmox_vm_qemu.server-db.name
}

# Outputs for DevOps VM
output "devops_vm_id" {
  description = "ID de la VM DevOps dans Proxmox"
  value       = proxmox_vm_qemu.devops.vmid
}

output "devops_vm_name" {
  description = "Nom de la VM DevOps dans Proxmox"
  value       = proxmox_vm_qemu.devops.name
}

# Outputs for Monitoring VM
output "monitoring_vm_id" {
  description = "ID de la VM Monitoring dans Proxmox"
  value       = proxmox_vm_qemu.monitoring.vmid
}

output "monitoring_vm_name" {
  description = "Nom de la VM Monitoring dans Proxmox"
  value       = proxmox_vm_qemu.monitoring.name
}