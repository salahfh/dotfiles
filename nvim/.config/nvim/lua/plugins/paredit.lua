return {
  "kovisoft/paredit",
  ft = { "clojure", "scheme", "lisp", "racket" },       -- Only load for Lisp-like languages
  init = function()
    -- Disable default mappings if you want to define your own
    -- vim.g.paredit_mode = 0

    -- Recommended: Prevent it from fighting with other auto-pair plugins
    vim.g.paredit_electric_return = 0
  end
}
