-- n, v, i, t = mode names
local map = vim.keymap.set

-- GENERAL INSERT MODE
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })
map("i", "jk", "<ESC>", { desc = "escape insert mode" })
map("i", "JK", "<ESC>", { desc = "escape insert mode" })

-- GENERAL NORMAL MODE
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })
map("n", "<C-s>", "<cmd>w<CR>", { desc = "file save" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "file copy whole" })
map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })
map("n", "<leader>td", "<cmd>call v:lua.toggle_diagnostics()<CR>", { desc = "toggle diagnostics" })
map("n", "<leader>q", "q", { desc = "record macro" })
map("n", "<leader>l", "i<SPACE><ESC>", { desc = "insert space" })
map("n", "<leader>j", "i<CR><ESC>", { desc = "break line" })
map("n", "q", ":noh<CR>", { desc = "noh", silent = true })
map("n", "<C-e>", "4<C-e>", { desc = "scroll down" })
map("n", "<C-y>", "4<C-y>", { desc = "scroll up" })
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "lsp diagnostic loclist" })
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new" })
map("n", "<leader>fm", function()
    require("conform").format { lsp_fallback = true }
end, { desc = "format files" })

-- GENERAL VISUAL MODE
map("v", "<", "<gv", { desc = "indent left" })
map("v", ">", ">gv", { desc = "indent right" })
map("v", "<leader>ds", vim.diagnostic.setloclist, { desc = "lsp diagnostic loclist" })
map("v", "<leader>kh", "<cmd>call v:lua.toggle_diagnostics()<CR>", { desc = "toggle diagnostics" })
map("v", "<C-e>", "4<C-e>", { desc = "scroll down" })
map("v", "<C-y>", "4<C-y>", { desc = "scroll up" })
map("v", "q", ":noh<CR>", { desc = "noh", silent = true })
map("v", "<leader>q", "q", { desc = "record macro" })
map("v", "<leader>fm", function()
    require("conform").format { lsp_fallback = true }
end, { desc = "format files" })

-- OTHER
map("x", "p", "p:let @+=@0<CR>:let @\"=@0<CR>", { desc = "dont copy replaced text", silent = true })


-- COMMENTS
map("n", "<leader>/", "gcc", { desc = "comment toggle", remap = true })
map("v", "<leader>/", "gc", { desc = "comment toggle", remap = true })
-- vim.api.nvim_set_keymap('i', '<S-CR>', '<C-o>o<C-o>:setlocal formatoptions+=ro<CR>', { noremap = true, silent = true })

-- telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map("n", "<leader>ft", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>", { desc = "telescope file browser" })
map(
    "n",
    "<leader>fa",
    "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
    { desc = "telescope find all files" }
)

-- WHICHKEY
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })
map("n", "<leader>wk", function()
    vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "whichkey query lookup" })


-- COPILOT
-- map("i", "<C-l>", function()
--     require("copilot.suggestion").accept()
-- end, { desc = "copilot complete" })
-- map("i", "<C-h>", function()
--     require("copilot.suggestion").dismiss()
-- end, { desc = "copilot dismiss" })
-- map("i", "<C-j>", function()
--     require("copilot.suggestion").next()
-- end, { desc = "copilot next" })
-- map("i", "<C-k>", function()
--     require("copilot.suggestion").prev()
-- end, { desc = "copilot prev" })
-- map("i", "<C-;>", function()
--     require("copilot.suggestion").accept_word()
-- end, { desc = "copilot accept" })
map("n", "<leader>tc", function()
    require("copilot.suggestion").toggle_auto_trigger()
end, { desc = "copilot toggle auto trigger" })


map("n", "<leader>tz", "<cmd>ZenMode<CR>", { desc = "toggle zen mode" })

-- LEAP
map({ 'n', 'x', 'o' }, 's', '<Plug>(leap-forward)', { desc = "leap forward" })
map({ 'n', 'x', 'o' }, 'S', '<Plug>(leap-backward)', { desc = "leap backward" })
map({ 'n', 'x', 'o' }, 'gs', '<Plug>(leap-from-window)', { desc = "leap from window" })

