-- Custom mode names.
local function fmt_mode(s)
    local mode_map = {
        ["COMMAND"] = "COMMND",
        ["V-BLOCK"] = "VBLOCK",
        ["TERMINAL"] = "TERMNL",
        ["V-REPLACE"] = "VREPLC",
        ["O-PENDING"] = "0PNDNG",
    }
    return mode_map[s] or s
end


local text_hl
local icon_hl
local green
local yellow
local red

if vim.g.colors_name == "nordic" then
    local C = require("nordic.colors")
    text_hl = { fg = C.gray3, }
    icon_hl = { fg = C.gray4, }
    green = C.green.base
    yellow = C.yellow.base
    red = C.red.base
end


local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
        }
    end
end

local function get_short_cwd() return vim.fn.fnamemodify(vim.fn.getcwd(), ":~") end

local function telescope_text() return "Telescope" end

local telescope = {
    sections = {
        lualine_a = {
            {
                "mode",
                fmt = fmt_mode,
                icon = { "" },
                separator = { right = " ", left = "" },
            },
        },
        lualine_b = {
            {
                get_short_cwd,
                padding = 0,
                icon = { "   ", color = icon_hl },
                color = text_hl,
            },
        },
        lualine_c = {
            {
                telescope_text,
                color = text_hl,
                icon = { "  ", color = icon_hl },
            },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
            {
                "location",
                icon = { "", align = "left", color = icon_hl },
            },
            {
                "progress",
                icon = { "", align = "left", color = icon_hl },
                separator = { right = "", left = "" },
            },
        },
    },
    filetypes = { "TelescopePrompt" },
}



return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        lazy = false,
        config = function()
            require('lualine').setup({
                sections = {
                    lualine_a = {
                        {
                            "mode",
                            fmt = fmt_mode,
                            icon = { "" },
                            separator = { right = " ", left = "" },
                        },
                    },
                    lualine_b = {},
                    lualine_c = {
                        {
                            "",
                            color = text_hl,
                            padding = 0,
                            separator = "",
                        },
                        {
                            "branch",
                            color = text_hl,
                            icon = { "", color = icon_hl },
                            separator = "",
                            padding = 0,
                        },
                        {
                            "cmp",
                            padding = { left = 1 },
                            color = text_hl,
                            separator = "",
                        },
                        {
                            "diff",
                            color = text_hl,
                            icon = { "  ", color = text_hl },
                            source = diff_source,
                            symbols = {
                                added = " ",
                                modified = " ",
                                removed = " ",
                            },
                            diff_color = {
                                added = icon_hl,
                                modified = icon_hl,
                                removed = icon_hl,
                            },
                            padding = 0,
                        },
                    },
                    lualine_x = {
                        {
                            "diagnostics",
                            sources = { "nvim_diagnostic" },
                            symbols = {
                                error = " ",
                                warn = " ",
                                info = " ",
                                hint = "󱤅 ",
                                other = "󰠠 ",
                            },
                            colored = true,
                            padding = 2,
                        },
                        {
                            "buf",
                            padding = 1,
                            color = text_hl,
                            icon = { " ", color = icon_hl },
                        },
                        {
                            "copilot",
                            padding = 1,
                            color = icon_hl,
                            show_colors = true,
                            symbols = {
                                status = {
                                    icons = {
                                        enabled = " ",
                                        disabled = " ",
                                        warning = " ",
                                        unknown = " ",
                                    },
                                    hl = {
                                        enabled = green,
                                        disabled = red,
                                        warning = yellow,
                                        unknown = red,
                                    },
                                },
                                spinners = { " " },
                                spinner_color = green,
                            },
                        },
                        {
                            require("noice").api.status.mode.get,
                            cond = require("noice").api.status.mode.has,
                            icon = { " " },
                        },
                    },
                    lualine_y = {},
                    lualine_z = {
                        {
                            "location",
                            icon = { "", align = "left" },
                        },
                        {
                            "progress",
                            icon = { "", align = "left" },
                            separator = { right = "", left = "" },
                        },
                    },
                },
                options = {
                    disabled_filetypes = { "dashboard" },
                    globalstatus = true,
                    section_separators = { left = " ", right = " " },
                    component_separators = { left = "", right = "" },
                },
                extensions = {
                    telescope,
                },
            })
        end,
    }
}
