#!/usr/bin/bash
# 環境変数の初期設定

# 初期値peeというユーザーを作成、初期値powというPWを設定
export __SOCL_USER=${__SOCL_USER:="pee"}
useradd -mN ${__SOCL_USER} -s /bin/bash

# パスワードの指定があれば設定する。初期値は『無し』
export __SOCL_PASS=${__SOCL_PASS:=""}

# パスワードが8文字未満だエラーなので『無し』扱いにする
if [ ${#__SOCL_PASS} -lt 8 ]; then
    __SOCL_PASS=""
fi

# 指定ユーザーのパスワード変更
if [ "${__SOCL_PASS}" != "" ]; then
    echo -e "${__SOCL_USER}:${__SOCL_PASS}" | chpasswd
fi

# ユーザーをグループに追加(初期値は同名)
export __SOCL_GROUP=${__SOCL_GROUP:=${__SOCL_USER}}
groupadd -f ${__SOCL_GROUP}
usermod  -g ${__SOCL_GROUP} ${__SOCL_USER} &>/dev/null

# sudoでroot権限のコマンドを実行できるように指定
gpasswd -a ${__SOCL_USER} sudo
