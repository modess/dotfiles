-- Space is my leader.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Save
vim.keymap.set('n', '<cr>', ':w<cr>')

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
vim.keymap.set('n', '<leader><leader>', '<c-^>', { desc = 'Switch to previous buffer'})

-- Quickly clear search highlighting.
vim.keymap.set('n', '<Leader>k', ':nohlsearch<CR>', { desc = 'Clear search highlighting' })

-- Splits
vim.keymap.set('n', '<leader>|', ':vs<C-l><CR>', { desc = 'Split vertical' })
vim.keymap.set('n', '<leader>-', ':split<CR>', { desc = 'Split horizontal' })
vim.keymap.set('n', '<c-left>', ':KittyNavigateLeft<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<c-down>', ':KittyNavigateDown<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<c-up>', ':KittyNavigateUp<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<c-right>', ':KittyNavigateRight<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<c-h>', ':KittyNavigateLeft<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<c-j>', ':KittyNavigateDown<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<c-k>', ':KittyNavigateUp<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<c-l>', ':KittyNavigateRight<cr>', { noremap = true, silent = true })

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
vim.keymap.set('n', '<leader>Ps', ':PackerSync<cr>', { desc = 'Sync plugins' })
vim.keymap.set('n', '<leader>Pc', ':PackerCompile<cr>', { desc = 'Compile plugins' })

-- Hop
vim.keymap.set("n", "<leader>l", ":HopLine<cr>", { desc = "Jump to line" })
vim.keymap.set("n", "<leader>L", ":HopLineStart<cr>", { desc = "Jump to line start" })
vim.keymap.set("n", "<leader>w", ":HopWord<cr>", { desc = "Jump to word" })
vim.keymap.set("n", "s", ":HopChar1<cr>", { desc = "Jump to character" })
vim.keymap.set("n", "S", ":HopChar2<cr>", { desc = "Jump to characters" })

-- Git
vim.keymap.set('n', 'gn', ':Gitsigns next_hunk<CR>', { desc = 'Next hunk' })
vim.keymap.set('n', 'gp', ':Gitsigns prev_hunk<CR>', { desc = 'Previous hunk' })
vim.keymap.set('n', 'gs', ':Gitsigns stage_hunk<CR>', { desc = 'Stage hunk' })
vim.keymap.set('n', 'gu', ':Gitsigns undo_stage_hunk<CR>', { desc = 'Undo stage hunk' })
vim.keymap.set('n', 'gr', ':Gitsigns reset_hunk<CR>', { desc = 'Reset hunk' })
vim.keymap.set('n', 'gP', ':Gitsigns preview_hunk<CR>', { desc = 'Preview hunk' })
vim.keymap.set('n', 'gb', ':Gitsigns blame_line<CR>', { desc = 'Blame line' })

vim.keymap.set('n', '<leader>gco', '<Plug>(git-conflict-ours)')
vim.keymap.set('n', '<leader>gct', '<Plug>(git-conflict-theirs)')
vim.keymap.set('n', '<leader>gcb', '<Plug>(git-conflict-both)')
vim.keymap.set('n', '<leader>gc0', '<Plug>(git-conflict-none)')
vim.keymap.set('n', '<leader>gcp', '<Plug>(git-conflict-prev-conflict)')
vim.keymap.set('n', '<leader>gcn', '<Plug>(git-conflict-next-conflict)')

-- Bufdelete
vim.keymap.set('n', '<Leader>q', ':Bdelete<CR>', { desc = 'Close buffer' })
vim.keymap.set('n', '<Leader>Q', ':q<CR>', { desc = 'Exit' })

