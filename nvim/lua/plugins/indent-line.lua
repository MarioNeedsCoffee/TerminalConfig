return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {
        indent = {
            char = "│", -- The vertical line character
        },
        scope = {
            enabled = true, -- Highlights the current scope line
            show_start = false,
            show_end = false,
        },
    },
  },
}
