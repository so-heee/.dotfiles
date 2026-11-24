# CLAUDE.md

macOS 開発環境の設定ファイルとセットアップスクリプトを管理する個人用 dotfiles リポジトリ。
設定ファイルを `.config/` に置き、`scripts/` のスクリプトでホームディレクトリの所定の場所へシンボリックリンクを張る。

## 注意事項

- **このリポジトリは公開リポジトリ（GitHub: so-heee/.dotfiles）**。仕事の情報（社内リポジトリ名、AWS プロファイル名、踏み台サーバー名、SSM パスなど）や秘密情報をコミットしない
- `~/.claude/settings.json` などはこのリポジトリへのシンボリックリンクなので、ツール（Claude Code、Orca、herdr など）が書き込むとこのリポジトリに差分が出る
- 未コミットの変更が多くたまりやすい。コミットは内容ごとに分け、関係ない差分を混ぜない（ファイルの一部だけをコミットするときは部分ステージを使う）
- コミットメッセージは日本語で短く書く（例: `orca導入`、`eza設定変更`）

## よく使うコマンド

```bash
make all            # 全体セットアップ（Homebrew インストールと主要ツールの設定）
make list           # make ターゲット一覧
make brew-install   # Brewfile のパッケージをインストール
make setup-<tool>   # 個別セットアップ（scripts/<tool>.sh を実行）
brew bundle         # Brewfile の内容をインストール・更新
```

`make all` に含まれるもの: brew-install, zsh, git, workspace, karabiner, kitty, hammerspoon, nvim, tmux, herdr, cheat, starship, eza, yazi
個別に実行するもの: lazygit, asdf, broot, claude, wezterm, jetbrain, stylua, sheldon, bash

## ディレクトリ構成

| パス | 内容 |
|---|---|
| `.config/` | ツールごとの設定ファイル（下表） |
| `scripts/` | ツールごとのセットアップスクリプト。`ln -sfnv` でシンボリックリンクを作る |
| `doc/` | 手順メモ（`設定手順.md`、mac、git、tmux、karabiner、raycast、vscode、キーバインドなど） |
| `Brewfile` | Homebrew の formula / cask 定義（`Brewfile.lock.json` は gitignore） |
| `Makefile` | セットアップの入口。各ターゲットが `scripts/*.sh` を呼ぶ |
| `README.md` | リポジトリの説明 |
| `.claude/` | このリポジトリ用の Claude Code ローカル設定（`settings.local.json`、グローバル gitignore で除外） |

## `.config/` の各ツール

| ディレクトリ | ツール | リンク先 / 備考 |
|---|---|---|
| `.claude/` | Claude Code | `CLAUDE.md` → `~/.claude/CLAUDE.md`、`settings.json` → `~/.claude/settings.json`（`scripts/claude.sh`）。settings.json の扱いは下記 |
| `zsh/` | zsh | `.zshrc` / `.zshenv` → `~/`。番号順に読み込む分割設定（`00-env` → `10-options` → `20-completions` → `30-sheldon` → `40-tools` → `50-alias` → `60-functions` → `70-bindkeys` → `99-local`）。`99-local.zsh` はマシン固有の設定 |
| `sheldon/` | sheldon | zsh プラグイン管理。`plugins.toml` → `~/.config/sheldon` |
| `bash/` | bash | `.bashrc` → `~/.bashrc` |
| `git/` | Git | `.gitconfig` / `.gitignore_global` → `~/`。`.gitconfig.private` は個人用アカウントの設定 |
| `nvim/` | Neovim | ディレクトリごと `~/.config/nvim`。lazy.nvim でプラグイン管理（`lua/config/` と `lua/plugins/`） |
| `vim/` | Vim | `.vimrc` → `~/.vimrc` |
| `ideavim/` | IdeaVim | `.ideavimrc` → `~/.ideavimrc` |
| `wezterm/` | WezTerm（メインのターミナル） | `.wezterm.lua` → `~/.wezterm.lua` |
| `tmux/` | tmux | `.tmux.conf` → `~/.config/tmux/tmux.conf`。`.tmux.session.conf` などはセッション定義 |
| `herdr/` | herdr（エージェント用ターミナル多重化） | `config.toml` → `~/.config/herdr/config.toml` |
| `orca/` | Orca（AI エージェント用 IDE） | 設定は SQLite に保存されるためリンクしない。`README.md` に GUI での設定手順をメモ |
| `starship/` | Starship（プロンプト） | `starship.toml` → `~/.config/starship.toml` |
| `eza/` | eza | `themes/<THEME>.yml` → `~/.config/eza/theme.yml`（テーマを選んでリンク） |
| `yazi/` | yazi（ファイラ） | ディレクトリごと `~/.config/yazi`。プラグインは `package.toml` から復元（`plugins/` は gitignore） |
| `lazygit/` | LazyGit | `config.yml` → `~/.config/lazygit/config.yml` |
| `cheat/` | cheat | ディレクトリごと `~/.config/cheat`。個人用チートシートは `cheatsheets/personal/` |
| `stylua/` | StyLua | `stylua.toml` → `~/.config/stylua.toml` |
| `karabiner/` | Karabiner-Elements | ディレクトリごと `~/.config/karabiner` |
| `hammerspoon/` | Hammerspoon | ディレクトリごと `~/.hammerspoon` |
| `kitty/` / `alacritty/` | Kitty / Alacritty | ディレクトリごと `~/.config/` 配下（サブのターミナル） |
| `cursor/` | Cursor | `settings.json` / `keybindings.json`（スクリプトなし） |
| `iterm/` | iTerm2 | plist とカラースキーム（スクリプトなし） |
| `raycast/` | Raycast | 設定のエクスポート（スクリプトなし） |
| `.ssh/` | SSH | `config` と `conf.d/template.conf`（スクリプトなし） |

## Claude Code の settings.json の扱い

`.config/.claude/settings.json` には、リポジトリに反映する設定と、このマシンだけで使う設定が混在している。
JSON にはコメントを書けず、Orca や herdr がファイルを書き直すため、**キーの並び順で区別する**。

1. **上側: リポジトリに反映する設定**
   `language`、`permissions`、`statusLine`（ccstatusline はバージョン固定）、`enabledPlugins`、`extraKnownMarketplaces`、`tui`、`switchModelsOnFlag`、`voice`
2. **中間: `hooks`**
   - 反映する: `Stop` の afplay
   - 反映しない（ツールが自動で追加するもの）:
     - herdr のフック（`herdr-agent-state.sh`）。`herdr integration install claude` で追加される。ユーザー名入りの絶対パスを含むため公開しない
     - Orca のフック（`ORCA_AGENT_HOOK` / `~/.orca/agent-hooks/` を含むもの）。Orca の起動時に書き戻される
3. **下側: ローカルのみ（コミットしない）**
   `env`、`model`、`skipAutoPermissionPrompt`、`skipWorkflowUsageWarning`

コミットするときは上側と hooks の反映分だけをステージし、下側と Orca のフックは作業ツリーに残す。
新しいキーが追加されたら、どちらに置くかをユーザーに確認する。
