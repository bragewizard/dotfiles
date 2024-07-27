return {
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup({
                theme = 'hyper',
                config = {
                    header = {
                        "            @@@%%%%%%%%%@@          ",
                        "         @@@%%%%%%%%%#######%@@     ",
                        "       @@@@%%%%%%%######?######%@   ",
                        "      @@@@%%%%%%%#######:########%@ ",
                        "    @@@@@%%%%%%#########:??#######% ",
                        "    @@@%%%%%####???###?+:??####?###@",
                        "   @@@%%%%%%#?+???###?:+?##??###?##@",
                        " @??%@%%%##????????++:;+?+????????#@",
                        " #  ;?%#?+; ..::+?+ ::;++++++?+???# ",
                        " %  :?%;;;:  ....:#+ :;+++????+???@ ",
                        " #;;+??+++:   ...;##: ;;;++???++?%  ",
                        " %#%+::++?#+;:::;?##+ ;;;;++??++#   ",
                        " %?% : :???+?++???######?+;;+??#    ",
                        " @%# ; ;??;;+ ;???+;;:..::.:+?%     ",
                        "  @???;;?+;;;+ ;:;;......;;;#@      ",
                        "  %##?++?+++;+ ??% @%%@@@@          ",
                        "  @_:?_:+_:_:#%                     ",
                        "                                    ",
                        "                NVIM                ",
                        "                                    ",
                        "                                    ",
                    },
                    week_header = {
                        enable = false,
                    },
                    shortcut = {
                        -- { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
                        {
                            icon = '󰱼 ',
                            icon_hl = '@variable',
                            desc = 'Files',
                            group = 'Label',
                            action = 'Telescope find_files',
                            key = 'f',
                        },
                        {
                            icon = '  ',
                            icon_hl = '@variable',
                            desc = 'Tree',
                            group = 'Label',
                            action = 'Telescope file_browser',
                            key = 't',
                        },
                        {
                            icon = '󰈔 ',
                            icon_hl = '@variable',
                            desc = 'New Buffer',
                            group = 'Label',
                            action = 'enew',
                            key = 'b',
                        },
                    },
                    project = {
                        enable = false,
                    },
                    mru = {
                        limit = 10,
                        icon = '  ',
                        label = 'Recent',
                    },
                },
            })
            end,
            dependencies = { {'nvim-tree/nvim-web-devicons'}}
        }
    }
