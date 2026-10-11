resource "google_dataplex_aspect_type_iam_binding" "dataplex_aspect_type_iam_bindings" {
  for_each = var.dataplex_aspect_type_iam_bindings

  aspect_type_id = each.value.aspect_type_id
  members        = each.value.members
  role           = each.value.role
  location       = each.value.location
  project        = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

