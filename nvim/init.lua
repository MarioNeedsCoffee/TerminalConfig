-- 1. Bootstrap Lazy.nvim (The code we wrote earlier to install the manager)
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.shiftwidth = 2   -- Size of an indent
vim.opt.tabstop = 2      -- Number of spaces tabs count for
vim.opt.softtabstop = 2  -- Number of spaces a tab counts for while editing

vim.opt.number = true
vim.opt.relativenumber = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 2. Load basic options (No plugin dependencies here)
require("config.options")

-- 3. Load Plugins (This downloads Telescope)
require("lazy").setup("plugins")

-- 4. Load Keymaps (Load this LAST so it can see the plugins)
require("config.keymaps")

-- Auto-save when focus is lost or when leaving insert mode
vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, {
  callback = function()
    if vim.bo.modified and vim.fn.expand("%") ~= "" then
      vim.cmd("silent! write")
    end
  end,
})
