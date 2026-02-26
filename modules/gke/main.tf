resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  network    = var.vpc_id
  subnetwork = var.subnet_id

  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "nodes" {
  cluster  = google_container_cluster.primary.name
  location = var.region

  node_config {
    machine_type = var.machine_type
  }

  node_count = var.node_count
}
