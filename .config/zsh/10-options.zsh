#----------------------------------------
# Options
#----------------------------------------

setopt combining_chars              # 補完時に濁点・半濁点を <3099> <309a> のように表示させない
setopt interactive_comments         # コマンドラインでの#以降をコメントと見なす
setopt rc_quotes                    # シングルクォートで囲まれた文字列内部でシングルクォート自身を表現する時に '''' による表現を許可
unsetopt mail_warning               # メールファイルにアクセスした場合、警告メッセージを出力しない
setopt long_list_jobs               # デフォルトでは、ジョブを長い形式で一覧表示
setopt auto_resume                  # サスペンド中のプロセスと同じコマンド名を実行した場合はリジューム
setopt notify                       # バックグラウンドジョブの状態の報告を、次のプロンプトを表示するまで待つのではなく、即座に行う
unsetopt bg_nice                    # 全てのバックグラウンドジョブを低優先度で実行しない
unsetopt hup                        # シェル終了時にジョブを強制終了しない
unsetopt check_jobs                 # シェルの終了時にジョブについてレポートしない
setopt brace_ccl                    # 範囲指定できるようにする 例 : mkdir {1-3} で フォルダ1, 2, 3を作れる
# setopt correct_all                  # コマンドライン全てのスペルチェックをする
setopt nocorrect                    # スペルチェック無効
setopt print_eight_bit              # 日本語ファイル名等8ビットを通す
setopt magic_equal_subst            # コマンドラインの引数でも補完を有効にする（--prefix=/userなど）
setopt auto_param_keys              # カッコの対応などを自動的に補完
setopt print_exit_value             # 終了ステータスが0以外の場合にステータスを表示する

#----------------------------------------
# Directory
#----------------------------------------

setopt auto_cd                      # ディレクトリ名のみ入力時、cdを適応させる
setopt auto_pushd                   # cd実行時、ディレクトリスタックにpushされる
setopt pushd_ignore_dups            # ディレクトリスタックに重複する物は古い方を削除
setopt pushd_to_home                # 引数が指定されていない場合にホームディレクトリにプッシュ
setopt multios                      # 複数の記述子に書き込み
setopt extended_glob                # 拡張グロブ構文を使用
setopt noclobber                    # リダイレクトで上書き禁止
setopt mark_dirs                    # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt list_types                   # 補完候補一覧でファイルの種別を識別マーク表示 (訳注:ls -F の記号)
setopt globdots                     # 明確なドットの指定なしで.から始まるファイルをマッチ
setopt always_last_prompt           # カーソル位置は保持したままファイル名一覧を順次その場で表示

#----------------------------------------
# History
#----------------------------------------

setopt extended_history             # 履歴に実行時間も保存
setopt share_history                # すべてのセッション間で履歴を共有
setopt hist_expire_dups_first       # 履歴がいっぱいの時は最も古いものを先ず削除
setopt hist_ignore_dups             # 直前と同じコマンドは履歴に追加しない
setopt hist_ignore_all_dups         # 入力したコマンドを履歴に登録する時、同一がすでに存在した場合登録しない
setopt hist_find_no_dups            # 履歴検索中、重複を飛ばす
setopt hist_ignore_space            # 余分な空白は詰めて記録
setopt hist_save_no_dups            # 入力したコマンドが直前のものと同一なら古いコマンドのほうを削除
setopt hist_verify                  # ヒストリを呼び出してから実行する間に一旦編集できる状態になる

#----------------------------------------
# Completion
#----------------------------------------

setopt complete_in_word             # カーソル位置で補完
setopt always_to_end                # 補完後に末尾に移動
setopt path_dirs                    # コマンド名にスラッシュが含まれていても、パス探索を行う
setopt auto_menu                    # 補完候補が複数あるときに自動的に一覧表示する
setopt auto_list                    # 補完候補が複数ある時に、一覧表示
setopt auto_param_slash             # 補完した値がパスだった場合、自動的に/を付与する
unsetopt menu_complete              # 曖昧な補完の際に、可能なリストを表示してビープを鳴らすのではなく、最初にマッチしたものをいきなり挿入
setopt no_flow_control              # C-s, C-qを無効にする。

#----------------------------------------
# Beep
#----------------------------------------

setopt no_beep                      # ビープ音を鳴らさない
setopt no_list_beep                 # 補完候補表示時にビープ音を鳴らさない
setopt no_hist_beep                 # 履歴表示時にビープ音を鳴らさない
