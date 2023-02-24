-- Space is my leader.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Save
vim.keymap.set('n', '<cr>', ':w<cr>')
vim.keymap.set('n', 'mm', ':w<cr>')

-- Redo
vim.keymap.set('n', 'U', '<C-r>')

-- Keep centered when jumping search results
vim.keymap.set('n', 'n', 'nzz')

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided.
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Reselect visual selection after indenting.
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Maintain the cursor position when yanking a visual selection.
-- http://ddrscott.github.io/blog/2016/yank-without-jank
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

-- Esc and save in insert mode
vim.keymap.set('i', 'mm', '<Esc>:w<cr>');

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

-- Packer
vim.keymap.set('n', '<leader>Ps', ':PackerSync<cr>')
vim.keymap.set('n', '<leader>Pc', ':PackerCompile<cr>')

-- Hop
vim.keymap.set("n", "<leader>l", ":HopLine<cr>")
vim.keymap.set("n", "<leader>L", ":HopLineStart<cr>")
vim.keymap.set("n", "<leader>w", ":HopWord<cr>")
vim.keymap.set("n", "s", ":HopChar1<cr>")
vim.keymap.set("n", "S", ":HopChar2<cr>")

-- Git signs
vim.keymap.set('n', 'gn', ':Gitsigns next_hunk<CR>')
vim.keymap.set('n', 'gp', ':Gitsigns prev_hunk<CR>')
vim.keymap.set('n', 'gs', ':Gitsigns stage_hunk<CR>')
vim.keymap.set('n', 'gu', ':Gitsigns undo_stage_hunk<CR>')
vim.keymap.set('n', 'gP', ':Gitsigns preview_hunk<CR>')
vim.keymap.set('n', 'gb', ':Gitsigns blame_line<CR>')

-- Bufdelete
vim.keymap.set('n', '<Leader>q', ':Bdelete<CR>')
vim.keymap.set('n', '<Leader>Q', ':q<CR>')

-- Telescope
vim.keymap.set('n', '<leader>f', [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
vim.keymap.set('n', '<leader>F', [[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All Files' })<CR>]])
vim.keymap.set('n', '<leader>b', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
vim.keymap.set('n', '<leader>h', [[<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>]])
vim.keymap.set('n', '<leader>e', [[<cmd>lua require('telescope.builtin').oldfiles({ only_cwd = true })<CR>]])
vim.keymap.set('n', '<leader>s', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]])
vim.keymap.set('n', '<leader>gb', [[<cmd>lua require('telescope.builtin').git_branches()<CR>]])
vim.keymap.set('n', '<leader>gt', [[<cmd>lua require('telescope.builtin').git_stash()<CR>]])
vim.keymap.set('n', '<leader>gs', [[<cmd>lua require('telescope.builtin').git_status()<CR>]])
vim.keymap.set('n', '<leader>gc', [[<cmd>lua require('telescope.builtin').git_commits()<CR>]])
vim.keymap.set('n', '<leader>gf', [[<cmd>lua require('telescope.builtin').git_bcommits()<CR>]])

vim.keymap.set("n", "<leader>dd", "<cmd>Telescope dir find_files<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dw", "<cmd>Telescope dir live_grep<CR>", { noremap = true, silent = true })

-- LSP
vim.keymap.set('n', '<Leader>D', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '<leader>Gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', '<leader>Gn', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<CR>')
vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>')
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', '<leader>cf', '<cmd>lua vim.lsp.buf.formatting()<cr>')

-- Toggleterm
vim.keymap.set('n', '<leader>t', ':ToggleTerm<CR>')
vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

-- NvimTree
vim.keymap.set('n', '<Leader>nn', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<Leader>nf', ':NvimTreeFindFileToggle<CR>')

-- Bufferline
vim.keymap.set('n', '<A-l>', ':BufferLineCycleNext<cr>')
vim.keymap.set('n', '<A-h>', ':BufferLineCyclePrev<cr>')
vim.keymap.set('n', '<A-right>', ':BufferLineCycleNext<cr>')
vim.keymap.set('n', '<A-left>', ':BufferLineCyclePrev<cr>')
