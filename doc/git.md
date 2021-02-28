# gitの設定

## 公開鍵の作成

```
# 以下のコマンドを実行（パスワードは未入力でEnter3回）
ssh-keygen -t rsa -b 4096 -C "so.heee.mochi@gmail.com"
```

## .sshフォルダ

- .sshフォルダが作成される
- .dotfiles/.sshからconf.dとconfigをコピー
- conf.d/temlate.confをgithub.confへ変更、以下の内容へ変更

```
Host github
  HostName github.com
  IdentityFile ~/.ssh/id_rsa
  User git
```

## Githubへ公開鍵を設定

- Setting-SSH and GCP keys-New SSH key
- 作成したid_rsa.pubの内容を設定

## 秘密鍵をssh-agentに登録する

```
# ssh-agentが動作しているか確認
eval "$(ssh-agent -s)"
Agent pid 32047

# 登録
ssh-add ~/.ssh/id_rsa
```

## 確認

```
ssh -T git@github.com

Are you sure you want to continue connecting (yes/no/[fingerprint])? yes # yesを入力

Hi so-heee! You've successfully authenticated, but GitHub does not provide shell access.
```

## SourceTreeの設定

- アカウント-追加
認証タイプ：OAuth
プロトコル：SSH
