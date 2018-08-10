#!/bin/bash

set -xe

export PATH=$PWD/depot_tools:$PATH

cd src

# build
gn gen --args='target_os="android"' out/Default

ninja -C out/Default chrome_public_apk

