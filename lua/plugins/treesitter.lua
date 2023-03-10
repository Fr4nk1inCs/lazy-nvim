return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-refactor",
            "p00f/nvim-ts-rainbow",
        },
        opts = {
            ensure_installed = {
                "bash",
                "c",
                "help",
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
                extended_mode = true,
                disable = {},
            },
        },
    },
}
