resource "yandex_storage_bucket" "image_bucket" {
  bucket     = "netology-dedyurin"
  access_key = var.access_key
  secret_key = var.secret_key
  acl        = "public-read"
}

resource "yandex_storage_object" "image" {
  bucket = yandex_storage_bucket.image_bucket.bucket
  key    = "image.jpg"
  source = "${path.module}/files/image.jpg"
  acl    = "public-read"
  content_type = "image/jpeg"
}