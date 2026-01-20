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

vim.opt.termguicolors = true


-- Scroll Options
vim.opt.scrolloff = 15

-- line numbers
vim.opt.relativenumber = true
vim.o.cursorline = true
vim.o.cursorlineopt = "number"

local linenumber_color = "#A281D8"
vim.api.nvim_set_hl(0, 'LineNr', { fg = linenumber_color })
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = linenumber_color })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = linenumber_color })


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
