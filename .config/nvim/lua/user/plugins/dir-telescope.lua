require("dir-telescope").setup({
  hidden = true,
  respect_gitignore = true,
})

require("telescope").load_extension("dir")
