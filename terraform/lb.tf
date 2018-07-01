resource "google_compute_forwarding_rule" "default" {
  name       = "reddit-app-forwarding-rule"
  target     = "${google_compute_target_pool.default.self_link}"
  port_range = "9292"
}

resource "google_compute_target_pool" "default" {
  project       = "${var.project}"
  name          = "target-pool"
  instances     = ["${google_compute_instance.app.*.self_link}"]
  health_checks = ["${google_compute_http_health_check.default.name}"]
}

resource "google_compute_http_health_check" "default" {
  project      = "${var.project}"
  name         = "default-hc"
  request_path = "/"
  port         = "9292"
}
