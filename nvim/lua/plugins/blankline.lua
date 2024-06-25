local opts = {
  indentLine_enabled = 1,
  filetype_exclude = {
    "help",
    "terminal",
    "lazy",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "mason",
    "nvdash",
    "nvcheatsheet",
    "",
  },
  buftype_exclude = { "terminal" },
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  show_current_context = false,
  show_current_context_start = false,
}


return {
    {
        "lukas-reineke/indent-blankline.nvim",
        version = "2.20.7",
        init = function()
            require("utils").lazy_load "indent-blankline.nvim"
        end,
        config = function()
            require("indent_blankline").setup(opts)
        end,
    },
}
