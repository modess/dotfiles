require('toggleterm').setup({
  open_mapping = [[<F1>]],
  direction = "float",
})

local Terminal  = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = "float",
})
function _lazygit_toggle()
  lazygit:toggle()
end
