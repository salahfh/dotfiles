return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    "tpope/vim-dadbod",
    "kristijanhusak/vim-dadbod-completion",
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_disable_info_notifications = 1
    vim.g.db_ui_execute_on_save = 0
  end,
}
