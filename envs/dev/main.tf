module "network" {
  source       = "../../modules/network"
  vpc_name     = "dev-vpc"
  subnet_name  = "dev-subnet"
  subnet_cidr  = "10.10.0.0/24"
  region       = var.region
}

module "gke" {
  source        = "../../modules/gke"
  cluster_name  = "dev-gke"
  region        = var.region
  vpc_id        = module.network.vpc_id
  subnet_id     = module.network.subnet_id
  machine_type  = "e2-medium"
  node_count    = 2
}
