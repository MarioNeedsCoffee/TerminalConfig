return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- Mocha is the darkest flavor
        background = {
          light = "mocha", -- Even if system asks for light, give it mocha
          dark = "mocha",
        },
        transparent_background = false, 
        term_colors = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          telescope = { enabled = true },
        },
      })

      vim.opt.background = "dark"
      vim.cmd.colorscheme "catppuccin"
    end,
  },
}
