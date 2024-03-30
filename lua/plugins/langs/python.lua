return {
    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            if type(opts.ensure_installed) == "table" then
                vim.list_extend(opts.ensure_installed, { "ninja", "python", "rst", "toml" })
            end
        end,
    },
    -- ruff-lsp
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                pyright = {
                    settings = {
                        python = {
                            analysis = {
                                typeCheckingMode = "basic",
                                inlayHints = {
                                    callArgumentNames = "partial",
                                    functionReturnTypes = true,
                                    pytestParameters = true,
                                    variableTypes = true,
                                },
                            },
                        },
                    },
                },
                ruff_lsp = {
                    keys = {
                        {
                            "<leader>co",
                            function()
                                vim.lsp.buf.code_action({
                                    apply = true,
                                    context = {
                                        only = { "source.organizeImports" },
                                        diagnostics = {},
                                    },
                                })
                            end,
                            desc = "Organize Imports",
                        },
                    },
                },
            },
            setup = {
                ruff_lsp = function()
                    require("lazyvim.util").lsp.on_attach(function(client, _)
                        if client.name == "ruff_lsp" then
                            -- Disable hover in favor of Pyright
                            client.server_capabilities.hoverProvider = false
                        end
                    end)
                end,
            },
        },
    },
    {
        "linux-cultist/venv-selector.nvim",
        cmd = "VenvSelect",
        opts = function(_, opts)
            if require("lazyvim.util").has("nvim-dap-python") then
                opts.dap_enabled = true
            end
            return vim.tbl_deep_extend("force", opts, {
                name = {
                    "venv",
                    ".venv",
                    "env",
                    ".env",
                },
                anaconda_envs_path = vim.fn.expand("~/miniforge3/envs/"),
            })
        end,
        keys = { { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" } },
    },
    -- neotest
    {
        "nvim-neotest/neotest",
        optional = true,
        dependencies = {
            "nvim-neotest/neotest-python",
        },
        opts = {
            adapters = {
                ["neotest-python"] = {
                    -- Here you can specify the settings for the adapter, i.e.
                    -- runner = "pytest",
                    -- python = ".venv/bin/python",
                },
            },
        },
    },
    -- debugger
    {
        "mfussenegger/nvim-dap",
        optional = true,
        dependencies = {
            "mfussenegger/nvim-dap-python",
            keys = {
                {
                    "<leader>dPt",
                    function()
                        require("dap-python").test_method()
                    end,
                    desc = "Debug Method",
                    ft = "python",
                },
                {
                    "<leader>dPc",
                    function()
                        require("dap-python").test_class()
                    end,
                    desc = "Debug Class",
                    ft = "python",
                },
            },
            config = function()
                local path = require("mason-registry").get_package("debugpy"):get_install_path()
                require("dap-python").setup(path .. "/venv/bin/python")
            end,
        },
    },
}
