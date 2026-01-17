-- TODO: Add mapping C-/ in insert mode to auto comment line.
-- TODO: Change the behavior of telescope to open the file in a new tab directly rather
-- than the current buffer
-- TODO: Write a shortcut function to run dune build "filename.exe" && dune exec "filename.exe"
-- in a floating terminal window

vim.opt.relativenumber = false
--
vim.keymap.set("n", "<leader>r", ":source % <CR>", { desc = "Reload Current Config File" })

-- Disable the tree
-- vim.keymap.del("n", "<leader>o")
vim.keymap.del("n", "<leader>e")
-- Delete other keymaps
vim.keymap.del("n", "<leader>h")
vim.keymap.del("n", "<leader>n")
