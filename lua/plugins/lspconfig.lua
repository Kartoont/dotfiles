-- nvim/lua/plugins/lspconfig.lua

return {
  "neovim/nvim-lspconfig", -- Plugin
  dependencies = {
    "mason-org/mason.nvim", -- Optional: LSP installer
    "mson-org/mason-lspconfig.nvim", -- Optional: bridge between mason + lspconfig
  },
  config = function()
    -- Import lspconfig
    local lspconfig = require("lspconfig")

    -- Common on_attach function (set keymaps once LSP attaches)
    local on_attach = function(_, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }

      -- Keymaps
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
      end, opts)
    end

    -- Setup Pyright
    lspconfig.pyright.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "basic", -- or "strict"
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
          },
        },
      },
    })
  end,
}
