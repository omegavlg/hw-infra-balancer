resource "yandex_vpc_network" "dnd-vpc" {
  name = "dnd-vps"
}

resource "yandex_vpc_subnet" "public_lamp_a" {
  name           = "public-lamp-a"
  zone           = var.zone-a
  network_id     = yandex_vpc_network.dnd-vpc.id
  v4_cidr_blocks = ["10.0.1.0/24"]
}

resource "yandex_vpc_subnet" "public_lamp_b" {
  name           = "public-lamp-b"
  zone           = var.zone-b
  network_id     = yandex_vpc_network.dnd-vpc.id
  v4_cidr_blocks = ["10.0.2.0/24"]
}