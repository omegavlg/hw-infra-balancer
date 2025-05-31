#output "lamp_vm_ips" {
#  value = [
#    for vm in yandex_compute_instance.lamp_vm :
#    vm.network_interface[0].nat_ip_address
#  ]
#  description = "External IP addresses of LAMP instances"
#}

output "image_url" {
  value = "https://storage.yandexcloud.net/${yandex_storage_bucket.image_bucket.bucket}/image.jpg"
}
