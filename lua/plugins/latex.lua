return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                texlab = {
                    settings = {
                        texlab = {
                            build = {
                                executable = "xelatex",
                                args = {
                                    "-shell-escape",
                                    "-synctex=1",
                                    "-interaction=nonstopmode",
                                    "%f",
                                },
                                onSave = true,
                                forwardSearchAfter = true,
                            },
                            forwardSearch = {
                                executable = "zathura",
                                args = {
                                    "--synctex-forward",
                                    "%l:1:%f",
                                    "%p",
                                },
                                onSave = true,
                            },
                            chktex = {
                                onOpenAndSave = true,
                                onEdit = true,
                            },
                        },
                    },
                },
            },
        },
    },
}
