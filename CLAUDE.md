# CLAUDE.md

このファイルは、Claude Code (claude.ai/code) がこのリポジトリでコードを操作する際のガイダンスを提供します。

## リポジトリ概要

これは、macOS開発環境の設定ファイルとセットアップスクリプトを管理する個人用dotfilesリポジトリです。設定ファイルを`.config/`に保存し、ホームディレクトリの適切な場所にリンクするシンボリックリンクベースのアプローチを使用しています。

## 共通コマンド

### 初期セットアップ
```bash
# 完全セットアップ（Homebrewのインストール、全ツールの設定）
make all

# Homebrewパッケージのみインストール
make brew-install

# 個別コンポーネントのセットアップ
make setup-zsh
make setup-git
make setup-nvim
make setup-tmux
make setup-karabiner
make setup-hammerspoon
make setup-cheat
make setup-starship
make setup-wezterm
make setup-lazygit
```

### 開発ツール
```bash
# Homebrewパッケージのインストール/更新
brew bundle

# Homebrewの更新
brew update && brew doctor && brew cleanup

# 利用可能なmakeターゲット一覧
make list

# 個別セットアップスクリプトの実行
./scripts/nvim.sh
./scripts/zsh.sh
```

## アーキテクチャ

### ディレクトリ構造
- `.config/` - ツール別に整理された全設定ファイル
- `scripts/` - 個別ツール用のセットアップスクリプト（各スクリプトがシンボリックリンクを作成）
- `Brewfile` - Homebrewパッケージ定義
- `Makefile` - セットアップタスクのメインオーケストレーション

### セットアップ戦略
各ツールは`scripts/`内に独自のセットアップスクリプトを持ち、以下を実行します：
1. `.config/{tool}`から`$HOME`内の適切な場所へのシンボリックリンク作成
2. ツール固有のセットアップ要件の処理
3. 独立して実行可能、または完全セットアップの一部として実行可能

### 主要な設定エリア
- **シェル**: カスタムエイリアス、関数、プロンプト（starship）を持つzsh
- **エディタ**: カスタム設定を持つNeovim、Cursor
- **ターミナル**: WezTerm（メイン）、tmux設定、Alacritty/Kitty設定も含む
- **開発**: Git、LazyGit、各種CLIツール（bat、eza、fzf、ripgrep、gh、ghqなど）
- **macOS**: キーリマッピング用Karabiner-Elements、自動化用Hammerspoon、Raycast
- **パッケージ管理**: Homebrew（formulaeとcask）、ランタイム管理用mise
- **AI**: ChatGPT、Claude、Gemini（GUI apps）

### シンボリックリンク管理
セットアップスクリプトは`ln -sfnv`を使用してシンボリックリンクを作成し、以下を保証します：
- 既存のリンクを強制上書き（`-f`）
- シンボリックリンクをたどらない（`-n`）
- 詳細出力（`-v`）
- シンボリックリンクを作成（`-s`）

## ツール固有の注意事項

- **Neovim**: 設定は`.config/nvim/`に保存、Lazy.nvimでプラグイン管理、初回起動時に自動でプラグインインストール
- **Zsh**: oh-my-zshを使わないカスタム設定、プラグイン管理にzinitを使用
- **Git**: diff強調表示用deltaとカスタムエイリアスを含む、グローバル設定は`.config/git/`に保存
- **Tmux**: カスタムキーバインドとステータスバー設定
- **Karabiner**: 生産性向上のための複雑なキーリマッピングルール、設定は`.config/karabiner/`に保存
- **Cheat**: 個人用チートシートは`.config/cheat/cheatsheets/personal/`に保存
- **WezTerm**: メインターミナル、設定は`.config/wezterm/`に保存
- **Starship**: シェルプロンプト、設定は`.config/starship/`に保存
- **Hammerspoon**: macOS自動化、Luaスクリプトで設定

## よく使用されるBrewfileパッケージ

主要なCLIツール:
- `bat` - catの代替（シンタックスハイライト付き）
- `eza` - lsの代替（カラー表示）
- `fzf` - ファジーファインダー
- `ripgrep` - grepの代替（高速検索）
- `gh` - GitHub CLI
- `ghq` - リポジトリ管理
- `lazygit` - Git TUI
- `mise` - ランタイムバージョン管理