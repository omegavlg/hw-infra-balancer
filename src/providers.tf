terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.141.0"
    }
  }
}

provider "yandex" {
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone-a
  service_account_key_file = file("/home/dnd/.authorized_key.json")
}