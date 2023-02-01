metadata {
  path = "postgres"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:J9nzEXWAefidi6EBpo27Qh/DW8TYMfPpIjA+jXz5fjw="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:J9nzEXWAefidi6EBpo27Qh/DW8TYMfPpIjA+jXz5fjw="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "postgres"
  target  = "postgres/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "postgres",
  ]

  sha     = "h1:J9nzEXWAefidi6EBpo27Qh/DW8TYMfPpIjA+jXz5fjw="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "postgres"
  target  = "postgres/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "f7aed47b5ef2b6875470dd1434ae387c7e27287f0d89e285538dae010bd15e51"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "postgres"
  target  = "postgres/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "postgres",
  ]

  sha     = "h1:copmgn9ngt8ifBRwxGQ+GXUgx7wmLdCA/InC6/5DUkU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "postgres"
  target  = "postgres/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "postgres",
  ]

  sha     = "h1:q/NRap2FZt8VxY7OUxykiMLTRDjWEL8Q3oh3cYnpv04="
  retries = 1
  verbose = false
}
