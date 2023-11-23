if vim.g.vscode then
    return {}
end

return {
    {
        "windwp/nvim-autopairs",
        opts = {
            disable_filetype = { "tex" },
        },
    },
}
