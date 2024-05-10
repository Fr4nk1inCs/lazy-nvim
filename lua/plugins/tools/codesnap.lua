local save_path = "~/Pictures/Codesnap"
if vim.fn.has("wsl") == 1 then
    save_path = "/mnt/c/Users/fushen/Pictures/CodeSnap"
end

if vim.fn.isdirectory(save_path) == 0 then
    vim.fn.mkdir(save_path, "p")
end

return {
    {
        "mistricky/codesnap.nvim",
        build = "make",
        opts = {
            save_path = save_path,
            has_breadcrumbs = true,
            bg_theme = "sea",
            code_font_family = "Maple Mono SC NF",
        },
    },
}
