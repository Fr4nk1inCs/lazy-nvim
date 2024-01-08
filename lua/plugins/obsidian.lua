local vaults = {
    notes = "~/obsidian/notes",
}
local default_vault = "notes"

-- configurations for obsidian.nvim plugin
local trigger_events = {}
local workspaces = {}
for name, path in pairs(vaults) do
    table.insert(workspaces, { name = name, path = path })
    table.insert(trigger_events, "BufReadPre " .. path .. "/**.md")
    table.insert(trigger_events, "BufNewFile " .. path .. "/**.md")
end

-- create user command to open vaults
vim.api.nvim_create_user_command("Obsidian", function(opts)
    local name = opts.fargs[1]
    if name == nil then
        name = default_vault
        vim.notify("Using default vault " .. name, vim.log.levels.INFO)
    end

    local path = vaults[name]
    if vaults[name] == nil then
        vim.notify("Invalid vault name " .. name, vim.log.levels.ERROR)
        return
    end
    vim.notify("Opening vault " .. name .. " at " .. path, vim.log.levels.INFO)
    vim.fn.chdir(path)
    require("telescope.builtin").find_files()
end, {
    nargs = "?",
    complete = function(_, _, _)
        return vim.tbl_keys(vaults)
    end,
})

return {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    event = trigger_events,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
        "nvim-telescope/telescope.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    opts = {
        workspaces = workspaces,
    },
}
