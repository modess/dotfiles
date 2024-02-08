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

    { 'II', { i = '<esc>pa' }, description = 'Exit insert, paste, re-enter insert' },

    -- Change word
    { 'cc', { n = 'cw' }, opts = { silent = true }, description = 'Change word alias' },

    { '<C-h>', { n = '<cmd>NvimTmuxNavigateLeft<CR>' }, opts = { silent = true } },
    { '<C-j>', { n = '<cmd>NvimTmuxNavigateDown<CR>' }, opts = { silent = true } },
    { '<C-k>', { n = '<cmd>NvimTmuxNavigateUp<CR>' }, opts = { silent = true } },
    { '<C-l>', { n = '<cmd>NvimTmuxNavigateRight<CR>' }, opts = { silent = true } },
    { '<C-left>', { n = '<cmd>NvimTmuxNavigateLeft<CR>' }, opts = { silent = true } },
    { '<C-down>', { n = '<cmd>NvimTmuxNavigateDown<CR>' }, opts = { silent = true } },
    { '<C-up>', { n = '<cmd>NvimTmuxNavigateUp<CR>' }, opts = { silent = true } },
    { '<C-right>', { n = '<cmd>NvimTmuxNavigateRight<CR>' }, opts = { silent = true } },

    { '<A-up>', { n = ':move .-2<CR>==gi', v = ":move '<-2<CR>gv=gv", i = '<Esc>:move .-2<CR>==gi' }, opts = { silent = true } },
    { '<A-down>', { n = ':move .+1<CR>==gi', v = ":move '>+1<CR>gv=gv", i = '<Esc>:move .+1<CR>==gi' }, opts = { silent = true } },

    { '?', { n = ':Legendary<cr>' }},

    -- Slits
    { '<leader>_', { n = ':vs<C-l><CR>' }, description = 'Split vertical' },
    { '<leader>-', { n = ':split<CR>' }, description = 'Split horizontal' },
    { '<leader>=', { n = '<C-w>=' }, description = 'Split auto size' },

    -- Resize panes
    { '<leader>)', { n = ':vertical resize +15<CR>' }, description = 'Increase vertical size' },
    { '<leader>(', { n = ':vertical resize -15<CR>' }, description = 'Decrease vertical size' },
    { '<leader>}', { n = ':resize +5<CR>' }, description = 'Increase horizontal size' },
    { '<leader>{', { n = ':resize -5<CR>' }, description = 'Decrease horizontal size' },


    -- Bufdelete
    { '<leader>qq', { n = '<cmd>BDelete this<cr>'}, description = 'Close buffer' },
    { '<leader>qa', { n = '<cmd>BWipeout! all<cr>'}, description = 'Close all buffers' },
    { '<leader>qo', { n = '<cmd>BWipeout other<cr>'}, description = 'Close all other buffers' },

    -- Hop
    { 'M', { n = ':HopLine<cr>' }, description = 'Jump to line' },
    { 'm', { n = ':HopLineStart<cr>' }, description = 'Jump to line start' },
    { 's', { n = ':HopChar1<cr>' }, description = 'Jump to character' },
    { 'S', { n = ':HopChar2<cr>' }, description = 'Jump to characters' },

    -- VCS
    { '<leader>vv', { n = '<cmd>lua _lazygit_toggle()<CR>' }, description = 'Lazygit' },
    { '<leader>vn', { n = ':Gitsigns next_hunk<CR>' }, description = 'Next hunk' },
    { '<leader>vp', { n = ':Gitsigns prev_hunk<CR>' }, description = 'Previous hunk' },
    { '<leader>vs', { n = ':Gitsigns stage_hunk<CR>' }, description = 'Stage hunk' },
    { '<leader>vu', { n = ':Gitsigns undo_stage_hunk<CR>' }, description = 'Undo stage hunk' },
    { '<leader>vz', { n = ':Gitsigns reset_hunk<CR>' }, description = 'Reset hunk' },
    { '<leader>vP', { n = ':Gitsigns preview_hunk<CR>' }, description = 'Preview hunk' },
    { '<leader>vb', { n = ':Gitsigns blame_line<CR>' }, description = 'Blame line' },

    -- Find
    { '<leader>f', { n = [[<cmd>lua require('telescope.builtin').find_files()<CR>]] }, description = 'Find file' },
    { '<leader>a', { n = [[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All Files' })<CR>]]}, description = 'Find file (all)' },
    { '<leader>F', { n = [[<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>]] }, description = 'Find in files' },
    { '<leader>b', { n = [[<cmd>lua require('telescope.builtin').buffers()<CR>]] }, description = 'Find buffer' },
    { '<leader>i', { n = [[<cmd>lua require('telescope.builtin').oldfiles({ only_cwd = true })<CR>]]}, description = 'Recent files' },
    { '<leader>m', { n = ':Telescope treesitter<cr>' }, description = 'Find treesitter symbol' },
    { '<leader>M', { n = [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]] }, description = 'Find LSP symbol' },
    { '<leader>Dd',{ n = '<cmd>Telescope dir find_files<CR>' }, description = 'Find file in folder' },
    { '<leader>Df',{ n = '<cmd>Telescope dir live_grep<CR>' }, description = 'Find in files in folder' },
    { '<leader>gs', { n = ':Easypick changed_files<cr>'}, description = 'Find changed files in branch' },
    { '<leader>gn', { n = ':Easypick added_files<cr>'}, description = 'Find added files' },
    { '<leader>gc', { n = ':Easypick conflicts<cr>'}, description = 'Find conflicts' },

    -- Harpoon
    { '<leader>h', { n = [[<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>]]}, description = 'Show harpoon UI' },
    { '<leader>H', { n = [[<cmd>lua require("harpoon.mark").add_file()<cr>]]}, description = 'Mark file in harpoon' },

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
    { 'gr', { n = '<cmd>lua vim.lsp.buf.rename()<CR>'}, description = 'Rename' },
    { 'gR', { n = ':Telescope lsp_references<cr>' }, description = 'References' },
    { 'ga', { n = '<cmd>lua vim.lsp.buf.code_action()<CR>'}, description = 'Code actions' },
    { 'gf', { n = '<cmd>lua vim.lsp.buf.formatting()<CR>'}, description = 'Format code' },

    -- Debug
    { '<leader>du', { n = ':lua require"dapui".toggle()<CR>' }, description = 'Toggle dap UI' },
    { '<leader>db', { n = ':lua require"dap".toggle_breakpoint()<CR>' }, description = 'Toggle breakpoint' },
    { '<leader>dd', { n = ':lua require"dap".continue()<CR>' }, description = 'Continue' },
    { '<leader>dr', { n = ':lua require"dap".repl.open()<CR>' }, description = 'Open REPL' },
    { '<leader>dv', { n = ':lua require"dap".step_over()<CR>' }, description = 'Step over' },
    { '<leader>di', { n = ':lua require"dap".step_into()<CR>' }, description = 'Step into' },
    { '<leader>do', { n = ':lua require"dap".step_out()<CR>' }, description = 'Step out' },
    { '<leader>dl', { n = ':lua require"dap".run_last()<CR>' }, description = 'Run last' },
    { '<leader>d<Up>', { n = ':lua require"dap".up()<CR>' }, description = 'Up' },
    { '<leader>d<Down>', { n = ':lua require"dap".down()<CR>' }, description = 'Down' },

    -- Toggleterm
    { '<C-t>', { n = ':ToggleTerm<CR>' }, description = 'Toggle terminal' },

    -- NvimTree
    { '<leader>nn', { n = ':NvimTreeToggle<CR>' }, description = 'Toggle file tree' },
    { '<leader>nf', { n = ':NvimTreeFindFileToggle<CR>' }, description = 'Toggle file tree and show current file' },

    -- Diffview
    { '<leader>co', { n = ':DiffviewOpen<cr>' }, description = 'Open diffview' },
    { '<leader>cc', { n = ':DiffviewClose<cr>' }, description = 'Close diffview' },

    -- Vimwiki
    { '<leader>ww', { n = ':VimwikiIndex<cr>' }, description = 'Open vimwiki index' },
    { '<leader>wd', { n = ':VimwikiDeleteFile<cr>'}, description = 'Delete vimwiki file' },
    { '<leader>wr', { n = ':VimwikiRenameFile<cr>'}, description = 'Rename vimwiki file' },

    -- Easy align
    { '<leader>A', { n = '<Plug>(EasyAlign)', x = '<Plug>(EasyAlign)' }, description = 'Align' },

    -- Octo (github)
    { '<leader>or', { n = '<cmd>Octo search is:open is:pr user-review-requested:@me archived:false draft:false label:rebase<cr>' }, description = 'PRs to review' },
    { '<leader>om', { n = '<cmd>Octo search is:open is:pr author:@me<cr>' }, description = 'PRs by me' },

    -- Oil
    { '-', { n = ':Oil<cr>' }, description = 'Open oil' },

    -- Packer
    { '<leader>Ps', { n = ':PackerSync<cr>' }, description = 'Sync plugins' },
    { '<leader>Pc', { n = ':PackerCompile<cr>' }, description = 'Compile plugins' },
  },
  extensions = {
    -- load keymaps and commands from nvim-tree.lua
    nvim_tree = true
  },
})
