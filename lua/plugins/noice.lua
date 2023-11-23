if vim.g.vscode then
    return {}
end

return {
    {
        "folke/noice.nvim",
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
                            width = 80,
                        },
                    },
                },
            },
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
