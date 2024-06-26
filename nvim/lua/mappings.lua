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
map("n", "<C-e>", "6<C-e>", { desc = "scroll down 6 lines" })
map("n", "<C-y>", "6<C-y>", { desc = "scroll up 6 lines" })
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "lsp diagnostic loclist" })
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new" })
map("n", "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "format files" })
-- map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })

-- GENERAL VISUAL MODE
map("v", "<", "<gv", { desc = "indent left" })
map("v", ">", ">gv", { desc = "indent right" })
map("v", "<leader>ds", vim.diagnostic.setloclist, { desc = "lsp diagnostic loclist" })
map("v", "<leader>kh", "<cmd>call v:lua.toggle_diagnostics()<CR>", { desc = "toggle diagnostics" })
map("v", "<C-e>", "6<C-e>", { desc = "scroll down 6 lines" })
map("v", "<C-y>", "6<C-y>", { desc = "scroll up 6 lines" })
map("v", "q", ":noh<CR>", { desc = "noh", silent = true })
map("v", "<leader>q", "q", { desc = "record macro" })
map("v", "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "format files" })

-- OTHER
map("x", "p", "p:let @+=@0<CR>:let @\"=@0<CR>", { desc = "dont copy replaced text" })


-- COMMENTS
map("n", "<leader>/", "gcc", { desc = "comment toggle", remap = true })
map("v", "<leader>/", "gc", { desc = "comment toggle", remap = true })
-- vim.api.nvim_set_keymap('i', '<S-CR>', '<C-o>o<C-o>:setlocal formatoptions+=ro<CR>', { noremap = true, silent = true })

-- NVIMTREE
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map("n", "<leader>th", "<cmd>Telescope themes<CR>", { desc = "telescope nvchad themes" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
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


-- LEAP
-- map({'n', 'x', 'o'}, 's',  '<Plug>(leap-forward)')
-- map({'n', 'x', 'o'}, 'S',  '<Plug>(leap-backward)')
-- map({'n', 'x', 'o'}, 'gs', '<Plug>(leap-from-window)')

-- BLANKLINE
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



map("n", "<leader>ks", function()
  vim.lsp.buf.signature_help()
end, { desc = "lsp signature help" })

-- TODO: FIX THESE
-- terminal
-- map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })
-- new terminals
-- map("n", "<leader>h", function()
--   require("nvchad.terminal").new { pos = "sp" }
-- end, { desc = "terminal new horizontal term" })
--
-- map("n", "<leader>v", function()
--   require("nvchad.terminal").new { pos = "vsp" }
-- end, { desc = "terminal new vertical window" })
--
-- -- toggleable
-- map({ "n", "t" }, "<A-v>", function()
--   require("nvchad.terminal").toggle { pos = "vsp", id = "vtoggleTerm" }
-- end, { desc = "terminal toggleable vertical term" })
--
-- map({ "n", "t" }, "<A-h>", function()
--   require("nvchad.terminal").toggle { pos = "sp", id = "htoggleTerm" }
-- end, { desc = "terminal new horizontal term" })
--
-- map({ "n", "t" }, "<A-i>", function()
--   require("plugins.nvchad.terminal").toggle { pos = "float", id = "floatTerm" }
-- end, { desc = "terminal toggle floating term" })

-- map("n", "<tab>", function()
--   require("nvchad.tabufline").next()
-- end, { desc = "buffer goto next" })
-- map("n", "<S-tab>", function()
--   require("nvchad.tabufline").prev()
-- end, { desc = "buffer goto prev" })
-- map("n", "<leader>x", function()
--   require("nvchad.tabufline").close_buffer()
-- end, { desc = "buffer close" })
--         ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
--         ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
--         ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
--         ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
--
--
--     v = {
--         ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
--         ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },

--     },
--
--     x = {
--         ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
--         ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
--         -- Don't copy the replaced text after pasting in visual mode
--         -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
--         ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', "Dont copy replaced text", opts = { silent = true } },
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
