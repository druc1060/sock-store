output "instance_ips" {
  value = [for instance in yandex_compute_instance.vm_instance : instance.network_interface[0].nat_ip_address]
}
