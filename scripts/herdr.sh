#!/bin/bash

echo "### Setting Herdr..."
mkdir -p ${HOME}/.config/herdr
ln -sfnv ${HOME}/.dotfiles/.config/herdr/config.toml ${HOME}/.config/herdr/config.toml

# エージェント連携フック（~/.claude/settings.json などに書き込まれる）
# ユーザー名入りの絶対パスを含むため dotfiles には入れず、ここで毎回インストールする
if command -v herdr >/dev/null 2>&1; then
  herdr integration install claude
  herdr integration install codex
else
  echo "herdr が見つからないため、エージェント連携フックの設定をスキップします"
fi
