#!/bin/bash

set -xe

#CHROMIUM_REL=65.0.3325.109
CHROMIUM_REL=70.0.3518.0

BASEDIR=$PWD

if [ ! -d depot_tools ]
then
	git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
fi

export PATH=$PWD/depot_tools:$PATH

if [ ! -d src ]
then
	fetch --nohooks android
	echo "target_os = [ 'android' ]" >> .gclient
fi

cd src

git fetch --tags

git checkout $CHROMIUM_REL

gclient sync --with_branch_heads

build/install-build-deps-android.sh

gclient runhooks

# build
gn gen --args='target_os="android"' out/Default

ninja -C out/Default chrome_public_apk

# generate studio project
build/android/gradle/generate_gradle.py --output-directory out/Default --project-dir $BASEDIR/chromium_android
