#!/usr/bin/bash

# 引数を$TARGに退避
declare -a TARG=( )
for arg; do
    TARG=( "${TARG[@]}" $arg )
done

# 環境変数の初期化
export __SOCL_USER=${__SOCL_USER:-socl} # ユーザー名の設定。初期値は『socl』
export __SOCL_PASS=${__SOCL_PASS:-socl} # パスワードの指定があれば設定する。初期値は『socl』
export __SOCL_GROUP=${__SOCL_GROUP:-users} # グループ名の設定。初期値はusers

# 環境変数で指定されたユーザーの作成
source /__InitDir/createUser.sh

# 環境変数で指定されたユーザーの作成
source /__InitDir/createUser.sh

# 各種フォルダの作成
source /__InitDir/initDir.sh

# 各種フォルダの(実行)権限・オーナーの初期化(ビルド後の初回実行時のみ)
source /__InitDir/initDir.sh

# ユーザー指定のroot用シェルスクリプトの実行(BuildDirに存在するもの)
source /__InitDir/rootScripts.sh

# EntryScriptsの実行(フォルダ内のシェルスクリプトを名前順で検索して最後のスクリプトだけを実行。引数も使用する)
source /__InitDir/userScript.sh

# Test用エントリーポイント
#source /__InitDir/echoTest.sh
usr/bin/bash -i
