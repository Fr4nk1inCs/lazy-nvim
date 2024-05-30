return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
                signature = {
                    opts = {
                        relative = "cursor",
                        size = {
                            width = 60,
                        },
                    },
                },
            },
            presets = {
                lsp_doc_border = true,
                inc_rename = true,
            },
            markdown = {
                hover = {
                    ["|(%S-)|"] = vim.cmd.help, -- vim help links
                    ["%[.-%]%((%S-)%)"] = require("noice.util").open, -- markdown links
                },
                highlights = {},
            },
        },
    },
}
