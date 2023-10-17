local M = {}

-- In order to disable a default keymap, use


-- Your custom mappings
M.custom = {
    i =
    {
        ["jk"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
    },
    n =
    {
        ["<leader>l"] = {"g_", "go to last character of line"},
        ["<leader>h"] = {"^", "go to first character of line"},
    }
}
return M
