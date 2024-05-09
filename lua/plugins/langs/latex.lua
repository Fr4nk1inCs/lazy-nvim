local forwardSearch = {}
local forwardSearchAfter = true
if vim.fn.has("win32") == 1 then -- Windows
    forwardSearch = {
        executable = "~\\AppData\\Local\\SumatraPDF\\SumatraPDF.exe",
        args = {
            "-reuse-instance",
            "%p",
            "-forward-search",
            "%f",
            "%l",
        },
    }
    -- Avoid focus being taken out to the viewer in Windows
    forwardSearchAfter = false
elseif vim.fn.has("mac") == 1 then -- MacOS
    forwardSearch = {
        executable = "open",
        args = {
            "-a",
            "/Applications/Skim.app",
            "-r",
            "%l",
            "%p",
            "%f",
        },
    }
elseif vim.fn.has("wsl") == 1 then
    forwardSearch = {
        executable = "/mnt/c/Users/fushen/AppData/Local/SumatraPDF/SumatraPDF.exe",
        args = {
            "-reuse-instance",
            "%p",
            "-forward-search",
            "%f",
            "%l",
        },
    }
    -- Avoid focus being taken out to the viewer in Windows
    forwardSearchAfter = false
else
    forwardSearch = {
        executable = "zathura",
        args = {
            "--synctex-forward",
            "%l:1:%f",
            "%p",
        },
    }
end

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
                                forwardSearchAfter = forwardSearchAfter,
                            },
                            forwardSearch = forwardSearch,
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
