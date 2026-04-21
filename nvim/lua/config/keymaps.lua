-- ~/.config/nvim/lua/config/keymaps.lua

-- This way is safer because it doesn't try to 'require' telescope 
-- until the moment you actually press the keys.
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Fuzzy find files' })
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { desc = 'Fuzzy find grep' })
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = 'Fuzzy find buffers' })
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Exit insert mode' })
