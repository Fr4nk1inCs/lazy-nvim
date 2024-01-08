return {
    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        -- tag = "*",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.keybinds"] = {
                    config = {
                        default_keybinds = true,
                    },
                },
                ["core.concealer"] = {}, -- Adds pretty icons to your documents
                ["core.completion"] = {
                    config = {
                        engine = "nvim-cmp",
                    },
                },
                ["core.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = "~/notes",
                        },
                    },
                },
            },
        },
    },
}
