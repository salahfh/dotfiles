-- vim.opt_local applies only to this specific file.
local set = vim.opt_local

set.shiftwidth = 2

vim.api.nvim_create_autocmd("BufWritePre",
  {
    pattern = "*.lua",
    callback = function()
      vim.lsp.buf.format({ async = false })
    end
  })
