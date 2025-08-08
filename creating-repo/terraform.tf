provider "github" {
    token=""
}

resource "github_repository" "myfirst-repo" {
  name        = "myfirst-repo"
  description = "creating this repo from terraform"

  visibility = "public"
  auto_init=true
}

resource "github_repository" "mysecond-repo" {
  name        = "second-repo"
  description = "creating this second repo from terraform"

  visibility = "public"
  auto_init=true
}

