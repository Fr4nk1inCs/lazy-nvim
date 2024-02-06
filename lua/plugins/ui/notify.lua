if vim.g.neovide then
    OPTS = {}
else
    OPTS = { background_colour = "#000000" }
end

return {
    {
        "rcarriga/nvim-notify",
        opts = OPTS,
    },
}
