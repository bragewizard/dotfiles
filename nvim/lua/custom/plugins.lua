local plugins = {
    "lukas-reineke/indent-blankline.nvim",
        version = "2.20.7",
        init = function()
          require("core.utils").lazy_load "indent-blankline.nvim"
        end,
        opts = function()
          return require("custom.configs.blankline").blankline
        end,
        config = function(_, opts)
          require("core.utils").load_mappings "blankline"
          dofile(vim.g.base46_cache .. "blankline")
          require("indent_blankline").setup(opts)
        end,
    {
        "tpope/vim-surround",
        lazy = false
    },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require "custom.configs.copilot"
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "pyright",
                "prettier",
                "clangd",
                "wgsl-analyzer"
            }
        }
    },


    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "jose-elias-alvarez/null-ls.nvim",
            config = function()
                require "custom.configs.null-ls"
            end,
        },
        config = function ()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end
    },


    {
        "NvChad/nvim-colorizer.lua",
        config = function ()
            require "custom.configs.colorizer"
            vim.defer_fn(function()
                require("colorizer").attach_to_buffer(0)
            end, 0)
        end

    },


    {
        "lewis6991/gitsigns.nvim",
        opts = function()
            return require("plugins.configs.others").gitsigns
        end,
        config = function(_,opts)
            dofile(vim.g.base46_cache .. "git")
            require("gitsigns").setup(opts)
            require "custom.configs.gitsigns"
        end,
    },


    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            {
                -- snippet plugin
                "L3MON4D3/LuaSnip",
                dependencies = "rafamadriz/friendly-snippets",
                    "iurimateus/luasnip-latex-snippets.nvim",
                opts = { history = true,
                    updateevents = "TextChanged,TextChangedI",
                    enable_autosnippets = true,
                },
                config = function(_, opts)
                    require("plugins.configs.others").luasnip(opts)
                end,
            },
        },

        opts = function()
          return require "custom.configs.cmp"
        end,
        config = function(_, opts)
          require("cmp").setup(opts)
        end,
    },



    {
        "lervag/vimtex",
        ft = "tex",
    },


    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                -- defaults 
                "vim",
                "lua",
                "python",
                "gdscript",
                "godot_resource",
                "bash",
                -- "latex",
                "bibtex",
                "markdown",
                "make",
                -- -- web dev 
                "html",
                "css",
                "javascript",
                "typescript",
                "tsx",
                "json",
                -- "vue", "svelte",

                -- low level
                "c",
                "java",
                "cpp",
                "rust",
                "wgsl",
                "glsl",
            },
            highlight = {
                enable = { "wgsl", "c", "rust", "cpp" }
                -- disable = { "rust", "c", "python" },
            },
        },
    },
    {
        "folke/zen-mode.nvim",
        cmd = {'ZenMode'},
    },
}
return plugins
