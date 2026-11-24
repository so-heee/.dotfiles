#----------------------------------------
# Functions
#----------------------------------------

#----------------------------------------
# Setting zoxide with fzf
#----------------------------------------
fzf-z-search() {
    local res=$(zoxide query -l | fzf)
    if [ -n "$res" ]; then
        BUFFER+="cd $res"
        zle accept-line
    else
        return 1
    fi
}
zle -N fzf-z-search

#----------------------------------------
# Setting ghq
#----------------------------------------
function fzf-ghq-search() {
  local src=$(ghq list | fzf --preview "ls -laTp $(ghq root)/{} | tail -n+4 | awk '{print \$9\"/\"\$6\"/\"\$7 \" \" \$10}'")
  if [ -n "$src" ]; then
    BUFFER="cd $(ghq root)/$src"
    zle accept-line
  fi
  zle -R -c
}
zle -N fzf-ghq-search

#----------------------------------------
# Setting yazi
#----------------------------------------
function yazi-toggle() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	command rm -f -- "$tmp"
}
zle -N yazi-toggle


#----------------------------------------
# Setting tmux session
#----------------------------------------
function tm() {
    if [ -n "${1}" ]; then
        tmux attach-session -t ${1} || \
        tmux new-session -s ${1}
    else
        tmux attach-session || \
        tmux new-session
    fi
}

#----------------------------------------
# Setting herdr session
#----------------------------------------
function hd() {
    if [ -n "${1}" ]; then
        herdr --session "${1}"
    else
        herdr
    fi
}

#----------------------------------------
# herdr: リポジトリ別アイコンを workspace に送る（サイドバーの $repo_icon）
#----------------------------------------
if [[ -n "$HERDR_ENV" && -n "$HERDR_WORKSPACE_ID" ]]; then
    function _herdr_repo_icon() {
        local root icon
        root=$(git rev-parse --show-toplevel 2>/dev/null)
        case "${root:t}" in
            .dotfiles)       icon="🔧" ;;
            touchgift-apps)  icon="🚀" ;;
            touchgift-infra) icon="🌐" ;;
            "")              icon="📁" ;;
            *)               icon="📦" ;;
        esac
        # 値が変わったときだけ送る（バックグラウンドで実行してプロンプトを遅らせない）
        [[ "$icon" == "$_HERDR_REPO_ICON" ]] && return
        _HERDR_REPO_ICON="$icon"
        herdr workspace report-metadata "$HERDR_WORKSPACE_ID" \
            --source repo-icon --token "repo_icon=$icon" >/dev/null 2>&1 &!
    }
    add-zsh-hook chpwd _herdr_repo_icon
    _herdr_repo_icon
fi

#----------------------------------------
# herdr: 起動したエージェント別アイコンを pane に送る（Agents の $agent_icon）
#----------------------------------------
if [[ -n "$HERDR_ENV" && -n "$HERDR_PANE_ID" ]]; then
    function _herdr_with_agent_icon() {
        local icon="$1"; shift
        herdr pane report-metadata "$HERDR_PANE_ID" \
            --source agent-icon --token "agent_icon=$icon" >/dev/null 2>&1 &!
        command "$@"
        local rc=$?
        herdr pane report-metadata "$HERDR_PANE_ID" \
            --source agent-icon --clear-token agent_icon >/dev/null 2>&1 &!
        return $rc
    }
    function claude() { _herdr_with_agent_icon "" claude "$@" }
    function codex()  { _herdr_with_agent_icon "" codex "$@" }
fi
