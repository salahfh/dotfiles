local lsp_general = require("custom.lsp_general")

return {
  cmd = { "ruff", "server" },
  filetypes = { "python" },
  init_options = {
    settings = {
      logLevel = 'info',
    }
  },
  on_attach = lsp_general.on_attach,

}
