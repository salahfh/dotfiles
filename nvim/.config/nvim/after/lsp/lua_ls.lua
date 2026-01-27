return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
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
