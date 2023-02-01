metadata {
  path = "airbyte"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "airbyte/terraform"
  target  = "airbyte/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:wo7h3lKKHcylBYix6+wv3fTCcCJcly2tn1tHY8SJtgE="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "airbyte/terraform"
  target  = "airbyte/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:wo7h3lKKHcylBYix6+wv3fTCcCJcly2tn1tHY8SJtgE="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "airbyte"
  target  = "airbyte/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "airbyte",
  ]

  sha     = "h1:wo7h3lKKHcylBYix6+wv3fTCcCJcly2tn1tHY8SJtgE="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "airbyte"
  target  = "airbyte/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "999e30e66ef3eac3b1ad088f7f47f5f16e1a1229694d2ece66dba87c6df77bfc"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "airbyte"
  target  = "airbyte/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "airbyte",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "airbyte"
  target  = "airbyte/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "airbyte",
  ]

  sha     = "h1:P7c0MH9R5EyGOXk12EnawgOQEmoHgBgrEqLY6n/y+qo="
  retries = 1
  verbose = false
}
