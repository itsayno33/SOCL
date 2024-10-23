#!/bin/bash

# 必要なパッケージの取得
#apt-get update
apt-get -y install sudo


# 初期値rootというユーザーを作成する
export __SOCL_USER=${__SOCL_USER:="root"}
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


# 初期化時に必要なスクリプトを置くフォルダの作成
mkdir  -pm 755 /InitScripts
chmod -R a+x   /InitScripts
chown -R root:root /InitScripts

# ビルド時に必要なスクリプトを置くフォルダの作成
mkdir  -pm 755 /BuildScripts
chmod -R a+x   /BuildScripts
chown -R "${__SOCL_USER}:${__SOCL_GROUP}" /BuildScripts

# 実行時に必要なスクリプトを置くフォルダの作成
mkdir -pm 755 /EntryScript
chmod -R a+x  /EntryScript
chown -R "${__SOCL_USER}:${__SOCL_GROUP}" /EntryScript

# その他いろいろ用のフォルダの作成
mkdir -pm 777 /OtherData
chown -R "${__SOCL_USER}:${__SOCL_GROUP}" /OtherData
