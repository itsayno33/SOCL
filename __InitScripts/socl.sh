#!/usr/bin/bash

if [ ! -f /__InitDir/tmp/build_ok ]; then
    source /__InitDir/initScript_2.sh
    source /__InitDir/buildScripts.sh
    if   [ $? -eq 0 ]; then touch /__InitDir/tmp/build_ok ;  fi #ビルドに成功していたらフラグを立てる
fi

source /__InitDir/echoTest.sh
usr/bin/bash -i
