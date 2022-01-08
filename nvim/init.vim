filetype plugin indent on " ファイルタイプ識別
syntax enable

"----------------------------------------
" python settings
"----------------------------------------
let g:python3_host_prog = system('echo -n $(which python3)')

runtime options.vim
runtime maps.vim
runtime plugins.vim

if exists('g:vscode')
    runtime vscode/settings.vim
endif

