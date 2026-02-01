-- Auto inserts to reduice boiler code

local function map(l, r, opts)
  opts = opts or {}
  vim.keymap.set('n', l, r, opts)
end


local function current_buf_filetype()
  local bufnr = vim.api.nvim_get_current_buf()
  local ft    = vim.api.nvim_get_option_value('filetype', { buf = bufnr })
  return ft
end


vim.keymap.set('n', '<leader>sb', function()
  local ft = current_buf_filetype()
  if (ft == 'markdown') then
    vim.cmd([[normal! o- [ ]  ]])
    vim.cmd('startinsert ')
  else
    print("Keymap works only for markdown files")
  end
end, { desc = "Insert a checkbox for the markdown file." }
)


local logger = function(level)
  local logger_func = nil
  local ft = current_buf_filetype()
  -- Select logging function based on filetype/language
  if ft == 'python' then
    logger_func = 'logger'
  elseif ft == 'lua' then
    logger_func = 'logger'
  else
    print("logger_func function not defined for the '" .. ft .. "' language.")
    return
  end

  -- prompt user for mssage
  vim.ui.input({ prompt = '[' .. level:upper() .. ']: ' }, function(input)
    if input == nil then return end
    local line = logger_func .. '.' .. level .. '("' .. input .. '")'
    vim.cmd([[normal! o]] .. line)
  end)
end


-- Add keymaps for logging fuoction depending on the language (Python, lua, etc ..)
map('<leader>li', function() logger("info") end, { desc = 'Insert Info logging statement' })
map('<leader>lw', function() logger("warning") end, { desc = 'Insert Warn logging statement' })
map('<leader>le', function() logger("exception") end, { desc = 'Insert Exception logging statement' })
map('<leader>ld', function() logger("debug") end, { desc = 'Insert Debug logging statement' })
