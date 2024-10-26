#FROM ubuntu:24.04
FROM itsayno33/ubuntu_udt:2024-10-26

# 初期化時に必要なスクリプトの転送
COPY ./__InitScripts /__InitDir

# ビルド時や実行時に必要なスクリプトの転送
# 転送元は環境変数から取得
#COPY ./${__SOCL_BUILD_DIR} /BuildDir
#COPY ./${__SOCL_ENTRY_DIR} /EntryDir
#COPY ./${__SOCL_OTHER_DIR} /OtherDir
COPY ./BuildScripts /BuildDir
COPY ./EntryScript  /EntryDir

# スクリプトの実行方法設定
SHELL ["/usr/bin/bash", "-c", "source"]

# ユーザー・グループの作成や
# 必要なディレクトリ作成・権限設定
#RUN ["/__InitDir/initScript.sh"]


# エントリーポイント
ENTRYPOINT ["/__InitDir/socl.sh"]

LABEL MAINTAINER="itsayno33@gmail.com" LICENCE="Apache Licence,Version 2.0" DISCRIPTION="SoCL (the Sdk fOr the Customized Linux)"
