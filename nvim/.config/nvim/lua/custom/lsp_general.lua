local M = {}
M.capabiblities = require('cmp_nvim_lsp').default_capabilities
vim.lsp.set_log_level("warn")

M.on_attach = function(_, buffer)
  vim.bo[buffer].omnifunc = "v:lua.vim.lsp.omnifunc"

  -- Custom key mappings for lsp actions can be added here as
  -- vim.keymap.set('n', "<leader>ca", vim.lsp.buf.code_action, { buffer = buffer, desc = "Code Action" })
end

return M
