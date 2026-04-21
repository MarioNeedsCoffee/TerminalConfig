return {
  "echasnovski/mini.surround",
  version = false, -- Necessary for the most up-to-date 2025 features
  opts = {
    mappings = {
      add = "sa",            -- Add surrounding (Normal and Visual)
      delete = "sd",         -- Delete surrounding
      replace = "sr",        -- Replace surrounding
      find = "sf",           -- Find surrounding (to the right)
      find_left = "sF",      -- Find surrounding (to the left)
      highlight = "sh",      -- Highlight surrounding
      update_n_lines = "sn", -- Update n_lines
    },
  },
}
