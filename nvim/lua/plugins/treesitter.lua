return {
    {
        "nvim-treesitter/nvim-treesitter",
        init = function()
            require("utils").lazy_load "nvim-treesitter"
        end,
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        build = ":TSUpdate",
        opts = {
                ensure_installed = {
                    "vim",
                    "lua",
                    "python",
                    "gdscript",
                    "godot_resource",
                    "bash",
                    "bibtex",
                    "markdown",
                    "make",
                    "html",
                    "css",
                    "javascript",
                    "typescript",
                    "tsx",
                    "json",
                    "c",
                    "java",
                    "cpp",
                    "zig",
                    "rust",
                    "wgsl",
                    "glsl",
                },
                highlight = {
                    enable = true,
                    use_languagetree = true,
                },

                indent = { enable = false },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
}
