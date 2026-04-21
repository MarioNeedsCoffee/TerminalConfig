return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "williamboman/mason.nvim",          opts = {} },
      { "williamboman/mason-lspconfig.nvim" },
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("mason").setup()

      local mason_lspconfig = require("mason-lspconfig")
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      mason_lspconfig.setup({
        ensure_installed = {
          "ts_ls",
          "lua_ls",
          "html",
          "cssls",
          "clangd", -- Added clangd for C/C++ support
        },

        handlers = {
          -- Default handler: automatically configures servers in ensure_installed
          function(server_name)
            lspconfig[server_name].setup({
              capabilities = capabilities,
            })
          end,

          ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim" },
                  },
                },
              },
            })
          end,

          -- Optional: Custom clangd configuration
          -- ["clangd"] = function()
          --   lspconfig.clangd.setup({
          --     capabilities = capabilities,
          --     cmd = { "clangd", "--background-index", "--clang-tidy" },
          --   })
          -- end,
        },
      })
    end,
  },
}
