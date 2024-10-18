#!/bin/bash

# 環境変数の初期設定

# 初期値peeというユーザを作成、初期値powというPWを設定
${__SOCL_USER:="pee"}
${__SOCL_PASS:="pow"}
useradd -mN /bin/bash -s ${__SOCL_USER}
echo "${__SOCL_USER}:${__SOCL_PASS}" | chpasswd

# ユーザーをグループに追加(初期値は同名)
${__SOCL_GROUP:=${__SOCL_USER}}
groupadd -f ${__SOCL_GROUP}
usermod  -g ${__SOCL_GROUP} ${__SOCL_USER}

# sudoでroot権限のコマンドを実行できるように指定
gpasswd -a ${__SOCL_USER} sudo

# ビルド時に必要なスクリプトを置くフォルダの作成
mkdir  -p /BuildScripts
chgmod -R a=+x /BuildScripts
chgown -R "${__SOCL_USER}:${__SOCL_GROUP}" /BuildScripts

# その他いろいろ用のフォルダの作成
mkdir  -pm 777 /BuildData
chgown -R "${__SOCL_USER}:${__SOCL_GROUP}" /BuildData
