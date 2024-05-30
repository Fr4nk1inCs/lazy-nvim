-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.colorcolumn = { "80", "120" }
vim.opt.whichwrap = "<,>,h,l,[,]"

vim.opt.fileencodings = { "ucs-bom", "utf-8", "GB18030", "gbk" }

vim.opt.laststatus = 3
vim.opt.pumblend = 0

vim.diagnostic.config({
    float = { border = "rounded" },
})

vim.api.nvim_set_hl(0, "TreesitterContextBottom", { underline = true })
