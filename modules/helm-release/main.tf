resource "helm_release" "example" {
    for_each = var.releases
  name       = each.value.name
  repository = each.value.repository
  chart      = each.value.chart
  version    = each.value.version
  reset_values = each.value.reset_values

 values = [for a in each.value.values : try(file(a), null) ]
 namespace = each.value.namespace
 create_namespace = each.value.create_namespace

}