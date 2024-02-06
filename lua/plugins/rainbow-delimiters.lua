return {
    {
        "HiPhish/rainbow-delimiters.nvim",
        event = "VeryLazy",
        config = function()
            vim.g.rainbow_delimiters = {
                query = {
                    [""] = "rainbow-delimiters",
                    lua = "rainbow-blocks",
                    latex = "rainbow-blocks",
                    verilog = "rainbow-blocks",
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
