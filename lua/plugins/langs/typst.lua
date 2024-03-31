local is_in_nixos = vim.fn.executable("nix") == 1

local dependencies_bin = {}
if is_in_nixos then
    dependencies_bin = {
        ["typst-preview"] = "typst-preview",
        ["websocat"] = "websocat",
    }
end

return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                tinymist = {
                    root_dir = require("lspconfig.util").root_pattern("*.typ"),
                    single_file_support = true,
                },
            },
        },
    },
    {
        "kaarmu/typst.vim",
        ft = "typst",
        lazy = true,
    },
    {
        "chomosuke/typst-preview.nvim",
        ft = "typst",
        version = "0.1.*",
        build = function()
            require("typst-preview").update()
        end,
        opts = {
            dependencies_bin = dependencies_bin,
            get_root = function(_)
                return vim.fn.fnamemodify(vim.fn.expand("%:p"), ":h")
            end,
        },
    },
}
