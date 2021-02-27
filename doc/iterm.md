# iTermの設定

## zplugのインストールチェックを有効に変更

/Users/s_mochizuki/.dotfiles/zsh/10_plugins.zsh



終わったらコメントアウト

## iterm起動して以下の警告が出たらそれぞれ実行

```
zsh compinit: insecure directories, run compaudit for list.
Ignore insecure directories and continue [y] or abort compinit [n]?

# 実行して同じ内容が出るか確認
% compaudit
There are insecure directories:
/usr/local/share/zsh/site-functions
/usr/local/share/zsh

# 同じ内容だった場合は以下を実行
chmod 755 /usr/local/share/zsh/site-functions
chmod 755 /usr/local/share/zsh
```

## 設定ファイルのインポート

- Preferences-General-Preference
- Load preference from a custom folder or URLにチェックを入れる
- フォルダに.dotfiles/itermを設定
- Copyするか聞かれたら'Don't Copy'を選択
- Save changesはManuallyを選択
- セキュリティとプライバシー-アクセシビリティでiTermを許可


## 設定の反映

- macを再起動（再起動しないと反映されない）