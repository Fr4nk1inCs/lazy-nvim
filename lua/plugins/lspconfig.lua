if vim.g.vscode then
    return {}
end

return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            inlay_hints = {
                enabled = true,
            },
        },
    },
}
