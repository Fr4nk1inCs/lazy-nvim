if vim.g.vscode then
    return {}
end

return {
    {
        "zbirenbaum/copilot.lua",
        opts = {
            filetypes = {
                yaml = true,
                markdown = true,
                help = false,
                gitcommit = false,
                gitrebase = false,
                hgcommit = false,
                svn = false,
                cvs = false,
                ["dap-repl"] = false,
                ["dapui_watches"] = false,
                ["dapui_stacks"] = false,
                ["dapui_breakpoints"] = false,
                ["dapui_scopes"] = false,
                ["."] = false,
            },
        },
    },
}
