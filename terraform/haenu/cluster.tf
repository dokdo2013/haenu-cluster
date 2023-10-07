resource "vultr_kubernetes" "cluster" {
  region  = "icn"
  label   = "haenu-main-cluster"
  version = "v1.28.2+1"
}

resource "vultr_kubernetes_node_pools" "haenu-main" {
  cluster_id    = vultr_kubernetes.cluster.id
  label         = "haenu-main"
  plan          = "vc2-2c-4gb"
  node_quantity = 3
  auto_scaler   = true
  min_nodes     = 3
  max_nodes     = 5
}
