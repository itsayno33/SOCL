#!/usr/bin/bash

# 環境変数で指定されたユーザーの作成
if ! id "${__SOCL_USER}" &> /dev/null ; then

# 初期値rootというユーザーを作成する
    useradd -mN "${__SOCL_USER}" -s /bin/bash


# パスワードが8文字未満だとエラーなので『無し』扱いにする
    if [ ${#__SOCL_PASS} -lt 8 ]; then
        __SOCL_PASS=
    fi

# 指定ユーザーのパスワード変更
    if [ "${__SOCL_PASS}" != "" ]; then
        echo -e "${__SOCL_USER}:${__SOCL_PASS}" | chpasswd
    fi

# ユーザーをグループに追加(初期値はusers)
    groupadd -f ${__SOCL_GROUP}
    usermod  -aG "${__SOCL_GROUP}" ${__SOCL_USER} &>/dev/null

# sudoでroot権限のコマンドを実行できるように指定
    gpasswd -a ${__SOCL_USER} sudo &> /dev/null
    echo "${__SOCL_USER} ALL=(root) NOPASSWD: ALL" >> /etc/sudoers
fi
