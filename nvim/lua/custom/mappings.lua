local M = {}

-- In order to disable a default keymap, use


-- Your custom mappings
M.custom = {
    i =
    {
        ["jk"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
        ["JK"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
    },
    n =
    {
        ["<leader>lh"] = {':call v:lua.toggle_diagnostics()<CR>', "toggle diagnostics"},
        ["<C-e>"] = { "4<C-e>", "scroll down 4 lines"},
        ["<C-y>"] = { "4<C-y>", "scroll up 4 lines"},
        ["q"] = {':noh<CR>', "noh"},
        ["<leader>q"] = {"q", "record macro"},
    },
    v =
    {
        ["<leader>lh"] = {':call v:lua.toggle_diagnostics()<CR>', "toggle diagnostics"},
        ["<C-e>"] = { "4<C-e>", "scroll down 4 lines"},
        ["<C-y>"] = { "4<C-y>", "scroll up 4 lines"},
        ["q"] = {':noh<CR>', "noh"},
        ["<leader>q"] = {"q", "record macro"},
    }
}

  


-- M.jukit = {
--     n =
--     {
--         -- nnoremap <cr> :call jukit#send#line()<cr>
--         -- Send current line to output split
--         ["<C-K>"] =  {":call jukit#send#line()<CR>", "Send current line to output split", opts = { noremap = true }},
--
--     },
--     v =
--     {
--         ["<C-K>"] =  {":call jukit#send#selection()<CR>", "Send visually selected code to output split", opts = { noremap = true }},
--         -- vnoremap <cr> :<C-U>call jukit#send#selection()<cr>
--         -- Send visually selected code to output split
--     },
-- }
return M
