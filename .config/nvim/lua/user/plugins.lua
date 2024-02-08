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

-- Jump to the last location when opening a file.
use('farmergreg/vim-lastplace')

-- Automatically create parent dirs when saving.
use('jessarcher/vim-heritage')

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
use({
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end,
  })

-- All closing buffers without closing the split window.
use('kazhala/close-buffers.nvim')

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
    -- 'catppuccin/nvim',
    'folke/tokyonight.nvim',
    as = 'colorscheme',
    config = function()
      -- require("catppuccin").setup({})
      -- vim.cmd('colorscheme catppuccin-mocha')

      vim.cmd('colorscheme tokyonight-night')

      vim.cmd("hi HopNextKey guifg=black guibg=#00FF00")
      vim.cmd("hi HopNextKey1 guifg=black guibg=#00dfff")
      vim.cmd("hi HopNextKey2 guifg=black guibg=#2b8db3")
    end,
  })

-- notify
-- use({
--     'rcarriga/nvim-notify',
--     config = function()
--       vim.notify = require('notify')
--     end,
--   })

-- Better escape
use({
    'max397574/better-escape.nvim',
    config = function()
        require("better_escape").setup {
            mapping = {"ii"}, -- a table with mappings to use
        }
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

-- Trouble
use {
  "folke/trouble.nvim",
  requires = "nvim-tree/nvim-web-devicons",
  config = function()
    require("trouble").setup({})
  end
}

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
    require('hop').setup()
  end
}

-- Illuminate highlighter
use {
  'RRethy/vim-illuminate',
  after = 'colorscheme',
  config = function()
    vim.cmd("hi IlluminatedWordRead gui=none guibg=#45475a")
  end,
}

-- Easypick
use ({
  'axkirillov/easypick.nvim',
  requires = 'nvim-telescope/telescope.nvim',
  config = function()
    require('user/plugins/easypick')
  end
})

-- Github copilot
use {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<C-Space>",
          dismiss = "<C-w>",
        }
      }
    })
  end,
}

-- Which-key
use {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup({})
  end
}

-- Legendary, keymaps
use ({
    'mrjones2014/legendary.nvim',
    requires = 'stevearc/dressing.nvim',
    config = function()
      require('user/keymaps')
    end
  })

-- Testing helper
use({
  'vim-test/vim-test'
})

-- Debug
use({
  'rcarriga/nvim-dap-ui',
  requires = {
    'mfussenegger/nvim-dap',
    'theHamsta/nvim-dap-virtual-text',
    'nvim-telescope/telescope-dap.nvim',
  },
  config = function()
    require('user/plugins/dap')
  end,
})

-- Harpoon
use {
  "ThePrimeagen/harpoon",
  requires = {"nvim-lua/plenary.nvim"},
  config = function()
    require("telescope").load_extension('harpoon')

    require("harpoon").setup({
      global_settings = {
        mark_branch = true,
      },
      menu = {
        width = vim.api.nvim_win_get_width(0) - 20,
      }
    })
  end,
}

-- Tmux navigation
use {
  'alexghergh/nvim-tmux-navigation',
  config = function()
    require'nvim-tmux-navigation'.setup({})
  end
}

-- Diffview
use "sindrets/diffview.nvim"

-- Easy align
use { 'junegunn/vim-easy-align' }

-- todo.txt
use {
    "vimwiki/vimwiki",
    setup = function()
        vim.g.vimwiki_list = {
            {
                path = "~/Dropbox/notes",
                syntax = "markdown",
                ext = ".md",
            },
        }
    end,
}

-- oil
use({
  "stevearc/oil.nvim",
  config = function()
    require("oil").setup()
  end,
})

-- folke/noice
-- use {
--
--   "folke/noice.nvim",
--   config = function()
--     -- require("noice").setup({})
--     --
--   end,
-- }

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
