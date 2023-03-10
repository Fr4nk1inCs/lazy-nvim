return {
    {
        "folke/noice.nvim",
        opts = {
            presets = {
                lsp_doc_border = true,
                inc_rename = true,
            },
            views = {
                popup = {
                    win_options = {
                        winblend = 0,
                    },
                },
                mini = {
                    win_options = {
                        winblend = 0,
                    },
                },
            },
        },
    },
}
