data "template_file" "mongod_conf_tpl" {
  template = "${file("../modules/db/files/mongod.conf.tpl")}"

  vars {
    mongodb_ip = "${var.mongodb_internal}"
  }
}

resource "google_compute_instance" "db" {
  name         = "reddit-db"
  machine_type = "g1-small"
  zone         = "${var.zone}"
  tags         = ["reddit-db"]

  boot_disk {
    initialize_params {
      image = "${var.db_disk_image}"
    }
  }

  network_interface {
    subnetwork       = "default"
    access_config = {}
  }

  metadata {
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }
  
  connection {
    type = "ssh"
    user = "appuser"
    private_key = "${file(var.private_key_path)}"
  }

  provisioner "file" {
    content = "${data.template_file.mongod_conf_tpl.rendered}"
    destination = "/tmp/mongod.conf"
  }

  provisioner "remote-exec" {
    script = "../modules/db/files/set_mongod.sh"
  }
}
resource "google_compute_firewall" "firewall_mongo" {
  name = "allow-mongo-default"
  network = "default"

  allow {
    protocol = "tcp"
    ports = ["27017"]
  }

  target_tags = ["reddit-db"]
  source_tags = ["reddit-app"]
}
