local opt = vim.opt
local g = vim.g
-- local v = vim.v

-------------------------------------- globals -----------------------------------------
g.zig_fmt_autosave = 0
g.typst_conceal = 1
g.typst_conceal_math = 1
g.diagnostics_visible = true
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.goyo_width = 140
g.goyo_height = 90
-------------------------------------- options ------------------------------------------

opt.shell = "/bin/zsh"
opt.laststatus = 3 -- global statusline
-- opt.cmdheight = 0
opt.showmode = false
opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.guicursor = "i-r:hor20"
opt.expandtab = true
opt.relativenumber = false
opt.numberwidth= 1
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.smartindent = true
opt.autoindent = true
opt.textwidth = 140
opt.foldmethod = "manual"
opt.foldtext = ''
opt.foldnestmax = 1
opt.foldminlines = 1
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevelstart = 0
opt.formatoptions:remove({ 'r', 'o', 't' })
opt.formatoptions:append({ 'c' })
opt.conceallevel = 0
opt.hidden = true
-- Indenting

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.ruler = false

-- disable nvim intro
opt.shortmess:append "sI"

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true
opt.wrap = false

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250
-- opt.whichwrap:append "<>[]hl"


-- PROVIDERS
local enable_providers = {
      "python3_provider",
      -- "node_provider",
      -- and so on
    }
    for _, plugin in pairs(enable_providers) do
      vim.g["loaded_" .. plugin] = nil
      vim.cmd("runtime " .. plugin)
    end
-- disable some default providers
for _, provider in ipairs { "node", "perl", "python3", "ruby" } do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

local goyo_active = false
local function goyo_enter()
    goyo_active = true
    require('lualine').hide()
end
local function goyo_leave()
    goyo_active = false
    require('lualine').hide({unhide = true})
end

function _G.toggle_goyo()
  if not goyo_active then
    vim.cmd "Goyo"
  else
    vim.cmd "Goyo!"
  end
end
-------------------------------------- autocmds ------------------------------------------
local autocmd = vim.api.nvim_create_autocmd


local GoyoGroup = vim.api.nvim_create_augroup('GoyoGroup', { clear = true })

vim.api.nvim_create_autocmd('User', {
    pattern = 'GoyoEnter',
    callback = goyo_enter,
    group = GoyoGroup
})

vim.api.nvim_create_autocmd('User', {
    pattern = 'GoyoLeave',
    callback = goyo_leave,
    group = GoyoGroup
})

-- dont list quickfix buffers
autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})


-- Ensure correct backgrond for lualine.
autocmd({ "BufWinEnter", "WinEnter" }, {
    callback = function(_) require("lualine").setup({}) end,
    pattern = { "*.*" },
    once = true,
})


autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ 'r', 'o' })
    vim.opt_local.formatoptions:append({ 'c' })
  end,
})

autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*.wgsl",
    callback = function()
    vim.bo.filetype = "wgsl"
  end,
})


autocmd({"BufWritePost", "BufDelete"}, {
  group = vim.api.nvim_create_augroup("RememberFolds", { clear = true }),
  pattern = {"*"},
  callback = function()
    if vim.b.view_activated then
      vim.cmd.mkview()
    end
  end
})

autocmd("BufRead", {
  group = "RememberFolds",
  pattern = {"*"},
  callback = function()
    if not vim.b.view_activated then
      local filetype = vim.bo.filetype
      local buftype = vim.bo.buftype
      local ignore_filetypes = { "gitcommit", "gitrebase", "svg", "hgcommit" }

      if buftype == "" and not vim.tbl_contains(ignore_filetypes, filetype) then
        vim.b.view_activated = true
        vim.cmd.loadview({ mods = { emsg_silent = true } })
      end
    end
  end
})
-------------------------------------- commands ------------------------------------------

function _G.toggle_diagnostics()
  if vim.g.diagnostics_visible then
    vim.g.diagnostics_visible = false
    vim.diagnostic.enable(false)
  else
    vim.g.diagnostics_visible = true
    vim.diagnostic.enable(true)
  end
end
