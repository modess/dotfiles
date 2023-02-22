require('hop').setup()

vim.keymap.set("n", "<leader>l", ":HopLine<cr>")
vim.keymap.set("n", "<leader>L", ":HopLineStart<cr>")
vim.keymap.set("n", "<leader>w", ":HopWord<cr>")
vim.keymap.set("n", "f", ":HopChar1<cr>")
vim.keymap.set("n", "F", ":HopChar2<cr>")

-- vim.cmd(["hi HopNextKey guifg=#00FF00"])
