if vim.g.vscode then
    return {}
end

if vim.g.neovide then
    OPTS = {
        defaults = {
            winblend = 70,
        },
    }
else
    OPTS = {}
end

return {
    "nvim-telescope/telescope.nvim",
    opts = OPTS,
}
