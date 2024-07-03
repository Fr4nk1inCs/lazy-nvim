return {
    "barreiroleo/ltex_extra.nvim",
    ft = { "markdown", "tex" },
    dependencies = { "neovim/nvim-lspconfig" },
    -- yes, you can use the opts field, just I'm showing the setup explicitly
    opts = {
        load_langs = { "en-US", "zh-CN" },
        path = vim.fn.stdpath("data") .. "/ltex",
        server_opts = {},
    },
}
