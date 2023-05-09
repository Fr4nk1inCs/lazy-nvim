return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                typst_lsp = {
                    root_dir = require("lspconfig.util").root_pattern("*.typ"),
                    exportPdf = "never",
                },
            },
        },
    },
    {
        "kaarmu/typst.vim",
        ft = "typst",
        lazy = false,
    },
}
