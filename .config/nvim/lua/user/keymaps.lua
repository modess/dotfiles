-- Space is my leader.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Save
vim.keymap.set('n', '<cr>', ':w<cr>')
vim.keymap.set('n', 'mm', ':w<cr>')

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided.
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Reselect visual selection after indenting.
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Maintain the cursor position when yanking a visual selection.
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
vim.keymap.set('v', 'y', 'myy`y')

-- Paste replace visual selection without copying it.
vim.keymap.set('v', 'p', '"_dP')

-- Easy insertion of a trailing ; or , from insert mode.
vim.keymap.set('i', '..', '<Esc>A;')
vim.keymap.set('i', ',,', '<Esc>A,')
vim.keymap.set('n', '..', 'A;<Esc>')
vim.keymap.set('n', ',,', 'A,<Esc>')

-- Switch between previous and current buffer
vim.keymap.set('n', '<leader><leader>', '<c-^>')

-- Esc in insert mode
vim.keymap.set('i', 'jj', '<Esc>');

-- Quickly clear search highlighting.
vim.keymap.set('n', '<Leader>k', ':nohlsearch<CR>')

-- Splits
vim.keymap.set('n', '<leader>|', ':vs<C-l><CR>')
vim.keymap.set('n', '<leader>-', ':split<CR>')
vim.keymap.set('n', '<c-left>', '<c-w>h')
vim.keymap.set('n', '<c-down>', '<c-w>j')
vim.keymap.set('n', '<c-up>', '<c-w>k')
vim.keymap.set('n', '<c-right>', '<c-w>l')
vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-l>', '<c-w>l')

-- Move lines up and down.
vim.keymap.set('i', '<A-j>', '<Esc>:move .+1<CR>==gi')
vim.keymap.set('i', '<A-k>', '<Esc>:move .-2<CR>==gi')
vim.keymap.set('n', '<A-j>', ':move .+1<CR>==')
vim.keymap.set('n', '<A-k>', ':move .-2<CR>==')
vim.keymap.set('v', '<A-j>', ":move '>+1<CR>gv=gv")
vim.keymap.set('v', '<A-k>', ":move '<-2<CR>gv=gv")

-- Shortcuts for changing word
vim.keymap.set('n', 'cc', 'cw');

-- Command
vim.keymap.set('n', '<leader>n', ':')