-- Telescope
vim.keymap.set('n', '<leader>f', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], { desc = 'Find files' })
vim.keymap.set('n', '<leader>F', [[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All Files' })<CR>]], { desc = 'Find files (including ignored)' })
vim.keymap.set('n', '<leader>b', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>h', [[<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>]], { desc = 'Grep in files' })
vim.keymap.set('n', '<leader>e', [[<cmd>lua require('telescope.builtin').oldfiles({ only_cwd = true })<CR>]], { desc = 'Show history' })
vim.keymap.set('n', '<leader>s', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], { desc = 'Show document symbols' })
vim.keymap.set('n', '<leader>gs', [[<cmd>lua require('telescope.builtin').git_status()<CR>]], { desc = 'Show modified files' })
vim.keymap.set('n', '<leader>gb', [[<cmd>lua require('telescope.builtin').git_bcommits()<CR>]], { desc = 'Show commits for buffer' })
vim.keymap.set('n', '<leader>gf', ':Easypick changed_files<cr>', { desc = 'Show modified files in current branch' })
vim.keymap.set('n', '<leader>gcc', ':Easypick conflicts<cr>', { desc = 'Show files with conflicts' })

vim.keymap.set("n", "<leader>dd", "<cmd>Telescope dir find_files<CR>", { noremap = true, silent = true, desc = "Find files in directory" })
vim.keymap.set("n", "<leader>dw", "<cmd>Telescope dir live_grep<CR>", { noremap = true, silent = true, desc = "Grep in directory" })

-- Trouble
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", {silent = true, noremap = true, desc = "Toggle Trouble"})
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",  {silent = true, noremap = true, desc = "Trouble: workspace diagnostics"})
vim.keymap.set("n", "<leader>xk", "<cmd>TroubleToggle document_diagnostics<cr>", {silent = true, noremap = true, desc = "Trouble: document diagnostics"})
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", {silent = true, noremap = true, desc = "Trouble: locations"})
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", {silent = true, noremap = true, desc = "Trouble: quickfix"})
vim.keymap.set("n", "<leader>xr", "<cmd>TroubleToggle lsp_references<cr>",  {silent = true, noremap = true, desc = "Trouble: LSP references"})
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle lsp_definitions<cr>",  {silent = true, noremap = true, desc = "Trouble: LSP definitions"})
vim.keymap.set("n", "<leader>xD", "<cmd>TroubleToggle lsp_type_definitions<cr>",  {silent = true, noremap = true, desc = "Trouble: LSP type definitions"})

-- LSP
vim.keymap.set('n', '<Leader>D', '<cmd>lua vim.diagnostic.open_float()<CR>', { desc = 'Show diagnostics popup' })
vim.keymap.set('n', '<leader>Gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { desc = 'Previous diagnostic' })
vim.keymap.set('n', '<leader>Gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', { desc = 'Next diagnostic' })
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { desc = 'Go to definition' })
vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<CR>', { desc = 'Show implementations' })
vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>', { desc = 'Show references' })
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { desc = 'Show definition popup' })
vim.keymap.set('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { desc = 'Rename symbol' })
vim.keymap.set('n', '<Leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', { desc = 'Code actions' })
vim.keymap.set('n', '<leader>cf', '<cmd>lua vim.lsp.buf.formatting()<cr>', { desc = 'Format buffer' })

-- Toggleterm
vim.keymap.set('n', '<leader>t', ':ToggleTerm<CR>', { desc = 'Toggle terminal' })
vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true, desc = "Toggle lazygit"})

-- NvimTree
vim.keymap.set('n', '<Leader>nn', ':NvimTreeToggle<CR>', { desc = 'Toggle file tree' })
vim.keymap.set('n', '<Leader>nf', ':NvimTreeFindFileToggle<CR>', { desc = 'Toggle file tree and show current file' })

-- Bufferline
vim.keymap.set('n', '<A-l>', ':BufferLineCycleNext<cr>')
vim.keymap.set('n', '<A-h>', ':BufferLineCyclePrev<cr>')
vim.keymap.set('n', '<A-right>', ':BufferLineCycleNext<cr>')
vim.keymap.set('n', '<A-left>', ':BufferLineCyclePrev<cr>')
