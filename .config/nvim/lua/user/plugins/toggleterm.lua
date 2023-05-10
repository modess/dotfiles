require('toggleterm').setup({
  open_mapping = [[<C-t>]],
  direction = "horizontal",
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
