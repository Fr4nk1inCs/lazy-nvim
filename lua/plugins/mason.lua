if vim.g.vscode then
    return {}
end

return {
    {
        "williamboman/mason.nvim",
        opts = {
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
