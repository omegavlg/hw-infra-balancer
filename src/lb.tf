resource "yandex_lb_network_load_balancer" "lamp_nlb" {
  name = "lamp-nlb"
  listener {
    name = "http-listener"
    port = 80
    target_port = 80
    protocol = "tcp"
  }

  attached_target_group {
    target_group_id = yandex_compute_instance_group.lamp_group.load_balancer[0].target_group_id

    healthcheck {
      name = "http-hc"
      tcp_options {
        port = 80
      }
    }
  }

  depends_on = [yandex_compute_instance_group.lamp_group]
}
