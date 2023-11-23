if vim.g.vscode then
    return {}
end

return {
    {
        "gitsigns.nvim",
        opts = { preview_config = { border = BORDER_STYLE } },
    },
}
