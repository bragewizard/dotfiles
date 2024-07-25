return {
    {
        'akinsho/toggleterm.nvim',
        keys = {"<C-\\>"},
        version = "*",
        opts = {--[[ things you want to change go here]]},
        config = function()
            require('toggleterm').setup {
                size = 20,
                open_mapping = [[<C-\>]],
                hide_numbers = true, -- hide the number column in toggleterm buffers
                shade_terminals = true,
                shading_factor = 1, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
                start_in_insert = true,
                insert_mappings = true, -- whether or not the open mapping applies in insert mode
                terminal_mappings = true, -- mapping to open and close terminal
                persist_size = false,
                direction = 'float',
                close_on_exit = true, -- close the terminal window when the process exits
                shell = vim.o.shell, -- change the default shell
                float_opts = {
                    border = 'curved',
                }
            }
        end
    }
}

