local api = vim.api

local function generate_empty_lines(size)
    local fill = {}
    for _ = 1, size do
        table.insert(fill, "")
    end
    return fill
end

local function center_header(header)
    local size = math.floor(vim.o.lines / 2)
        - math.ceil(#header / 2)
        - 2
    local fill = generate_empty_lines(size)
    return vim.list_extend(fill, header)
end

local header_content = {
    [[                                                                       ]],
    [[                                                                     ]],
    [[       ████ ██████           █████      ██                     ]],
    [[      ███████████             █████                             ]],
    [[      █████████ ███████████████████ ███   ███████████   ]],
    [[     █████████  ███    █████████████ █████ ██████████████   ]],
    [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
    [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
    [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
    [[                                                                       ]],
}

return {
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup({
                theme = 'doom',
                config = {
                    header = center_header(header_content),
                    week_header = {
                        enable = false,
                    },
                    center = {
                        {
                            icon = '󰱼  ',
                            icon_hl = 'Type',
                            desc = 'Find File',
                            desc_hl = '',
                            key = 'f',
                            key_hl = 'DashboardFooter',
                            key_format = ' [%s]', -- `%s` will be substituted with value of `key`
                            action = 'Telescope find_files',
                        },
                        {
                            icon = '  ',
                            icon_hl = 'Type',
                            desc = 'File Tree',
                            desc_hl = '',
                            key = 't',
                            key_hl = 'DashboardFooter',
                            key_format = ' [%s]', -- `%s` will be substituted with value of `key`
                            action = 'Telescope file_browser',
                        },
                        {
                            icon = '󰈔  ',
                            icon_hl = 'Type',
                            desc = 'New Buffer',
                            desc_hl = '',
                            key = 'b',
                            key_hl = 'DashboardFooter',
                            key_format = ' [%s]', -- `%s` will be substituted with value of `key`
                            action = 'enew',
                        },
                        {
                            icon = '  ',
                            icon_hl = 'Type',
                            desc = 'Recent',
                            desc_hl = '',
                            key = 'r',
                            key_hl = 'DashboardFooter',
                            key_format = ' [%s]', -- `%s` will be substituted with value of `key`
                            action = 'Telescope oldfiles',
                        },
                    },
                    footer = {},
                },
            })
            -- local bufnr = api.nvim_get_current_buf()
            -- vim.defer_fn(function()
            --     center_dashboard(bufnr)
            -- end, 0)
        end,
        dependencies = { { 'nvim-tree/nvim-web-devicons' } }
    }
}
