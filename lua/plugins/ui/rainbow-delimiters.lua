return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            if type(opts.ensure_installed) == "table" then
                vim.list_extend(opts.ensure_installed, { "lua", "latex", "verilog" })
            end
        end,
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
        event = "VeryLazy",
        config = function()
            vim.g.rainbow_delimiters = {
                query = {
                    [""] = "rainbow-delimiters",
                    lua = "rainbow-blocks",
                    query = "rainbow-blocks",
                },
                highlight = {
                    "TSRainbowRed",
                    "TSRainbowYellow",
                    "TSRainbowBlue",
                    "TSRainbowOrange",
                    "TSRainbowGreen",
                    "TSRainbowViolet",
                    "TSRainbowCyan",
                },
            }
        end,
    },
}
