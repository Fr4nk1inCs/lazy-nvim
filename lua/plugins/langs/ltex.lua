return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                ltex = {},
            },
        },
    },
    {
        "jhofscheier/ltex-utils.nvim",
        dependencies = {
            "nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "neovim/nvim-lspconfig",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require("ltex-utils").setup()
            require("lspconfig").ltex.setup({
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
                on_attach = function(client, bufnr)
                    require("ltex-utils").on_attach(bufnr)
                end,
                settings = {
                    ltex = {
                        completionEnabled = true,
                    },
                },
            })
        end,
    },
}
