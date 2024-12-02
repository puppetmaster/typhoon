# Kubernetes assets (kubeconfig, manifests)
module "bootstrap" {
  source = "git::https://github.com/poseidon/terraform-render-bootstrap.git?ref=e6a1c7bccfc45ab299b5f8149bc3840f99b30b2b"

  cluster_name          = var.cluster_name
  api_servers           = [format("%s.%s", var.cluster_name, var.dns_zone)]
  etcd_servers          = [for fqdn in google_dns_record_set.etcds.*.name : trimsuffix(fqdn, ".")]
  networking            = var.networking
  network_mtu           = 1440
  pod_cidr              = var.pod_cidr
  service_cidr          = var.service_cidr
  daemonset_tolerations = var.daemonset_tolerations
  components            = var.components

  // temporary
  external_apiserver_port = 443
}

