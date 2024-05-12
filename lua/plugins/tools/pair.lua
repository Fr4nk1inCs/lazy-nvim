return {
    {
        "altermo/ultimate-autopair.nvim",
        event = { "InsertEnter", "CmdlineEnter" },
        opts = {
            extensions = {
                filetype = {
                    nft = { "tex", "plaintex", "latex" },
                },
            },
            tabout = {
                enable = true,
                map = "<tab>",
                cmap = "<tab>",
                hopout = true,
                do_nothing_if_fail = false,
            },
        },
    },
}
