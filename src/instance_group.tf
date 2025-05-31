resource "yandex_compute_instance_group" "lamp_group" {
  name               = "lamp-group"
  folder_id          = var.folder_id
  service_account_id = var.service_account_id
  
  instance_template {
    platform_id     = "standard-v2"
    resources {
      cores         = 2
      memory        = 2
      core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = 20
    }
  }

  network_interface {
    subnet_ids = [
      yandex_vpc_subnet.public_lamp_a.id,
      yandex_vpc_subnet.public_lamp_b.id
    ]
    security_group_ids = [yandex_vpc_security_group.nat-instance-sg.id]
    nat = true
    }

  scheduling_policy {
    preemptible = var.preemptible
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMaFf7jvcAP0z6Yh4PuVYVuSBZA2IWixtR1EQUPdh9Pu dnd@dnd-virtualbox"
    user-data          = templatefile("${path.module}/files/user-data.sh", {
      bucket           = yandex_storage_bucket.image_bucket.bucket
    })
  }

 }

   allocation_policy {
    zones = [var.zone-a, var.zone-b]
  }

  deploy_policy {
    max_expansion   = 3
    max_deleting    = 1
    max_creating    = 3
    max_unavailable = 1
  }

  scale_policy {
    fixed_scale {
      size = 3
    }
  }

  health_check {
    tcp_options {
      port = 80
    }
  }

  load_balancer {
    target_group_name = "lamp-group-tg"
  }
}