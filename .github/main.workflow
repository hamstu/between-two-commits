workflow "Build Gatsby Site" {
  on = "push"
  resolves = ["build"]
}

action "master" {
  uses = "actions/bin/filter@master"
  args = "branch master"
}

action "build" {
    uses = "./.github/actions/build-and-deploy"
    needs = ["master"]
    args = "wow ok args!"
}
