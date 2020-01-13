# Pretzo
Preztoインストール後に以下を編集

テーマ設定v(powerlevel9k)
```.zpreztorc
# Set the prompt theme to load.
# Setting it to 'random' loads a random theme.
# Auto set to 'off' on dumb terminals.
zstyle ':prezto:module:prompt' theme 'powerlevel9k'
```

モジュール追加(syntax-highlighting,history-substring-search,autosuggestions)
```.zpreztorc
# Set the Prezto modules to load (browse modules).
# The order matters.
zstyle ':prezto:load' pmodule \
  'environment' \
  'terminal' \
  'editor' \
  'history' \
  'directory' \
  'spectrum' \
  'utility' \
  'completion' \
  'syntax-highlighting' \
  'history-substring-search' \
  'autosuggestions' \
  'prompt'
```

Prezto削除
```
rm -rf ~/.zprezto ~/.zlogin ~/.zlogout ~/.zpreztorc ~/.zprofile ~/.zshenv ~/.zshrc
```