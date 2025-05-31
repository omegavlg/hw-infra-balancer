variable "cloud_id" {}
variable "folder_id" {}

variable "zone-a" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "zone-b" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "image_id" {
  type        = string
  default     = "fd827b91d99psvq5fjit"
  description = "Image ID"
}

variable "preemptible" {
  type        = bool
  default     = true
  description = "Whether the VM is preemptible."
}

variable "access_key" {
  description = "Access key for Object Storage"
  type        = string
}

variable "secret_key" {
  description = "Secret key for Object Storage"
  type        = string
}

variable "service_account_id" {
  description = "Service Account ID"
  type        = string
}