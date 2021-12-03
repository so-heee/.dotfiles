UsePlugin 'dashboard-nvim'

lua <<EOF
vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_custom_header = {
[[      _/      _/  _/_/_/_/    _/_/    _/      _/  _/_/_/  _/      _/  ]],
[[     _/_/    _/  _/        _/    _/  _/      _/    _/    _/_/  _/_/   ]],
[[    _/  _/  _/  _/_/_/    _/    _/  _/      _/    _/    _/  _/  _/    ]],
[[   _/    _/_/  _/        _/    _/    _/  _/      _/    _/      _/     ]],
[[  _/      _/  _/_/_/_/    _/_/        _/      _/_/_/  _/      _/      ]],
}
vim.g.dashboard_custom_section = {
    a = {description = {'  Find File          '}, command = 'Telescope find_files'},
    d = {description = {'  Search Text        '}, command = 'Telescope live_grep'},
    b = {description = {'  Recent Files       '}, command = 'Telescope oldfiles'},
    e = {description = {'  Config             '}, command = 'vi ~/.config/nvim/init.vim'},
}
vim.g.dashboard_custom_footer = {'Do one thing, do it well - Unix Philosophy'}
EOF
