require("config.lazy")
require("config.keymap")


-- Tabs configuration
vim.opt.smarttab = true
vim.opt.tabstop = 8
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 0
vim.opt.smartindent = true
vim.opt.autoindent = true


-- Better search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Color Scheme options
vim.opt.termguicolors = true
vim.g.background = 'dark'
vim.g.gruvbox_material_background = 'soft'


-- line numbers
vim.opt.relativenumber = true
vim.o.cursorline = true
vim.o.cursorlineopt = "number"


-- Format on save
local languages = { "*.lua", "*.py" }
vim.api.nvim_create_autocmd("BufWritePre",
  {
    pattern = languages,
    callback = function()
      vim.lsp.buf.format({ async = true })
    end
  })


-- Enabled LSPs
vim.lsp.enable("ty")
vim.lsp.enable("ruff")
vim.lsp.enable("lua_ls")
