-- type :help lspconfig-all (to find all related information to the lsp)
-- for lsp commands: search :help ins-completion
return {
    "neovim/nvim-lspconfig",
    dependancies = {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    config = function()
      require("lspconfig").lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            library = {
              vim.env.VIMRUNTIME,  
              vim.fn.stdpath('config'),  
            },
          },
          runtime = {
            version = 'LuaJIT',  
          },
        },
      },
    }
  end
}
