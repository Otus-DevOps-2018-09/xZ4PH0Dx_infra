provider "google" {
  version = "1.4.0"
  project = "${var.project}"
  region  = "${var.region}"
}

module "storage-bucket" {
  source  = "SweetOps/storage-bucket/google"
  name    = ["${var.bucket_name}"]
}

output storage-bucket_url {
  value = "${module.storage-bucket.url}"
}

