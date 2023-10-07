resource "vultr_kubernetes" "cluster" {
  region  = "icn"
  label   = "archivers-cluster"
  version = "v1.28.2+1"

#    node_pools {
#      label         = "pregenerated"
#      node_quantity = 1
#      plan          = "vc2-1c-2gb"
#    }
}

resource "vultr_kubernetes_node_pools" "archivers-main" {
  cluster_id    = vultr_kubernetes.cluster.id
  label         = "archivers-main"
  plan          = "vc2-2c-4gb"
  node_quantity = 2
  auto_scaler   = true
  min_nodes     = 2
  max_nodes     = 4
}

resource "vultr_kubernetes_node_pools" "archivers-pipeline" {
  cluster_id    = vultr_kubernetes.cluster.id
  label         = "archivers-pipeline"
  plan          = "vc2-2c-4gb"
  node_quantity = 2
  auto_scaler   = true
  min_nodes     = 2
  max_nodes     = 6
}

resource "vultr_kubernetes_node_pools" "archivers-worker" {
  cluster_id    = vultr_kubernetes.cluster.id
  label         = "archivers-worker"
  plan          = "vc2-4c-8gb"
  node_quantity = 4
  auto_scaler   = true
  min_nodes     = 4
  max_nodes     = 15
}
