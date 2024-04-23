local M = {}

-- In order to disable a default keymap, use


-- Your custom mappings
M.custom = {
    i =
    {
        ["jk"] = { "<ESC>", "escape insert mode" },
        ["JK"] = { "<ESC>", "escape insert mode" },
    },
    n =
    {
        ["<leader>kh"] = {':call v:lua.toggle_diagnostics()<CR>', "toggle diagnostics"},
        ["<C-e>"] = { "6<C-e>", "scroll down 6 lines"},
        ["<C-y>"] = { "6<C-y>", "scroll up 6 lines"},
        ["<leader>l"] = {"i<SPACE><ESC>", "insert space"},
        ["<leader>j"] = {"i<CR><ESC>","break line"},
        ["q"] = {':noh<CR>', "noh"},
        ["<leader>q"] = {"q", "record macro"},
    },
    v =
    {
        ["<leader>kh"] = {':call v:lua.toggle_diagnostics()<CR>', "toggle diagnostics"},
        ["<C-e>"] = { "6<C-e>", "scroll down 6 lines"},
        ["<C-y>"] = { "6<C-y>", "scroll up 6 lines"},
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
