return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
        },
        opts = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local clangd_capabilities = capabilities
            clangd_capabilities.textDocument.semanticHighlighting = true
            clangd_capabilities.offsetEncoding = "utf-8"

            return {
                servers = {
                    clangd = {
                        capabilities = clangd_capabilities,
                    },
                },
            }
        end,
    },
}
