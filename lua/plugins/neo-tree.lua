return {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
        filesystem = {
            filtered_items = {
                hide_gitignored = false,
                hide_dotfiles = false,
                bind_to_cwd = true,
            },
            follow_current_file = false,
        },
        buffers = {
            follow_current_file = false,
        },
    },
}
