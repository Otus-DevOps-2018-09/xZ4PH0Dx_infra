terraform {
  backend "gcs" {
    bucket = "otus-xz4ph0dx"
    prefix = "stage"
  }
}
