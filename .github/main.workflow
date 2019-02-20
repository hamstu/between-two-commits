workflow "Build Gatsby Site" {
  on = "push"
  resolves = ["build"]
}

action "master" {
  uses = "actions/bin/filter@master"
  args = "branch master"
}

action "build" {
    uses = "jzweifel/gatsby-cli-github-action@645c672"
    needs = ["master"]
    args = "build"
}
