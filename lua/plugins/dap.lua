return {
    {
        "mfussenegger/nvim-dap",
        config = function(_, _) end,
        keys = {
            {
                "<space>dp",
                "<cmd>DapToggleBreakpoint<CR>",
                desc = "Toggle breakpoint",
            },
            {
                "<space>dc",
                function()
                    return require("dap").set_breakpoint(vim.fn.input({ "Breakpoint condition: " }))
                end,
                desc = "Toggle conditional breakpoint",
            },
            {
                "<F10>",
                "<cmd>DapStepOver<CR>",
                mode = { "n", "v", "i" },
                desc = "Step over",
            },
            {
                "<F11>",
                "<cmd>DapStepInto<CR>",
                mode = { "n", "v", "i" },
                desc = "Step into",
            },
            {
                "<F12>",
                "<cmd>DapStepOut<CR>",
                mode = { "n", "v", "i" },
                desc = "Step out",
            },
        },
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        keys = {
            {
                "<F5>",
                function()
                    require("dapui").toggle()
                    return require("dap").continue()
                end,
                mode = { "n", "v", "i" },
                desc = "Start debugging",
            },
            {
                "<F6>",
                function()
                    require("dapui").close()
                    require("dap").repl.close()
                    return require("dap").terminate()
                end,
            },
        },
        opts = {
            mappings = {
                -- Use a table to apply multiple mappings
                expand = { "<CR>", "<2-LeftMouse>" },
                open = "<C-o>",
                remove = "<C-d>",
                edit = "<C-e>",
                repl = "<C-r>",
                toggle = "<C-t>",
            },
        },
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {},
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        config = function()
            require("mason-nvim-dap").setup({
                automatic_installation = true,
                automatic_setup = true,
                handlers = nil,
            })
            require("mason-nvim-dap").setup({
                handlers = {
                    function(config)
                        -- all sources with no handler get passed here

                        -- Keep original functionality
                        require("mason-nvim-dap").default_setup(config)
                    end,
                    python = function(config)
                        config.adapters = {
                            type = "executable",
                            command = "/usr/bin/python3",
                            args = {
                                "-m",
                                "debugpy.adapter",
                            },
                        }
                        require("mason-nvim-dap").default_setup(config) -- don't forget this!
                    end,
                },
            })
        end,
    },
}
