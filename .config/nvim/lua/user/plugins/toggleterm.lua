require('toggleterm').setup({
  open_mapping = [[<F1>]],
  direction = "float",
})

vim.keymap.set('n', '<leader>t', ':ToggleTerm<CR>')

local Terminal  = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = "float",
})
function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
