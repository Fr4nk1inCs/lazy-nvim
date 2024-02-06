local highlight = {
    "TSRainbowRed",
    "TSRainbowYellow",
    "TSRainbowBlue",
    "TSRainbowOrange",
    "TSRainbowGreen",
    "TSRainbowViolet",
    "TSRainbowCyan",
}

return {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    opts = {
        scope = {
            enabled = true,
            highlight = highlight,
        },
    },
    config = function(_, opts)
        local hooks = require("ibl.hooks")
        local function get_hl(name)
            local specs = vim.api.nvim_get_hl(0, { name = name })
            local hl = {}
            for k, v in pairs(specs) do
                hl[k] = string.format("#%06x", v)
            end
            return hl
        end

        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            for _, hl in ipairs(highlight) do
                vim.api.nvim_set_hl(0, hl, get_hl(hl))
            end
        end)

        require("ibl").setup(opts)
        hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
}
