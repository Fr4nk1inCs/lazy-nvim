local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.offsetEncoding = "utf-8"

return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
        },
        opts = {
            servers = {
                clangd = {
                    capabilities = capabilities,
                },
            },
        },
    },
}
