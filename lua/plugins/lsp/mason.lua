return {
    {
        "williamboman/mason.nvim",
        event = "VeryLazy",
        opts = {
            ensure_installed = {
                "stylua",
                "shellcheck",
                "shfmt",
            },
            ui = {
                border = "rounded",
            },
        },
    },
}
