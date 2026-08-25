-- In Visual Mode: Format the current selection using native indentation
vim.keymap.set("v", "<A-f>", "=", { desc = "Format selected block" })

-- In Normal Mode: Format the entire document and restore cursor position
vim.keymap.set("n", "<A-f>", function()
  local view = vim.fn.winsaveview() -- Save current cursor position and scroll state
  vim.cmd("normal! gg=G")           -- Go to top, format to bottom
  vim.fn.winrestview(view)          -- Restore cursor position seamlessly
end, { desc = "Format entire document" })
