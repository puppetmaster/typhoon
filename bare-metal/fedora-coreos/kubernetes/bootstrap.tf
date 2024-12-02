# Kubernetes assets (kubeconfig, manifests)
module "bootstrap" {
  source = "git::https://github.com/poseidon/terraform-render-bootstrap.git?ref=e6a1c7bccfc45ab299b5f8149bc3840f99b30b2b"

  cluster_name                    = var.cluster_name
  api_servers                     = [var.k8s_domain_name]
  etcd_servers                    = var.controllers.*.domain
  networking                      = var.networking
  network_mtu                     = var.network_mtu
  network_ip_autodetection_method = var.network_ip_autodetection_method
  pod_cidr                        = var.pod_cidr
  service_cidr                    = var.service_cidr
  components                      = var.components
}


