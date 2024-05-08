require('user/plugins')
require('user/options')

-- Highlight when searching, then disable when done
vim.cmd 'autocmd CmdlineEnter /,? :set hlsearch'
vim.cmd 'autocmd CmdlineLeave /,? :set nohlsearch'
