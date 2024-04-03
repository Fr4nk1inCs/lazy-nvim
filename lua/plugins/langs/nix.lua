local is_in_nixos = vim.fn.executable("nix") == 1

if not is_in_nixos then
    return {}
end

return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                nil_ls = {},
            },
        },
    },
}
