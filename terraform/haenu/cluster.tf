resource "vultr_kubernetes" "cluster" {
  region  = "icn"
  label   = "haenu-main-cluster"
  version = "v1.28.2+1"

#  node_pools {
#    label         = "haenu-pregenerated"
#    node_quantity = 1
#    plan          = "vc2-1c-2gb"
#  }
}

resource "vultr_kubernetes_node_pools" "haenu-main" {
  cluster_id    = vultr_kubernetes.cluster.id
  label         = "haenu-main"
  plan          = "vc2-2c-4gb"
  node_quantity = 7
  auto_scaler   = true
  min_nodes     = 7
  max_nodes     = 15
}
