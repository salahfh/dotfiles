-- type :help lspconfig-all (to find all related information to the lsp)
-- for lsp commands: search :help ins-completion
return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  filetype = "lua",
  dependancies = {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
}
