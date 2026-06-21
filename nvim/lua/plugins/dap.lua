return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",

      {
        "igorlfs/nvim-dap-view",
        lazy = false,
        version = "1.*",
        ---@module 'dap-view'
        ---@type dapview.Config
        opts = {},
      },
    },
    config = function()
      require("mason").setup()

      require("mason-nvim-dap").setup({
        ensure_installed = {
          "codelldb",
        },
      })

      local dap = require("dap")

      ------------------------------------------------------------------------
      -- Adapter: CodeLLDB
      ------------------------------------------------------------------------

      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
          args = { "--port", "${port}" },
        },
      }

      ------------------------------------------------------------------------
      -- Jai debug configuration
      ------------------------------------------------------------------------

      dap.configurations.jai = {
        {
          name = "Launch Jai executable",
          type = "codelldb",
          request = "launch",

          program = function()
            return vim.fn.input(
              "Path to executable: ",
              vim.fn.getcwd() .. "/",
              "file"
            )
          end,

          cwd = "${workspaceFolder}",
          stopOnEntry = false,

          args = function()
            local input = vim.fn.input("Args: ")
            if input == "" then
              return {}
            end
            return vim.split(input, " ")
          end,

          runInTerminal = false,
        },
      }

      ------------------------------------------------------------------------
      -- Also make this available from C/C++/Rust buffers if useful
      ------------------------------------------------------------------------

      dap.configurations.c = dap.configurations.jai
      dap.configurations.cpp = dap.configurations.jai
      dap.configurations.rust = dap.configurations.jai

      ------------------------------------------------------------------------
      -- nvim-dap-view integration
      ------------------------------------------------------------------------

      local dapview = require("dap-view")

      dap.listeners.before.attach.dap_view_config = function()
        dapview.open()
      end

      dap.listeners.before.launch.dap_view_config = function()
        dapview.open()
      end

      dap.listeners.before.event_terminated.dap_view_config = function()
        dapview.close()
      end

      dap.listeners.before.event_exited.dap_view_config = function()
        dapview.close()
      end

      ------------------------------------------------------------------------
      -- Keymaps
      ------------------------------------------------------------------------

      vim.keymap.set("n", "<F5>", function()
        dap.continue()
      end, { desc = "DAP continue/start" })

      vim.keymap.set("n", "<F10>", function()
        dap.step_over()
      end, { desc = "DAP step over" })

      vim.keymap.set("n", "<F11>", function()
        dap.step_into()
      end, { desc = "DAP step into" })

      vim.keymap.set("n", "<F12>", function()
        dap.step_out()
      end, { desc = "DAP step out" })

      vim.keymap.set("n", "<leader>db", function()
        dap.toggle_breakpoint()
      end, { desc = "DAP toggle breakpoint" })

      vim.keymap.set("n", "<leader>dB", function()
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end, { desc = "DAP conditional breakpoint" })

      vim.keymap.set("n", "<leader>dr", function()
        dap.repl.open()
      end, { desc = "DAP REPL" })

      vim.keymap.set("n", "<leader>dl", function()
        dap.run_last()
      end, { desc = "DAP run last" })

      vim.keymap.set("n", "<leader>dt", function()
        dap.terminate()
      end, { desc = "DAP terminate" })

      vim.keymap.set("n", "<leader>dv", function()
        require("dap-view").toggle()
      end, { desc = "DAP view toggle" })
    end,
  },
}
