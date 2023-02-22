local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').reset()
require('packer').init({
    compile_path = vim.fn.stdpath('data')..'/site/plugin/packer_compiled.lua',
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'solid' })
      end,
    },
  })


vim.keymap.set('n', '<leader>Ps', ':PackerSync<cr>')
vim.keymap.set('n', '<leader>Pc', ':PackerCompile<cr>')

local use = require('packer').use

-- Packer can manage itself.
use('wbthomason/packer.nvim')

-- Commenting support.
use {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup()
  end
}

-- Add, change, and delete surrounding text.
use('tpope/vim-surround')

-- Pairs of handy bracket mappings, like [b and ]b.
use('tpope/vim-unimpaired')

-- Allow plugins to enable repeating of commands.
use('tpope/vim-repeat')

-- Add more languages.
use('sheerun/vim-polyglot')

-- Jump to the last location when opening a file.
use('farmergreg/vim-lastplace')

-- Automatically create parent dirs when saving.
use('jessarcher/vim-heritage')

-- Navigate seamlessly between Vim windows and Tmux panes.
use('christoomey/vim-tmux-navigator')

-- Useful commands like :Rename and :SudoWrite.
use('tpope/vim-eunuch')

-- Text objects for HTML attributes.
use({
    'whatyouhide/vim-textobj-xmlattr',
    requires = 'kana/vim-textobj-user',
  })

-- Automatically set the working directory to the project root.
use({
    'airblade/vim-rooter',
    setup = function()
      -- Instead of this running every time we open a file, we'll just run it once when Vim starts.
      vim.g.rooter_manual_only = 1
    end,
    config = function()
      vim.cmd('Rooter')
    end,
  })

-- Automatically add closing brackets, quotes, etc.
-- use({
--     'windwp/nvim-autopairs',
--     config = function()
--       require('nvim-autopairs').setup()
--     end,
--   })

-- Add smooth scrolling to avoid jarring jumps
use({
    'karb94/neoscroll.nvim',
    config = function()
      require('user/plugins/neoscroll')
    end,
  })

-- All closing buffers without closing the split window.
use({
    'famiu/bufdelete.nvim',
    config = function()
      vim.keymap.set('n', '<Leader>q', ':Bdelete<CR>')
      vim.keymap.set('n', '<Leader>Q', ':q<CR>')
    end,
  })

-- Split arrays and methods onto multiple lines, or join them back up.
use({
    'AndrewRadev/splitjoin.vim',
    config = function()
      vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
      vim.g.splitjoin_trailing_comma = 1
      vim.g.splitjoin_php_method_chain_full = 1
    end,
  })

-- Automatically fix indentation when pasting code.
use({
    'sickill/vim-pasta',
    config = function()
      vim.g.pasta_disabled_filetypes = { 'fugitive' }
    end,
  })

-- Colorscheme
use ({
    'catppuccin/nvim',
    as = 'catppuccin',
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        integrations = {
          illuminate = true,
        }
      })

      vim.cmd("hi HopNextKey guifg=black guibg=#00FF00")
      vim.cmd("hi HopNextKey1 guifg=black guibg=#00dfff")
      vim.cmd("hi HopNextKey2 guifg=black guibg=#2b8db3")
    end,
  })

vim.cmd('colorscheme catppuccin-mocha')

-- Display buffers as tabs.
use({
    'akinsho/bufferline.nvim',
    tag = "v3.*",
    requires = 'kyazdani42/nvim-web-devicons',
    after = 'catppuccin',
    config = function()
      require('user/plugins/bufferline')
    end,
  })

-- Fuzzy finder
use({
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      'nvim-telescope/telescope-live-grep-args.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    },
    config = function()
      require('user/plugins/telescope')
    end,
  })

-- Telescope in dirs
use({
  "princejoogie/dir-telescope.nvim",
  requires = {"nvim-telescope/telescope.nvim"},
  config = function()
    require("user/plugins/dir-telescope")
  end,
})

-- File tree sidebar
use({
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('user/plugins/nvim-tree')
    end,
  })

-- A Status line.
use({
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('user/plugins/lualine')
    end,
  })

-- Display indentation lines.
use({
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('user/plugins/indent-blankline')
    end,
  })

-- Git integration.
use({
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
      vim.keymap.set('n', 'Gn', ':Gitsigns next_hunk<CR>')
      vim.keymap.set('n', 'Gp', ':Gitsigns prev_hunk<CR>')
      vim.keymap.set('n', 'Gs', ':Gitsigns stage_hunk<CR>')
      vim.keymap.set('n', 'Gu', ':Gitsigns undo_stage_hunk<CR>')
      vim.keymap.set('n', 'Gp', ':Gitsigns preview_hunk<CR>')
      vim.keymap.set('n', 'Gb', ':Gitsigns blame_line<CR>')
    end,
  })

-- Floating terminals
use ({
    'akinsho/toggleterm.nvim',
    tag = '*',
    config = function()
      require('user/plugins/toggleterm')
    end,
  })

-- Improved syntax highlighting
use({
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring',
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      require('user/plugins/treesitter')
    end,
  })

-- Language Server Protocol.
use({
    'neovim/nvim-lspconfig',
    requires = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'b0o/schemastore.nvim',
      'jose-elias-alvarez/null-ls.nvim',
      'jayp0521/mason-null-ls.nvim',
    },
    config = function()
      require('user/plugins/lspconfig')
    end,
  })

-- Completion
use({
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind-nvim',
    },
    config = function()
      require('user/plugins/cmp')
    end,
  })

-- Clear trailing whitespace and newlines on save
use({
    "mcauley-penney/tidy.nvim",
    config = function()
      require("tidy").setup()
    end
  })

-- Hop
use {
  'phaazon/hop.nvim',
  branch = 'v2', -- optional but strongly recommended
  config = function()
    require('user/plugins/hop')
  end
}

-- Shade
use {
  'sunjon/shade.nvim',
  config = function()
    require('shade').setup({
        overlay_opacity = 50,
      })
  end,
}

-- Color highlighter
use {
  'NvChad/nvim-colorizer.lua',
  config = function()
    require('colorizer').setup()
  end,
}

-- Illuminate highlighter
use {
  'RRethy/vim-illuminate',
  after = 'catppuccin',
  config = function()
    vim.cmd("hi IlluminatedWordRead gui=none guibg=#45475a")
  end,
}

-- Scrollbar
use {
  'petertriho/nvim-scrollbar',
  config = function()
    require('scrollbar').setup()
  end,
}

-- Dashboard
use {
  'glepnir/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      -- config
    }
  end,
  requires = {'nvim-tree/nvim-web-devicons'}
}

use({
  "utilyre/barbecue.nvim",
  tag = "*",
  requires = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  after = "nvim-web-devicons", -- keep this if you're using NvChad
  config = function()
    require("barbecue").setup({
        theme = {
          normal = { bg = "#303446" },
        }
      })
  end,
})

-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if packer_bootstrap then
  require('packer').sync()
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile>
  augroup end
]])
