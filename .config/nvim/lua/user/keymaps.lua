-- Space is my leader.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('legendary').setup({
  keymaps = {
    { '<leader>Z', { n = ':source $HOME/.config/nvim/init.lua<CR>'}},

    { '<C-s>', { n = ':w<cr>' }},

    { 'U', { n = '<C-r>' }},

    { 'n', { n = 'nzz' }},

    -- When text is wrapped, move by terminal rows, not lines, unless a count is provided.
    { 'k', { n = "v:count == 0 ? 'gk' : 'k'" }, opts = { expr = true, silent = true }},
    { 'j', { n = "v:count == 0 ? 'gj' : 'j'" }, opts = { expr = true, silent = true }},
    { '<', { v = '<gv' }},
    { '>', { v = '>gv' }},
    { 'y', { v = 'myy`y' }},
    { 'p', { v = '"_dP' }},

    { '<leader><leader>', { n = '<c-^>' }, description = 'Switch to previous buffer' },

    { '<leader>k', { n = ':nohlsearch<CR>' }, description = 'Clear search highlighting' },

    -- Change word
    { 'cc', { n = 'cw' }, opts = { silent = true } },

    { '<leader>|', { n = ':vs<C-l><CR>' }, description = 'Split vertical' },
    { '<leader>-', { n = ':split<CR>' }, description = 'Split horizontal' },

    { '<C-left>', { n = ':KittyNavigateLeft<cr>' }, opts = { silent = true } },
    { '<C-down>', { n = ':KittyNavigateDown<cr>' }, opts = { silent = true } },
    { '<C-up>', { n = ':KittyNavigateUp<cr>' }, opts = { silent = true } },
    { '<C-right>', { n = ':KittyNavigateRight<cr>' }, opts = { silent = true } },

    { '<A-down>', { n = ':move .+1<CR>==gi', v = ":move '>+1<CR>gv=gv", i = '<Esc>:move .+1<CR>==gi' }, opts = { silent = true } },
    { '<A-up>', { n = ':move .-2<CR>==gi', v = ":move '<-2<CR>gv=gv", i = '<Esc>:move .-2<CR>==gi' }, opts = { silent = true } },

    { '?', { n = ':Legendary<cr>' }},

    { 'uu', { i = '<Esc>' }},

    -- Bufdelete
    { '<leader>q', { n = ':BufDel<cr>' }, description = 'Close buffer' },
    { '<leader>Q', { n = ':BufDel!<cr>' }, description = 'Exit' },

    -- Hop
    { 'M', { n = ':HopLine<cr>' }, description = 'Jump to line' },
    { 'm', { n = ':HopLineStart<cr>' }, description = 'Jump to line start' },
    { '<leader>w', { n = ':HopWord<cr>' }, description = 'Jump to word' },
    { 's', { n = ':HopChar1<cr>' }, description = 'Jump to character' },
    { 'S', { n = ':HopChar2<cr>' }, description = 'Jump to characters' },

    -- VCS
    { 'vv', { n = '<cmd>lua _lazygit_toggle()<CR>' }, description = 'Lazygit' },
    { 'vn', { n = ':Gitsigns next_hunk<CR>' }, description = 'Next hunk' },
    { 'vp', { n = ':Gitsigns prev_hunk<CR>' }, description = 'Previous hunk' },
    { 'vs', { n = ':Gitsigns stage_hunk<CR>' }, description = 'Stage hunk' },
    { 'vu', { n = ':Gitsigns undo_stage_hunk<CR>' }, description = 'Undo stage hunk' },
    { 'vr', { n = ':Gitsigns reset_hunk<CR>' }, description = 'Reset hunk' },
    { 'vP', { n = ':Gitsigns preview_hunk<CR>' }, description = 'Preview hunk' },
    { 'vb', { n = ':Gitsigns blame_line<CR>' }, description = 'Blame line' },

    -- Find
    { '<leader>f', { n = [[<cmd>lua require('telescope.builtin').find_files()<CR>]] }, description = 'Find file' },
    { '<leader>a', { n = [[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All Files' })<CR>]]}, description = 'Find file (all)' },
    { '<leader>F', { n = [[<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>]] }, description = 'Find in files' },
    { '<leader>b', { n = [[<cmd>lua require('telescope.builtin').buffers()<CR>]] }, description = 'Find buffer' },
    { '<leader>h', { n = [[<cmd>lua require('telescope.builtin').oldfiles({ only_cwd = true })<CR>]]}, description = 'Recent files' },
    { '<leader>m', { n = ':Telescope treesitter<cr>' }, description = 'Find treesitter symbol' },
    { '<leader>M', { n = [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]] }, description = 'Find LSP symbol' },
    { '<leader>dd',{ n = '<cmd>Telescope dir find_files<CR>' }, description = 'Find file in folder' },
    { '<leader>dF',{ n = '<cmd>Telescope dir live_grep<CR>' }, description = 'Find in files in folder' },
    { '<leader>gs', { n = ':Easypick changed_files<cr>'}, description = 'Find changed files in branch' },
    { '<leader>gc', { n = ':Easypick conflicts<cr>'}, description = 'Find conflicts' },

    -- Code
    { '<leader>fr', { n = ':Telescope lsp_references<cr>' }, description = 'References' },
    { '<leader>fd', { n = ':Telescope lsp_definitions<cr>' }, description = 'Definitions' },
    { '<leader>fi', { n = ':Telescope lsp_implementations<cr>' }, description = 'Implementations' },
    { '<leader>fa', { n = ':Telescope lsp_code_actions<cr>' }, description = 'Code actions' },

    -- Tests
    { '<leader>tt', { n = ':TestNearest<cr>' }, description = 'Test nearest' },
    { '<leader>tf', { n = ':TestFile<cr>' }, description = 'Test file' },
    { '<leader>ts', { n = ':TestSuite<cr>' }, description = 'Test suite' },
    { '<leader>tr', { n = ':TestLast<cr>' }, description = 'Test last' },
    { '<leader>tv', { n = ':TestVisit<cr>' }, description = 'Test visit' },

    -- Trouble
    { '<leader>xx', { n = ':TroubleToggle<cr>' }, description = 'Toggle Trouble' },
    { '<leader>xd', { n = ':TroubleToggle lsp_document_diagnostics<cr>' }, description = 'Trouble: document diagnostics' },
    { '<leader>xr', { n = ':TroubleToggle lsp_references<cr>' }, description = 'Trouble: references' },
    { '<leader>xd', { n = ':TroubleToggle lsp_definitions<cr>' }, description = 'Trouble: definitions' },
    { '<leader>xD', { n = ':TroubleToggle lsp_type_definitions<cr>' }, description = 'Trouble: type definitions' },
    { '<leader>xi', { n = ':TroubleToggle lsp_implementations<cr>' }, description = 'Trouble: implementations' },
    { '<leader>xq', { n = ':TroubleToggle quickfix<cr>' }, description = 'Trouble: quickfix' },

    -- LSP
    { 'gp', { n = '<cmd>lua vim.diagnostic.open_float()<CR>'}, description = 'Show diagnostics popup' },
    { 'gk', { n = '<cmd>lua vim.diagnostic.goto_next()<CR>'}, description = 'Next diagnostic' },
    { 'gK', { n = '<cmd>lua vim.diagnostic.goto_prev()<CR>'}, description = 'Previous diagnostic' },
    { 'gd', { n = '<cmd>lua vim.lsp.buf.definition()<CR>'}, description = 'Go to definition' },
    { 'gi', { n = ':Telescope lsp_implementations<CR>'}, description = 'Show implementations' },
    { 'gu', { n = ':Telescope lsp_references<CR>'}, description = 'Show usages/references' },
    { 'gR', { n = '<cmd>lua vim.lsp.buf.rename()<CR>'}, description = 'Rename' },
    { 'ga', { n = '<cmd>lua vim.lsp.buf.code_action()<CR>'}, description = 'Code actions' },
    { 'gf', { n = '<cmd>lua vim.lsp.buf.formatting()<CR>'}, description = 'Format code' },

    -- Toggleterm
    { '<C-t>', { n = ':ToggleTerm<CR>' }, description = 'Toggle terminal' },

    -- NvimTree
    { '<leader>nn', { n = ':NvimTreeToggle<CR>' }, description = 'Toggle file tree' },
    { '<leader>nf', { n = ':NvimTreeFindFileToggle<CR>' }, description = 'Toggle file tree and show current file' },

    -- Bufferline
    { '<A-right>', { n = ':BufferLineCycleNext<cr>' }, description = 'Next buffer' },
    { '<A-left>', { n = ':BufferLineCyclePrev<cr>' }, description = 'Previous buffer' },

    -- Packer
    { '<leader>Ps', { n = ':PackerSync<cr>' }, description = 'Sync plugins' },
    { '<leader>Pc', { n = ':PackerCompile<cr>' }, description = 'Compile plugins' },
  },
  extensions = {
    -- load keymaps and commands from nvim-tree.lua
    nvim_tree = true
  },
})
