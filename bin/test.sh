#!/bin/bash

set -x

function bloop_version {
  grep "val bloop" build.sbt | sed 's|[^0-9.]||g'
}

curl -Lo coursier https://git.io/coursier-cli && chmod +x coursier
./coursier launch ch.epfl.scala:bloopgun-core_2.12:$(bloop_version) -- about

sed -i 's/\r//g' .jvmopts

bash -x $(which sbt) "$1"
# sbt must be the last command - its exit code signals if tests passed or not
