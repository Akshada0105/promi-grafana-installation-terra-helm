resource "helm_release" "prometheus" {
  name       = "prometheus"
  namespace  = "monitoring"
  chart      = "kube-prometheus-stack"
  repository = "https://prometheus-community.github.io/helm-charts"
  version    = "70.2.1"

  create_namespace = true

  values = [
    <<EOF
    grafana:
      enabled: true
      service:
        type: NodePort
      adminPassword: "admin123"  # Change this for security
    EOF
  ]
}
