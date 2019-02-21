variable public_key_path {
  description = "Path to the public key used to connect to instance"
  default = "~/.ssh/appuser.pub"
}

variable private_key_path {
  description = "Path to the private key used to connect to instance"
  default = "~/.ssh/appuser"
}

variable zone {
  description = "Zone"
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default = "reddit-db-base"
}

variable mongodb_internal {
  description = "Internal MONGODB IP"
  default = "0.0.0.0"
}

