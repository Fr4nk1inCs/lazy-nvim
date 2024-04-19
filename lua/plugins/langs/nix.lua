local is_in_nixos = vim.fn.executable("nix") == 1

if not is_in_nixos then
    return {}
end

return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            if type(opts.ensure_installed) == "table" then
                vim.list_extend(opts.ensure_installed, { "nix" })
            end
        end,
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                nil_ls = {},
            },
        },
    },
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                nix = { "alejandra" },
            },
        },
    },
}
