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
            github = {
                download_url_template = "https://sciproxy.com/https://github.com/%s/releases/download/%s/%s",
            },
        },
    },
}
