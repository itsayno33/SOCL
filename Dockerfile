#FROM ubuntu:24.04
FROM itsayno33/ubuntu_udt:2024-10-26

# 初期化時に必要なスクリプトの転送
COPY ./__InitScripts /__InitDir

# ビルド時や実行時に必要なスクリプトの転送
#COPY ./my/build/scripts/path /BuildDir
#COPY ./my/entry/point/path   /EntryDir
#COPY ./other/data/path       /OtherDir

# スクリプトの実行方法設定
SHELL ["/usr/bin/bash", "-c", "source"]

# ユーザー・グループの作成や
# ユーザー・グループの作成や
# 必要なディレクトリ作成・権限設定
# ビルド用スクリプトの実行
RUN ["/__InitDir/initScript.sh"]


# エントリーポイント
ENTRYPOINT ["/__InitDir/socl.sh"]

LABEL MAINTAINER="itsayno33@gmail.com" LICENCE="Apache Licence,Version 2.0" DISCRIPTION="SoCL (the Sdk fOr the Customized Linux)"
