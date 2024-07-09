local opt = vim.opt
local g = vim.g

-------------------------------------- globals -----------------------------------------
g.vimtex_syntax_conceal = {
          accents = 1,
          ligatures= 1,
          cites = 1,
          fancy = 1,
          spacing = 0,
          greek = 1,
          math_bounds = 0,
          math_delimiters = 1,
          math_fracs = 1,
          math_super_sub= 1,
          math_symbols= 1,
          sections= 0,
          styles= 1
}
g.zig_fmt_autosave = 0
g.lua_snippets_path = "~/.config/nvim/lua/custom/lua_snippets/"
g.tex_flavour = 'latex'
g.vimtex_view_method = "zathura"
g.diagnostics_visible = true
g.python3_host_prog = '/usr/bin/python3'
g.jukit_shell_cmd = 'ipython3'
g.jukit_terminal = 'kitty'
g.jukit_auto_output_hist = 0
g.jukit_comment_mark = '#'
g.jukit_mappings = 1
g.jukit_mappings_ext_enabled = "*"
g.jukit_notebook_viewer = 'jupyter-notebook'
g.jukit_convert_overwrite_default = -1
g.jukit_convert_open_default = -1
g.jukit_file_encodings = 'utf-8'
g.jukit_venv_in_output_hist = 1
g.jukit_savefig_dpi = 200
g.jukit_mpl_block = 1
g.jukit_custom_backend = -1
g.jukit_inline_plotting = 1
g.jukit_output_new_os_window = 0
g.jukit_outhist_new_os_window = 0
g.jukit_layout = {
    split = 'horizontal',
    p1 = 0.6,
    val = {
        'file_content',
        {
            split = 'vertical',
            p1 = 0.4,
            val = {'output', 'output_history'}
        }
    }
}

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
-------------------------------------- options ------------------------------------------
opt.laststatus = 3 -- global statusline
opt.cmdheight = 0
opt.showmode = false
opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.guicursor = "i:hor20"
opt.expandtab = true
opt.relativenumber = false
opt.numberwidth= 1
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.smartindent = true
opt.autoindent = true
opt.textwidth = 150
opt.foldmethod = "indent"
opt.foldnestmax = 1
opt.foldmarker = "//<,//>"
opt.foldenable = false
opt.formatoptions:remove({ 'r', 'o', 't' })
opt.formatoptions:append({ 'c' })
opt.conceallevel = 1
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
opt.whichwrap:append "<>[]hl"


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


-------------------------------------- autocmds ------------------------------------------
local autocmd = vim.api.nvim_create_autocmd

-- dont list quickfix buffers
autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})


-- Ensure correct backgrond for lualine.
vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
    callback = function(_) require("lualine").setup({}) end,
    pattern = { "*.*" },
    once = true,
})


vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ 'r', 'o' })
    vim.opt_local.formatoptions:append({ 'c' })
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*.wgsl",
    callback = function()
    vim.bo.filetype = "wgsl"
  end,
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
