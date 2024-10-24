#!/usr/bin/bash

# 初期値rootというユーザーを作成する
export __SOCL_USER=${__SOCL_USER:-pee}
useradd -mN "${__SOCL_USER}" -s /bin/bash

# パスワードの指定があれば設定する。初期値は『無し』
export __SOCL_PASS=${__SOCL_PASS}

# パスワードが8文字未満だエラーなので『無し』扱いにする
if [ ${#__SOCL_PASS} -lt 8 ]; then
    __SOCL_PASS=
fi

# 指定ユーザーのパスワード変更
if [ "${__SOCL_PASS}" != "" ]; then
    echo -e "${__SOCL_USER}:${__SOCL_PASS}" | chpasswd
fi

# ユーザーをグループに追加(初期値は同名)
export __SOCL_GROUP=${__SOCL_GROUP:-${__SOCL_USER}}
groupadd -f ${__SOCL_GROUP}
usermod  -aG "${__SOCL_GROUP}" ${__SOCL_USER} &>/dev/null

# sudoでroot権限のコマンドを実行できるように指定
gpasswd -a ${__SOCL_USER} sudo
echo "${__SOCL_USER} ALL=(root) NOPASSWD: ALL" >> /etc/sudoers


# 初期化時に必要なスクリプトを置くフォルダへの実行権付与とオーナー変更
chmod -R a+x   /__InitDir
chown -R "${__SOCL_USER}:${__SOCL_GROUP}" /__InitDir

# ビルド時に必要なスクリプトを置くフォルダへの実行権付与とオーナー変更
chmod -R a+x   /BuildDir
chown -R "${__SOCL_USER}:${__SOCL_GROUP}" /BuildDir

# 実行時に必要なスクリプトを置くフォルダへの実行権付与とオーナー変更
chmod -R a+x  /EntryDir
chown -R "${__SOCL_USER}:${__SOCL_GROUP}" /EntryDir

# その他いろいろ用のフォルダのオーナー変更
chown -R "${__SOCL_USER}:${__SOCL_GROUP}" /OtherDir
