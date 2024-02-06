return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                typst_lsp = {
                    root_dir = nil,
                },
            },
        },
    },
    {
        "kaarmu/typst.vim",
        ft = "typst",
        lazy = true,
    },
    {
        "chomosuke/typst-preview.nvim",
        ft = "typst",
        version = "0.1.*",
        build = function()
            require("typst-preview").update()
        end,
        opts = {
            get_root = function(_)
                return vim.fn.fnamemodify(vim.fn.expand("%:p"), ":h")
            end,
        },
    },
}
