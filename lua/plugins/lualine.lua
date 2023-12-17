if vim.g.vscode then
    return {}
end

return {
    {
        "SmiteshP/nvim-navic",
        dependencies = "neovim/nvim-lspconfig",
        opts = {
            lsp = {
                auto_attach = true,
            },
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        opts = {
            winbar = {
                lualine_c = {
                    {
                        "navic",
                        color_correction = "dynamic",
                    },
                },
            },
        },
    },
}
