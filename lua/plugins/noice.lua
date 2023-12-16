if vim.g.vscode then
    return {}
end

if vim.g.neovide then
    WIN_BLEND = 70
else
    WIN_BLEND = 0
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
                            width = 60,
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
                        winblend = WIN_BLEND,
                    },
                },
                notify = {
                    win_options = {
                        winblend = WIN_BLEND,
                    },
                },
                cmdline_popup = {
                    win_options = {
                        winblend = WIN_BLEND,
                    },
                },
                mini = {
                    win_options = {
                        winblend = WIN_BLEND,
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
