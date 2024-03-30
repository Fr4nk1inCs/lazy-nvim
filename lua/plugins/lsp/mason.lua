local is_in_nixos = vim.fn.executable("nix") == 1

local opts = {}
if is_in_nixos then
    opts.PATH = "skip"
else
    opts.PATH = "prepend"
end

return {
    {
        "williamboman/mason.nvim",
        event = "VeryLazy",
        opts = {
            PATH = opts.PATH,
            ensure_installed = {
                "stylua",
                "shellcheck",
                "shfmt",
            },
            ui = {
                border = "rounded",
            },
        },
    },
}
