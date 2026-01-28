-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ft', "<CMD>Telescope<CR>", { desc = 'Telescope main menu' })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Telescope Vim keymaps' })
vim.keymap.set('n', '<leader>fc', builtin.git_commits, { desc = 'Telescope git commits keymaps' })
vim.keymap.set('n', '<leader>fm', builtin.git_branches, { desc = 'Telescope git branches keymaps' })
vim.keymap.set("n", "<leader>fn", function()
  builtin.find_files({
    cwd = vim.fn.stdpath("config"),
    prompt_prefix = "Config > ",
  })
end, { desc = "Find config files" })


-- Gitsignn
local gitsigns = require('gitsigns')
vim.keymap.set('n', '<leader>gd', gitsigns.toggle_deleted, { desc = 'Toggle git sign' })


-- Terminal
-- Start a mini termial - useful for quick git operations
vim.keymap.set('n', '<leader>st', function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 10)
  vim.cmd.startinsert()
end)


-- Change to normal mode
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, desc = 'Remap escape in terminal mode' })


--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })


-- Split
vim.keymap.set('n', '|', function()
  vim.cmd.vsplit()
  vim.cmd.wincmd('l')
  vim.api.nvim_win_set_width(0, 70)
  vim.opt_local.number = false
  vim.opt_local.relativenumber = false
end)


-- Refresh config
vim.keymap.set('n', '<leader>r', "<cmd>source %<CR>")


-- Clean after a search
vim.api.nvim_set_keymap('n', '<Esc>', ':noh<CR>', { noremap = true, silent = true })


-- QuickFix
vim.keymap.set('n', '<leader>qo', vim.cmd.copen, { desc = "Open the quickfix list" })
vim.keymap.set('n', '<leader>qc', vim.cmd.cclose, { desc = "Close the quickfix list" })


-- LSP Settings
-- Cusomize the hover option
local lsp_window_width = vim.api.nvim_win_get_width(0)
local lsp_window_height = math.floor(vim.api.nvim_win_get_height(0) * .4)

local floating_window_bottom = {
  height = lsp_window_height,
  width = lsp_window_width,
  max_height = lsp_window_height,
  offset_y = 100,
  border = 'rounded',
}

vim.keymap.set('n', 'K', function()
  vim.lsp.buf.hover(floating_window_bottom)
end, { desc = 'Customize the hover for the lsp' })

vim.keymap.set('n', '<C-w>d', function()
  vim.diagnostic.open_float(floating_window_bottom)
end, { desc = 'Customize the diagnostics float window', remap = false })

vim.keymap.set('n', '<leader>hl', function()
  vim.cmd.checkhealth "vim.lsp"
end, { desc = "Check LSP Health" })


-- Diagnostics
vim.keymap.set("n", "<leader>de", "<cmd>TinyInlineDiag enable<cr>", { desc = "Enable diagnostics" })
vim.keymap.set("n", "<leader>dd", "<cmd>TinyInlineDiag disable<cr>", { desc = "Disable diagnostics" })
vim.keymap.set("n", "<leader>dt", "<cmd>TinyInlineDiag toggle<cr>", { desc = "Toggle diagnostics" })


-- These GLOBAL keymaps are created unconditionally when Nvim starts:
-- - "grn" is mapped in Normal mode to |vim.lsp.buf.rename()|
-- - "gra" is mapped in Normal and Visual mode to |vim.lsp.buf.code_action()|
-- - "grr" is mapped in Normal mode to |vim.lsp.buf.references()|
-- - "gri" is mapped in Normal mode to |vim.lsp.buf.implementation()|
-- - "grt" is mapped in Normal mode to |vim.lsp.buf.type_definition()|
-- - "gO" is mapped in Normal mode to |vim.lsp.buf.document_symbol()|
-- - CTRL-S is mapped in Insert mode to |vim.lsp.buf.signature_help()|


-- Show the git graph
vim.keymap.set("n", "<leader>gl", function()
  require('gitgraph').draw({}, { all = true, max_count = 5000 })
end
, { desc = "GitGraph - Draw", })
