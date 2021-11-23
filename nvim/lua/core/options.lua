local opt = vim.opt
local g = vim.g

--------------------------------------
-- settings
--------------------------------------
g.noswapfile			= true		-- スワップファイルを作らない
opt.shortmess:append('c')
opt.showmatch			= true		-- 対応する括弧をハイライト表示する
opt.visualbell			= true		-- ビープ無効

--------------------------------------
-- visual settings
--------------------------------------
opt.title       		= true		-- タイトルを表示
opt.number	        	= true		-- 行番号を表示
opt.cursorline			= true		-- 現在の行を強調表示
opt.virtualedit			= 'onemore'	-- 行末の1文字先までカーソルを移動できるように
opt.laststatus			= 2		-- ステータスラインを常に表示
opt.clipboard			= "unnamedplus"	-- クリップボードに保存
opt.splitbelow			= true		-- 新規ウィンドウは下に開く

--------------------------------------
-- tab settings
--------------------------------------
opt.tabstop	        	= 4		-- tabの幅
opt.expandtab			= true		-- tabをスペースにする
opt.smartindent			= true		-- スマートインデント
opt.autoindent			= true		-- オートインデント
opt.softtabstop			= 4		-- キーボードから入力した場合のtabの幅
opt.shiftwidth			= 4		-- 自動で挿入/削除されるインデントの量

--------------------------------------
-- search setting
--------------------------------------
opt.ignorecase			= true		-- 検索文字列が小文字の場合は大文字小文字を区別なく検索する
opt.smartcase			= true		-- 検索文字列に大文字が含まれている場合は区別して検索する
opt.incsearch			= true		-- 検索文字列入力時に順次対象文字列にヒットさせる
opt.wrapscan			= true		-- 検索時に最後まで行ったら最初に戻る
opt.hlsearch			= true		-- 検索語をハイライト表示

--------------------------------------
-- colorscheme setting(あってるか怪しい)
--------------------------------------
vim.cmd('filetype plugin indent on')
g.syntax_on			    = true
opt.termguicolors		= true
