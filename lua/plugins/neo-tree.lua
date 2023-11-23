if vim.g.vscode then
    return {}
end

return {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
        filesystem = {
            filtered_items = {
                hide_gitignored = false,
                hide_dotfiles = false,
            },
        },
    },
}
