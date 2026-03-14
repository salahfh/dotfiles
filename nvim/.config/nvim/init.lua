-- ############################## Neovim Help ##############################
-- :help user-manual
-- :help luaref
-- :help lua-guide
-- :help lua
-- ############################################################


require("config.lazy")
require("config.keymap")
require("custom.autoinsert")
require("custom.experimental")


-- Tabs configuration
vim.opt.smarttab = true
vim.opt.tabstop = 8
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 0
vim.opt.smartindent = true
vim.opt.autoindent = true


-- clipboard
-- Install xclip for linux


-- Better search
vim.opt.ignorecase = true
vim.opt.smartcase = true


-- Enable exrc (equivlant of .env)
-- Primary used for the database plug (see 'kristijanhusak/vim-dadbod-ui')
vim.opt.exrc = true


-- Color Scheme options
vim.opt.termguicolors = true
vim.g.background = 'dark'
vim.g.gruvbox_material_background = 'soft'


-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.signcolumn = "yes:1"


-- Format on save
local languages = { "*.lua", "*.py" }
vim.api.nvim_create_autocmd("BufWritePre",
  {
    pattern = languages,
    callback = function()
      vim.lsp.buf.format({ async = true })
      vim.cmd("w")
    end
  })


-- LSPs
-- 1. Install the server via :Mason
-- 2. Copy configuration from the neovim/nvim-lspconfig repo (search by file and extension name)
-- 3. Register the plug for loading here
vim.lsp.enable("ty")
vim.lsp.enable("ruff")
vim.lsp.enable("lua_ls")
vim.lsp.enable("oxlint")
vim.lsp.enable("oxfmt")
