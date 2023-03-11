return {
    {
        "mfussenegger/nvim-dap",
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
                automatic_setup = true,
            })
            require("mason-nvim-dap").setup_handlers({})
        end,
    },
}
