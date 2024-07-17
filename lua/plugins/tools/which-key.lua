if vim.g.neovide then
    OPTS = {
        win = {
            border = "rounded",
            wo = {
                winblend = 70,
            },
        },
    }
else
    OPTS = {
        win = {
            border = "rounded",
        },
    }
end

return {
    "folke/which-key.nvim",
    opts = OPTS,
}
