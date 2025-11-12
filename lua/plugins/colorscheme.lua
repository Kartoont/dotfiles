return {
  -- add gruvbox
  -- { "ellisonleao/gruvbox.nvim" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    main = "catppuccin", -- tells Lazy to apply opts to require("catppuccin")
    config = function()
      require("catppuccin").setup({
        transparent_background = true,
        flavour = "mocha", -- latte, frappe, macchiato, mocha
      })
    end,
  },

  -- Configure LazyVim to load catppuccin
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
