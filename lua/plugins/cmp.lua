return {
    {
        "nvim-cmp",
        opts = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            local select_next = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end
            local select_prev = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end

            return {
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                -- use rounded borders
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete({}),
                    ["<CR>"] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = false,
                    }),
                    ["<Tab>"] = cmp.mapping(select_next, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(select_prev, { "i", "s" }),
                }),
                sources = {
                    { name = "copilot" },
                    { name = "path" },
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                },
                formatting = {
                    format = function(_, item)
                        local icons = require("lazyvim.config").icons.kinds
                        if icons[item.kind] then
                            item.kind = icons[item.kind] .. item.kind
                        end
                        return item
                    end,
                },
            }
        end,
    },
}
