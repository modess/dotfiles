require("dir-telescope").setup({
  hidden = true,
  respect_gitignore = true,
})

require("telescope").load_extension("dir")

vim.keymap.set("n", "<leader>dd", "<cmd>Telescope dir find_files<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dw", "<cmd>Telescope dir live_grep<CR>", { noremap = true, silent = true })
