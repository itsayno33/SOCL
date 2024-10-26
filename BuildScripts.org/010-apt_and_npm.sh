#!/bin/bash

# コマンドツール類のインストール 
apt update && apt install -y sudo vim less

# npm(安定版)のインストール
apt nodejs npm
npm install -g
n lts # stable もしくは lts
hash -r
apt purge -y nodejs npm
