-- https://github.com/hrsh7th/nvim-cmp
-- Autocomplete
------------------------------------------------------------------------------

  -- Set up nvim-cmp.
local cmp = require('cmp')

cmp.setup({
    mapping = {
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(
            { behavior = cmp.SelectBehavior.Insert }), {'i'}),
        ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item(
            { behavior = cmp.SelectBehavior.Insert }), {'i'}),
        ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(
            { behavior = cmp.SelectBehavior.Insert }), {'i'}),
        ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item(
            { behavior = cmp.SelectBehavior.Insert }), {'i'}),
        ['<C-k>'] = cmp.mapping.scroll_docs(-1),
        ['<C-j>'] = cmp.mapping.scroll_docs(1),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-f>'] = cmp.mapping.complete(),
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
          winhighlight = "Normal:Normal,FloatBorder:BorderBG,CursorLine:PmenuSel,Search:None",
        }),
        documentation = cmp.config.window.bordered({
          winhighlight = "Normal:Normal,FloatBorder:BorderBG,CursorLine:PmenuSel,Search:None",
        }),
    },

    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
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
