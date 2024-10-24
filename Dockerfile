FROM ubuntu:24.04

# 初期化時に必要なスクリプトの転送
COPY ./__InitScripts /__InitDir

# ビルド時や実行時に必要なスクリプトの転送
# 転送元は環境変数から取得
#COPY ./${__SOCL_BUILD_DIR} /BuildDir
#COPY ./${__SOCL_ENTRY_DIR} /EntryDir
#COPY ./${__SOCL_OTHER_DIR} /OtherDir

# スクリプトの実行方法設定
SHELL ["/usr/bin/bash", "-c", "source"]

# ユーザー作成・必要なディレクトリ作成・権限設定
RUN ["/__InitDir/initScript_1.sh"]

# 必要なフォルダの権限の再設定(子孫プログラムの権限変更に対応する)
ONBUILD RUN ["/__InitDir/initScript_2.sh"]
ONBUILD RUN ["/__InitDir/BuildScript.sh"]

# テスト用エントリーポイント
#ENTRYPOINT ["/__InitDir/socl.sh"]
ENTRYPOINT ["/usr/bin/bash"]
