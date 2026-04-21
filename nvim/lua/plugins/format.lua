return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      -- Standardize Node/TS projects with Prettier
      javascript = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },
      -- Add others as you learn new things (e.g., NestJS/CSS)
      css = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
    },
    -- "Auto-Cast" on save
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
}
