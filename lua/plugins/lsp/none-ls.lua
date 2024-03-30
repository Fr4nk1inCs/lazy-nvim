return {
    {
        "nvimtools/none-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "mason.nvim" },
        opts = function()
            local nls = require("null-ls")
            return {
                root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
                sources = {
                    nls.builtins.formatting.stylua,
                    nls.builtins.formatting.black,
                    nls.builtins.formatting.isort,
                    nls.builtins.formatting.shfmt,
                    nls.builtins.formatting.alejandra,
                },
            }
        end,
    },
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        opts = {
            ensure_installed = {
                "stylua",
                "shfmt",
                "eslint",
            },
            automatic_installation = true,
            automatic_setup = true,
            handlers = nil,
        },
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            format = { timeout_ms = 3000 },
        },
    },
}
