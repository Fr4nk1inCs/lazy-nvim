return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-refactor",
            "HiPhish/nvim-ts-rainbow2",
        },
        opts = {
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
