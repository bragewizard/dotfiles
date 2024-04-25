vim.opt.guicursor = "i:hor20"
vim.opt.expandtab = true
vim.opt.relativenumber = false
vim.opt.numberwidth=4
vim.opt.tabstop = 2
vim.opt.shiftwidth = 4
vim.o.termguicolors = true
vim.opt.foldmethod = "indent"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldnestmax = 1
vim.opt.foldmarker = "//<,//>"
vim.opt.foldenable = false
vim.g.zig_fmt_autosave = 0
vim.g.lua_snippets_path = "~/.config/nvim/lua/custom/lua_snippets/"
vim.g.tex_flavour = 'latex'
vim.g.vimtex_view_method = "zathura"
vim.opt.conceallevel = 1
vim.g.vimtex_syntax_conceal = {
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


local enable_providers = {
      "python3_provider",
      -- "node_provider",
      -- and so on
    }
    for _, plugin in pairs(enable_providers) do
      vim.g["loaded_" .. plugin] = nil
      vim.cmd("runtime " .. plugin)
    end

vim.g.diagnostics_visible = true
function _G.toggle_diagnostics()
  if vim.g.diagnostics_visible then
    vim.g.diagnostics_visible = false
    vim.diagnostic.disable()
  else
    vim.g.diagnostics_visible = true
    vim.diagnostic.enable()
  end
end

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*.wgsl",
    callback = function()
    vim.bo.filetype = "wgsl"
  end,
})




vim.g.python3_host_prog = '/usr/bin/python3'
vim.g.jukit_shell_cmd = 'ipython3'
vim.g.jukit_terminal = 'kitty'
-- Terminal to use. Can be one of '', 'kitty', 'vimterm', 'nvimterm' or 'tmux'. If '' is given then will try to detect terminal (though this might fail, in which case it simply defaults to 'vimterm' or 'nvimterm' - depending on the output of `has("nvim")`)
vim.g.jukit_auto_output_hist = 0
-- If set to 1, will create an autocmd with event `CursorHold` to show saved ipython output of current cell in output-history split. Might slow down (n)vim significantly, you can use `set updatetime=<number of milliseconds>` to control the time to wait until CursorHold events are triggered, which might improve performance if set to a higher number (e.g. `set updatetime=1000`).
vim.gjukit_use_tcomment = 0
-- Whether to use tcomment plugin (https://github.com/tomtom/tcomment_vim) to comment out cell markers. If not, then cell markers will simply be prepended with `g:jukit_comment_mark`
vim.g.jukit_comment_mark = '#'
-- See description of `g:jukit_use_tcomment` above
vim.g.jukit_mappings = 1
-- If set to 0, none of the default function mappings (as specified further down) will be applied
vim.g.jukit_mappings_ext_enabled = "*"
-- String or list of strings specifying extensions for which the mappings will be created. For example, `let g:jukit_mappings_ext_enabled=['py', 'ipynb']` will enable the mappings only in `.py` and `.ipynb` files. Use `let g:jukit_mappings_ext_enabled='*'` to enable them for all files.
vim.g.jukit_notebook_viewer = 'jupyter-notebook'
-- Command to open .ipynb files, by default jupyter-notebook is used. To use e.g. vs code instead, you could set this to `let g:jukit_notebook_viewer = 'code'`
vim.g.jukit_convert_overwrite_default = -1
-- Default setting when converting from .ipynb to .py or vice versa and a file of the same name already exists. Can be of [-1, 0, 1], where -1 means no default (i.e. you'll be prompted to specify what to do), 0 means never overwrite, 1 means always overwrite
vim.g.jukit_convert_open_default = -1
-- Default setting for whether the notebook should be opened after converting from .py to .ipynb. Can be of [-1, 0, 1], where -1 means no default (i.e. you'll be prompted to specify what to do), 0 means never open, 1 means always open
vim.g.jukit_file_encodings = 'utf-8'
-- Default encoding for reading and writing to files in the python helper functions
vim.g.jukit_venv_in_output_hist = 1
-- Whether to also use the provided terminal command for the output history split when starting the splits using the JukitOUtHist command. If 0, the provided terminal command is only used in the output split, not in the output history split.
vim.g.jukit_savefig_dpi = 200
-- Value for `dpi` argument for matplotlibs `savefig` function
vim.g.jukit_mpl_block = 1
-- If set to 0, then `plt.show()` will by default be executed as if `plt.show(block=False)` was specified
vim.g.jukit_custom_backend = -1
-- Custom matplotlib backend to use
-- IF KITTY IS USED:
-- vim.g.jukit_mpl_style = jukit#util#plugin_path() . '/helpers/matplotlib-backend-kitty/backend.mplstyle'
-- File specifying matplotlib plot options. This is the default value if kitty terminal is used
-- IF KITTY OR TMUX IS USED:
vim.g.jukit_inline_plotting = 1
-- Enable in-terminal-plotting. Only supported for kitty or tmux+iTerm2 -> BE SURE TO SPECIFY THE TERMINAL VIA `g:jukit_terminal`! (see variables in section 'Basic jukit options')
-- vim.g.jukit_output_bg_color = get(g:, 'jukit_output_bg_color', '')
-- Optional custom background color of output split window (i.e. target window of sent code)
-- vim.g.jukit_output_fg_color = get(g:, 'jukit_output_fg_color', '')
-- Optional custom foreground color of output split window (i.e. target window of sent code)
-- vim.g.jukit_outhist_bg_color = get(g:, 'jukit_outhist_bg_color', '#090b1a')
-- Optional custom background color of output-history window
-- vim.g.jukit_outhist_fg_color = get(g:, 'jukit_outhist_fg_color', 'gray')
-- Optional custom foreground color of output-history window
vim.g.jukit_output_new_os_window = 0
-- If set to 1, opens output split in new os-window. Can be used to e.g. write code in one kitty-os-window on your primary monitor while sending code to the shell which is in a seperate kitty-os-window on another monitor.
vim.g.jukit_outhist_new_os_window = 0
-- Same as `g:jukit_output_new_os_window`, only for output-history-split


vim.g.jukit_layout = {
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
