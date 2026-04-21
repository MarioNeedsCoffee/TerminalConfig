return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "williamboman/mason.nvim",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup()

    --- 1. UI Orchestration
    dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
    dap.listeners.after.event_terminated["dapui_config"] = function() dapui.close() end
    dap.listeners.after.event_exited["dapui_config"] = function() dapui.close() end

    --- 2. Adapter Definition (FIXED)
    -- We use 'pwa-node' as the adapter name.
    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        -- Corrected args: ensure these are separate strings in the table
        args = {
          vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
          "${port}",
        },
      },
    }

    --- 3. Language Configurations
    local js_languages = { "typescript", "javascript", "typescriptreact", "javascriptreact" }
    for _, language in ipairs(js_languages) do
      dap.configurations[language] = {
        -- TARGETED: Use this for your 'npm run dev' (nodemon) setup
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach to Port 9229 (Nodemon)",
          port = 9229,
          cwd = "${workspaceFolder}",
          restart = true, -- Re-attaches automatically when nodemon restarts
          sourceMaps = true,
          protocol = "inspector",
          resolveSourceMapLocations = {
            "${workspaceFolder}/**",
            "!**/node_modules/**",
          },
        },
        -- STANDALONE: Use this for running a single file without a pre-running server
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch Current File (pwa-node)",
          program = "${file}",
          cwd = "${workspaceFolder}",
          sourceMaps = true,
          protocol = "inspector",
          runtimeExecutable = "node",
        },
      }
    end

    --- 4. Keybindings
    vim.keymap.set('n', '<F5>', function() dap.continue() end)
    vim.keymap.set('n', '<F10>', function() dap.step_over() end)
    vim.keymap.set('n', '<F11>', function() dap.step_into() end)
    vim.keymap.set('n', '<F12>', function() dap.step_out() end)
    vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
  end,
}
