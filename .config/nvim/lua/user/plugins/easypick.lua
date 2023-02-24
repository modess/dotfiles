local easypick = require("easypick")

easypick.setup({
    pickers = {
      -- diff current branch with parent branch and show files that changed with respective diffs in preview
      {
        name = "changed_files",
        command = "git diff --name-only $(git merge-base HEAD $(git-branch-parent))",
        previewer = easypick.previewers.branch_diff({base_branch = 'master'})
      },

      -- list files that have conflicts with diffs in preview
      {
        name = "conflicts",
        command = "git diff --name-only --diff-filter=U --relative",
        previewer = easypick.previewers.file_diff()
      },
    }
  })
