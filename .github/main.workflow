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
    secrets = ["BTC_SERVER_PRIVATE_KEY", "BTC_SERVER_DEST_PATH", "BTC_SERVER_IP", "BTC_SERVER_USER", "BTC_SERVER_SSH_PORT"]
}
