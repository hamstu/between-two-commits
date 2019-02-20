workflow "Build Gatsby Site" {
  on = "push"
  resolves = ["build"]
}

action "master" {
  uses = "actions/bin/filter@master"
  args = "branch master"
}

action "build" {
    uses = "jzweifel/gatsby-cli-github-action@v1.0.0"
    needs = ["master"]
    args = "build"
}
