if vim.g.vscode then
    return {}
end

return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                typst_lsp = {
                    root_dir = require("lspconfig.util").root_pattern("*.typ"),
                    exportPdf = "onType",
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
            get_root = function(bufnr_of_typst_buffer)
                return vim.fn.fnamemodify(vim.fn.expand("%:p"), ":h")
            end,
        },
    },
}
