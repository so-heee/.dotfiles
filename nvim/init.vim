filetype plugin indent on " ファイルタイプ識別
syntax enable

"----------------------------------------
" python settings
"----------------------------------------
let g:python_host_prog = $PYENV_ROOT.'/versions/neovim2/bin/python'
let g:python3_host_prog = $PYENV_ROOT.'/versions/neovim3/bin/python'

runtime options.vim
runtime maps.vim
runtime plugins.vim

if exists('g:vscode')
    runtime vscode/settings.vim
endif

