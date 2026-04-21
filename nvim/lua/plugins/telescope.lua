-- ~/.config/nvim/lua/plugins/telescope.lua
return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 
    'nvim-lua/plenary.nvim',
    -- Highly recommended: improves sorting performance
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    local telescope = require("telescope")
    
    telescope.setup({
      defaults = {
        path_display = { "smart" },
      }
    })

    -- Load the fzf extension
    telescope.load_extension("fzf")
  end
}
