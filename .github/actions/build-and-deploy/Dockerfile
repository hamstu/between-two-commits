FROM node:8

LABEL "com.github.actions.name"="Build and Deploy Gatsby"
LABEL "com.github.actions.description"="Build and deploy the Between Two Commits Gatsby blog."
LABEL "com.github.actions.icon"="rocket"
LABEL "com.github.actions.color"="orange"

LABEL "repository"="https://github.com/hamstu/between-two-commits"
LABEL "homepage"="http://betweentwocommits.com"
LABEL "maintainer"="Hamish Macpherson <hamstu@gmail.com>"

RUN apt-get update && apt-get -y install libgl1-mesa-glx

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
