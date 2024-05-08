-- Setup Mason to automatically install LSP servers
require('mason').setup()
require('mason-lspconfig').setup({ automatic_installation = true })

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- PHP
require('lspconfig').intelephense.setup({
    settings = {
        intelephense = {
            rename = {
                namespaceMode = "all",
            }
        }
    }
})

-- JavaScript, TypeScript
require('lspconfig').volar.setup({
  capabilities = capabilities,
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact' },
})

-- Python
require('lspconfig').pylsp.setup({
  capabilities = capabilities
})

-- JSON
require('lspconfig').jsonls.setup({
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    },
  },
})

-- Bash
require('lspconfig').bashls.setup({
  capabilities = capabilities
})

-- Yaml
require('lspconfig').yamlls.setup({
  capabilities = capabilities
})

-- null-ls
require('null-ls').setup({
  sources = {
    require('null-ls').builtins.diagnostics.trail_space.with({ disabled_filetypes = { 'NvimTree' } }),

    require('null-ls').builtins.diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js' })
      end,
    }),

    require('null-ls').builtins.diagnostics.phpcs.with({
      command = 'php',
      args = { "vendor/bin/phpcs", "--report=json", "-q", "-s", "--runtime-set", "ignore_warnings_on_exit", "1", "--runtime-set", "ignore_errors_on_exit", "1", "$FILENAME"},
      condition = function(utils)
        return utils.root_has_file({ 'phpcs.xml.dist', 'phpcs.xml' })
      end,
    }),

    require('null-ls').builtins.diagnostics.phpstan.with({
      command = 'php',
      args = { "vendor/bin/phpstan", "analyze", "--error-format", "json", "--no-progress", "$FILENAME" },
      temp_dir = "/tmp",
      condition = function(utils)
        return utils.root_has_file({ 'phpstan.neon.dist', 'phpstan.neon' })
      end,
    }),
  },
})

require('mason-null-ls').setup({ automatic_installation = true })

-- Diagnostic configuration
vim.diagnostic.config({
  float = {
    source = true,
  }
})

-- Sign configuration
vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
