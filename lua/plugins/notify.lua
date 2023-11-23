if vim.g.vscode then
    return {}
end

return { {
    "rcarriga/nvim-notify",
    opts = {
        background_colour = "#000000",
    },
} }
