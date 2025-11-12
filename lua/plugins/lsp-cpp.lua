return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          cmd = { "clangd", "--background-index" },
          filetypes = { "c", "cpp", "objc", "objcpp" },
          root_dir = require("lspconfig.util").root_pattern("compile_commands.json", ".git"),
        },
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP completion
      "hrsh7th/cmp-buffer", -- Buffer completion
      "hrsh7th/cmp-path", -- File path completion
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "mason-org/mason.nvim", -- optional if you use Mason
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      dap.adapters.lldb = {
        type = "executable",
        command = "lldb-vscode", -- make sure this is in your PATH
        name = "lldb",
      }
      dap.configurations.cpp = {
        {
          name = "Launch",
          type = "lldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
        },
      }
      require("dapui").setup()
    end,
  },
}
