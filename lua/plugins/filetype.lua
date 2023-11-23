if vim.g.vscode then
    return {}
end

return {
    {
        "nathom/filetype.nvim",
        enabled = false,
        opts = {
            overrides = {
                extensions = {
                    cls = "cls",
                    typ = "typst",
                    sql = "sql",
                    tex = "tex",
                },
            },
        },
    },
}