-- BLNKLINE
map("n", "<leader>cc", function()
    local config = { scope = {} }
    config.scope.exclude = { language = {}, node_type = {} }
    config.scope.include = { node_type = {} }
    local node = require("ibl.scope").get(vim.api.nvim_get_current_buf(), config)

    if node then
        local start_row, _, end_row, _ = node:range()
        if start_row ~= end_row then
            vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start_row + 1, 0 })
            vim.api.nvim_feedkeys("_", "n", true)
        end
    end
end, { desc = "blankline jump to current context" })


-- LSP
map("n", "<leader>ks", function()
    vim.lsp.buf.signature_help()
end, { desc = "lsp signature help" })




-- CMP
-- mapping = {
-- ["<C-p>"] = cmp.mapping.select_prev_item(),
-- ["<C-n>"] = cmp.mapping.select_next_item(),
-- ["<C-u>"] = cmp.mapping.scroll_docs(-4),
-- ["<C-d>"] = cmp.mapping.scroll_docs(4),
-- ["<C-Space>"] = cmp.mapping.complete(),
-- ["<C-e>"] = cmp.mapping.close(),
-- ["<Tab>"] = cmp.mapping(function(fallback)
--   if cmp.visible() then
--     cmp.confirm {
--                 behavior = cmp.ConfirmBehavior.Insert,
--                 select   = true,
--             }
--   elseif require("luasnip").expand_or_jumpable() then
--     vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
--   else
--     fallback()
--   end
-- end, {
--   "i",
--   "s",
-- }),
-- ["<S-Tab>"] = cmp.mapping(function(fallback)
--   if require("luasnip").jumpable(-1) then
--     vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
--   else
--     fallback()
--   end
-- end, {
--   "i",
--   "s",
-- }),
-- },


--

-- end, { desc = "buffer close" })
--         ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
--         ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
--         ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
--         ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
--
--     v = {
--         ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
--         ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },

--     },
--     x = {
--         ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
--         ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
--     },
-- }


-- M.lspconfig = {
--     plugin = true,
--
--     -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions
--
--     n = {
--         ["gD"] = {
--             function()
--                 vim.lsp.buf.declaration()
--             end,
--             "LSP declaration",
--         },
--
--         ["gd"] = {
--             function()
--                 vim.lsp.buf.definition()
--             end,
--             "LSP definition",
--         },
--
--         ["K"] = {
--             function()
--                 vim.lsp.buf.hover()
--             end,
--             "LSP hover",
--         },
--
--         ["gi"] = {
--             function()
--                 vim.lsp.buf.implementation()
--             end,
--             "LSP implementation",
--         },
--

--
--         ["<leader>D"] = {
--             function()
--                 vim.lsp.buf.type_definition()
--             end,
--             "LSP definition type",
--         },
--
--         ["<leader>ra"] = {
--             function()
--                 require("nvchad.renamer").open()
--             end,
--             "LSP rename",
--         },
--
--         ["<leader>ca"] = {
--             function()
--                 vim.lsp.buf.code_action()
--             end,
--             "LSP code action",
--         },
--
--         ["gr"] = {
--             function()
--                 vim.lsp.buf.references()
--             end,
--             "LSP references",
--         },
--
--         ["<leader>f"] = {
--             function()
--                 vim.diagnostic.open_float { border = "rounded" }
--             end,
--             "Floating diagnostic",
--         },
--
--         ["[d"] = {
--             function()
--                 vim.diagnostic.goto_prev { float = { border = "rounded" } }
--             end,
--             "Goto prev",
--         },
--
--         ["]d"] = {
--             function()
--                 vim.diagnostic.goto_next { float = { border = "rounded" } }
--             end,
--             "Goto next",
--         },
--
--         ["<leader>q"] = {
--             function()
--                 vim.diagnostic.setloclist()
--             end,
--             "Diagnostic setloclist",
--         },
--
--         ["<leader>wa"] = {
--             function()
--                 vim.lsp.buf.add_workspace_folder()
--             end,
--             "Add workspace folder",
--         },
--
--         ["<leader>wr"] = {
--             function()
--                 vim.lsp.buf.remove_workspace_folder()
--             end,
--             "Remove workspace folder",
--         },
--
--         ["<leader>wl"] = {
--             function()
--                 print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--             end,
--             "List workspace folders",
--         },
--     },
--
--     v = {
--         ["<leader>ca"] = {
--             function()
--                 vim.lsp.buf.code_action()
--             end,
--             "LSP code action",
--         },
--     },
-- }
