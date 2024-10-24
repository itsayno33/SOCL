FROM ubuntu:24.04
#FROM ubuntu-2404_udt-udt20241023:latest

# 初期化時に必要なスクリプトの転送
COPY ./__InitScripts /__InitDir

# ビルド時や実行時に必要なスクリプトの転送
# 転送元は環境変数から取得
#COPY ./${__SOCL_BUILD_DIR} /BuildDir
#COPY ./${__SOCL_ENTRY_DIR} /EntryDir
#COPY ./${__SOCL_OTHER_DIR} /OtherDir

# スクリプトの実行方法設定
SHELL ["/usr/bin/bash", "-c", "source"]

# 必要なディレクトリ作成・権限設定
RUN ["/__InitDir/initScript_1.sh"]

# エントリーポイント
ENTRYPOINT ["/__InitDir/socl.sh"]

LABEL MAINTAINER="itsayno33@gmail.com" LICENCE="Apache Licence,Version 2.0" DISCRIPTION="SoCL (the Sdk fOr the Customized Linux)"
