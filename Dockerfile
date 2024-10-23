FROM ubuntu:24.04

ARG __SOCL_BUILD_SCRIPTS \
    __SOCL_ENTRY_SCRIPT \
    __SOCL_OTHER_DATA \
    __SOCL_USER \
    __SOCL_PASS \
    __SOCL_GROUP

# 初期化時に必要なスクリプトの転送
COPY /__InitScripts /__InitScripts

# ビルド時や実行時に必要なスクリプトの転送
# 転送元は環境変数から取得
COPY $__SOCL_BUILD_SCRIPTS /BuildScripts
COPY $__SOCL_ENTRY_SCRIPT  /EntryScript
COPY $__SOCL_OTHER_DATA    /OtherData

SHELL ["/usr/bin/bash", "-c", "source"]
#RUN ["/__InitScripts/initScript_1.sh"]
#RUN source /__InitScripts/initScript_1.sh

#ONBUILD RUN ["/__InitScripts/initScript_2.sh"]
#ONBUILD RUN ["/__InitScripts/BuildScript.sh"]

#ENTRYPOINT ["/__InitScripts/socl.sh"]
ENTRYPOINT ["/usr/bin/bash"]
