# dotfiles

macOS の開発環境の設定ファイルとセットアップスクリプト。

## 🚀 Setup

```bash
git clone git@github.com:so-heee/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
make all     # Homebrew のインストールと主要ツールの設定
make list    # 個別のセットアップ（make setup-<tool>）の一覧
```

## 🛠️ Tools

### 🔤 Font
- [Moralerspace](https://github.com/yuru7/moralerspace)（Argon）
- [Symbols Nerd Font](https://github.com/ryanoasis/nerd-fonts)（Moralerspace に無いアイコンの補完用）

### 🖥️ Terminal・Shell
- Terminal: [WezTerm](https://wezfurlong.org/wezterm/)
- Shell: [Zsh](https://www.zsh.org/) + [sheldon](https://github.com/rossmacarthur/sheldon)（プラグイン管理）
- Prompt: [Starship](https://starship.rs/)
- Multiplexer: [tmux](https://github.com/tmux/tmux) / [herdr](https://herdr.dev/)（AI エージェント用）

### ✏️ Editor・IDE
- [Neovim](https://neovim.io/)（[lazy.nvim](https://github.com/folke/lazy.nvim)）
- [Visual Studio Code](https://code.visualstudio.com/)

### 🤖 AI
- [Claude Code](https://claude.com/claude-code)
- [Codex](https://github.com/openai/codex)
- [Orca](https://orca.dev/)（AI エージェントのオーケストレーション）

### 💻 CLI
- [bat](https://github.com/sharkdp/bat) / [eza](https://github.com/eza-community/eza) / [fzf](https://github.com/junegunn/fzf) / [ripgrep](https://github.com/BurntSushi/ripgrep) / [zoxide](https://github.com/ajeetdsouza/zoxide)
- [yazi](https://github.com/sxyazi/yazi)（ファイラ）/ [lazygit](https://github.com/jesseduffield/lazygit)
- [gh](https://cli.github.com/) / [ghq](https://github.com/x-motemen/ghq)
- [cheat](https://github.com/cheat/cheat)（チートシート）

### 🔧 Other Tools
- Runtime: [mise](https://mise.jdx.dev/)
- Launcher: [Raycast](https://www.raycast.com/)
- Keyboard: [Karabiner-Elements](https://karabiner-elements.pqrs.org/)
- Automation: [Hammerspoon](https://www.hammerspoon.org/)
- Browser: [Google Chrome](https://www.google.com/chrome/)
- Document: [Notion](https://www.notion.so/)

## 📜 History

ツールの乗り換えの記録（Brewfile とコミット履歴から整理）。

| 分類 | 遍歴 |
|---|---|
| Terminal | iTerm2（2021〜）→ Alacritty / Kitty（2022〜）→ **WezTerm**（2025-07〜） |
| Font | HackGen Nerd Font（〜2025-10）→ **Moralerspace Argon + Symbols Nerd Font**（2025-11〜） |
| zsh プラグイン管理 | zplug（2021）→ zinit（2022〜）→ **sheldon**（2025-11〜） |
| Prompt | → **Starship**（2025-08〜） |
| Runtime 管理 | anyenv（2021）→ asdf（2022-01〜）→ **mise**（2025-07〜） |
| Editor | Vim（2019〜）→ **Neovim**（2022〜） |
| Neovim プラグイン管理 | packer.nvim（2022）→ **lazy.nvim**（2023-02〜） |
| Neovim ファイラ | neo-tree.nvim（2023-03〜）→ **yazi**（2026〜） |
| GUI エディタ | VS Code（2021〜）→ Cursor（2025-07〜）→ Zed（2026〜）→ **VS Code** |
| Launcher | Alfred（2021〜）→ **Raycast**（2025-07〜） |
| ls | exa → **eza**（2025-07〜） |
| AI エージェント | **Claude Code**（2025〜）/ **Codex**（2025 年末〜）→ **herdr**（2026-09〜）/ **Orca**（2026-11〜、herdr と比較中） |
