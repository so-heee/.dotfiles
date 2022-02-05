local map = require('utils').map

map('v', 'v', '<Plug>(expand_region_expand)', { noremap = false })
map('v', '<c-v>', '<Plug>(expand_region_shrink)', { noremap = false })
