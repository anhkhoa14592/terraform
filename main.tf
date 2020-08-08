provider "google" {
  credentials = file("/me.json")
  project = "secteam" 
  region = "asia-southeast1"
  zone = "asia-southeast1-b"
}

resource "google_compute_instance" "hello_world_terraform" {
  name = "test"
  machine_type = "g1-small"
  zone = "asia-southeast1-b"

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }

  network_interface {
    network = "default"
  }

  metadata = {
    foo = "bar"
    hi  = "there"
  }

  labels = {
    "key_label" = "value_label"
    "other_key_label" = "other_value_label"
  }
}