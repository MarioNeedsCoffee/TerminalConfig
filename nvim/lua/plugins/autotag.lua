return {
  "windwp/nvim-ts-autotag",
  opts = {
    -- This ensures it only wakes up when you are in HTML, TSX, or JSX
    opts = {
      enable_close = true,           -- Auto close tags
      enable_rename = true,          -- Auto rename pairs of tags
      enable_close_on_slash = false, -- Less intrusive
    },
  },
}
