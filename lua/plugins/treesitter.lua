return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-refactor",
            "HiPhish/nvim-ts-rainbow2",
        },
        opts = {
            ensure_installed = {
                "bash",
                "c",
                "vimdoc",
                "html",
                "javascript",
                "json",
                "lua",
                "luap",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "tsx",
                "typescript",
                "vim",
                "yaml",
                "latex",
            },
            rainbow = {
                enable = true,
                -- list of languages you want to disable the plugin for
                disable = {},
                -- Which query to use for finding delimiters
                query = "rainbow-parens",
            },
        },
    },
}
