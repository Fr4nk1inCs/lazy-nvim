if vim.g.vscode then
    return {}
end

if vim.g.neovide then
    OPTS = {
        defaults = {
            winblend = 100,
        },
    }
else
    OPTS = {}
end

return {
    "nvim-telescope/telescope.nvim",
    opts = OPTS,
}
