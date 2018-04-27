#!/bin/bash
BUILD_REPO_URL=https://github.com/akhavr/electrum-monetaryunit.git

cd build

if [[ -z $TRAVIS_TAG ]]; then
  exit 0
else
  git clone --branch $TRAVIS_TAG $BUILD_REPO_URL electrum-monetaryunit
fi

docker run --rm -v $(pwd):/opt -w /opt/electrum-monetaryunit -t akhavr/electrum-monetaryunit-release:Linux /opt/build_linux.sh
docker run --rm -v $(pwd):/opt -v $(pwd)/electrum-monetaryunit/:/root/.wine/drive_c/electrum -w /opt/electrum-monetaryunit -t akhavr/electrum-monetaryunit-release:Wine /opt/build_wine.sh
