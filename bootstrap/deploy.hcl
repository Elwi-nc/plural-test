metadata {
  path = "bootstrap"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:kBGGOXsCOJi8oYQR0tN4Ejxpc8/EQWjkXWrizZ/4v1A="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:kBGGOXsCOJi8oYQR0tN4Ejxpc8/EQWjkXWrizZ/4v1A="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "bootstrap"
  target  = "bootstrap/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "bootstrap",
  ]

  sha     = "h1:kBGGOXsCOJi8oYQR0tN4Ejxpc8/EQWjkXWrizZ/4v1A="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "bootstrap"
  target  = "bootstrap/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "4bcad63887201a5292e46d3893659759d92485465cd344f8cc8d6ce85b4224a7"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "bootstrap"
  target  = "bootstrap/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "bootstrap",
  ]

  sha     = "h1:l9QQH3v/pkycZAvjGoQXOKgYW/QlxJn+WtNuG6zOFyU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "bootstrap"
  target  = "bootstrap/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "bootstrap",
  ]

  sha     = "h1:xwW+ABO/WUWtIYsA8fu76nC0hmzPwLetqNhKI8XlOFA="
  retries = 1
  verbose = false
}
