# ビープ音
setopt no_beep
setopt no_list_beep
setopt no_hist_beep

# コマンドラインの引数でも補完を有効にする（--prefix=/userなど）
setopt magic_equal_subst

# cd -<tab>で以前移動したディレクトリを表示
setopt auto_pushd

# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash

# ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt mark_dirs

# 補完候補一覧でファイルの種別を識別マーク表示 (訳注:ls -F の記号)
setopt list_types

# 補完キー連打で順に補完候補を自動で補完
setopt auto_menu

# カッコの対応などを自動的に補完
setopt auto_param_keys

# カーソル位置は保持したままファイル名一覧を順次その場で表示
setopt always_last_prompt

#日本語ファイル名等8ビットを通す
setopt print_eight_bit

# 明確なドットの指定なしで.から始まるファイルをマッチ
setopt globdots

# 範囲指定できるようにする
# 例 : mkdir {1-3} で フォルダ1, 2, 3を作れる
setopt brace_ccl

# コマンドライン全てのスペルチェックをする
setopt correct_all

# 終了ステータスが0以外の場合にステータスを表示する
setopt print_exit_value