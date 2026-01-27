return {
  cmd = { "ruff", "server" },
  filetypes = { "python" },
  init_options = {
    settings = {
      logLevel = 'info',
    }
  },
}
