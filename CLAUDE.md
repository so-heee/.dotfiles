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
```

### 開発ツール
```bash
# Homebrewパッケージのインストール/更新
brew bundle

# Homebrewの更新
brew update && brew doctor && brew cleanup
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
- **エディタ**: カスタム設定を持つNeovim
- **ターミナル**: WezTerm、tmux設定
- **開発**: Git、lazy git、各種CLIツール
- **macOS**: キーリマッピング用Karabiner-Elements、自動化用Hammerspoon
- **パッケージ管理**: Homebrew（formulaeとcask）、ランタイム管理用mise

### シンボリックリンク管理
セットアップスクリプトは`ln -sfnv`を使用してシンボリックリンクを作成し、以下を保証します：
- 既存のリンクを強制上書き（`-f`）
- シンボリックリンクをたどらない（`-n`）
- 詳細出力（`-v`）
- シンボリックリンクを作成（`-s`）

## ツール固有の注意事項

- **Neovim**: 設定は`.config/nvim/`に保存、セットアップ後に手動でプラグインのインストールが必要
- **Zsh**: oh-my-zshを使わないカスタム設定、プラグイン管理にzinitを使用
- **Git**: diff強調表示用deltaとカスタムエイリアスを含む
- **Tmux**: カスタムキーバインドとステータスバー設定
- **Karabiner**: 生産性向上のための複雑なキーリマッピングルール
- **Cheat**: 個人用チートシートは`.config/cheat/cheatsheets/personal/`に保存