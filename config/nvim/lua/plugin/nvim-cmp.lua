-- https://github.com/hrsh7th/nvim-cmp
-- Autocomplete
------------------------------------------------------------------------------

-- Set up nvim-cmp.
local cmp = require('cmp')

cmp.setup({
    mapping = {
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(
            { behavior = cmp.SelectBehavior.Insert }), { 'i' }),
        ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(
            { behavior = cmp.SelectBehavior.Insert }), { 'i' }),
        ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item(
            { behavior = cmp.SelectBehavior.Insert }), { 'i' }),
        ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item(
            { behavior = cmp.SelectBehavior.Insert }), { 'i' }),
        ['<C-h>'] = cmp.mapping.abort(),
        ['<C-l>'] = cmp.mapping.complete(),
        ['<C-j>'] = cmp.mapping.scroll_docs(1),
        ['<C-k>'] = cmp.mapping.scroll_docs(-1),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },

    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },

    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
        completion = cmp.config.window.bordered({
            winhighlight = "Normal:Normal,FloatBorder:BorderBG,CursorLine:PmenuSel,Search:Search",
        }),
        documentation = cmp.config.window.bordered({
            winhighlight = "Normal:Normal,FloatBorder:BorderBG,CursorLine:PmenuSel,Search:Search",
        }),
    },

    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'luasnip' }, -- For luasnip users.
        { name = "neorg" },
    }, {
        { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
