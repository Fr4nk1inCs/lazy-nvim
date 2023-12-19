if vim.g.vscode then
    return {}
end

if vim.g.neovide then
    OPTS = {
        window = {
            border = "rounded",
            winblend = 70,
        },
    }
else
    OPTS = {
        window = {
            border = "rounded",
        },
    }
end

return {
    "folke/which-key.nvim",
    opts = OPTS,
}
