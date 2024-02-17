return {
    {
        "nvim-cmp",
        dependencies = {
            "L3MON4D3/LuaSnip",
            "zbirenbaum/copilot.lua",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            "zbirenbaum/copilot-cmp",
        },
        event = "VeryLazy",
        config = function()
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

            cmp.setup({
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
                    ["<C-k>"] = cmp.mapping({
                        i = function()
                            if cmp.visible() then
                                cmp.abort()
                            else
                                cmp.complete()
                            end
                        end,
                        c = function()
                            if cmp.visible() then
                                cmp.close()
                            else
                                cmp.complete()
                            end
                        end,
                    }),
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
                ---@diagnostic disable-next-line: missing-fields
                formatting = {
                    format = function(_, item)
                        local icons = require("lazyvim.config").icons.kinds
                        if icons[item.kind] then
                            item.kind = icons[item.kind] .. item.kind
                        end
                        return item
                    end,
                },
            })
            -- `/` cmdline setup.
            cmp.setup.cmdline("/", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                },
            })
            -- `:` cmdline setup.
            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                }, {
                    {
                        name = "cmdline",
                        option = {
                            ignore_cmds = { "Man", "!" },
                        },
                    },
                }),
            })
        end,
    },
}
