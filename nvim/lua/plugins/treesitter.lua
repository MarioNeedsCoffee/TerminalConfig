return {
  "nvim-treesitter/nvim-treesitter",
  -- This is the most important line. It pins you to the version that works.
  branch = "master",
  build = ":TSUpdate",
  config = function()
    -- This module ONLY exists on the master branch
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "javascript", "typescript", "tsx", "lua", "vim", "vimdoc", "json", "cpp", "c"
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
