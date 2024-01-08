return {
    {
        "L3MON4D3/LuaSnip",
        keys = {
            {
                "<c-.>",
                "<plug>luasnip-next-choice",
                mode = { "i", "s" },
                desc = "Select next choiceNode.",
            },
            {
                "<c-,>",
                "<plug>luasnip-prev-choice",
                mode = { "i", "s" },
                desc = "Select previous choiceNode.",
            },
        },
        init = function()
            local types = require("luasnip.util.types")
            require("luasnip").config.setup({
                update_events = "TextChanged,TextChangedI",
                enable_autosnippets = true,
                ext_opts = {
                    [types.choiceNode] = {
                        active = {
                            virt_text = { { "<- Choice Here (Prev: <C-,>, Next: <C-.>)", "SpecialComment" } },
                        },
                    },
                },
                store_selection_keys = "<Tab>",
            })

            require("luasnip.loaders.from_lua").lazy_load()
        end,
    },
}
