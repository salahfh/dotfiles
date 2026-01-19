-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Telescope Vim keymaps' })
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
end )

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


-- Cusomize the hover option
local lsp_window_width = vim.api.nvim_win_get_width(0)
local lsp_window_height = math.floor(vim.api.nvim_win_get_height(0) * .4)

vim.keymap.set('n', 'K', function()
  vim.lsp.buf.hover {
    height = lsp_window_height,
    width = lsp_window_width,
    max_height = lsp_window_height,
    offset_y = 100,
    border = 'rounded',
    title = '',
  }

end, { desc = 'Customize the hover for the lsp' })
