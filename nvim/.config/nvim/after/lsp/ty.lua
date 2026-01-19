return {
  cmd = { "ty", "server" },
  filetypes = { "python" },
  root_dir = vim.fs.root(0, { ".git/", "pyproject.toml" }),
  settings = {
    ty = {
      configuration = {
        rules = {
          ["unresolved-reference"] = "warn",
        },
      },
      diagnosticMode = "workspace",
      showSyntaxErrors = true,
      inlayHints = {
        variableTypes = true,
        callArgumentNames = true,
      },
      completions = {
        autoImport = true,
      },
    },
  },
  init_options = {
    logFile = "/tmp/ty.log",
    logLevel = "info",
  },
}
