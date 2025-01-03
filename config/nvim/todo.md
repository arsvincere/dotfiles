# nvim configure

# плагины
    "workspace.library": [
        "/home/alex/.local/share/nvim/lazy/neodev.nvim/types/stable",
        "/usr/share/nvim/runtime/lua",
        "/home/alex/.local/share/nvim/lazy/nui.nvim/lua",
        "/home/alex/.local/share/nvim/lazy/nvim-dap-ui/lua",
        "/home/alex/.local/share/nvim/lazy/cmp-buffer/lua",
        "/home/alex/.local/share/nvim/lazy/nvim-notify/lua",
        "/home/alex/.local/share/nvim/lazy/trouble.nvim/lua",
        "/home/alex/.local/share/nvim/lazy/cmp-path/lua",
        "/home/alex/.local/share/nvim/lazy/nvim-lint/lua",
        "/home/alex/.local/share/nvim/lazy/cmp-cmdline/lua",
        "/home/alex/.local/share/nvim/lazy/nordic.nvim/lua",
        "/home/alex/.local/share/nvim/lazy/nvim-treesitter-textobjects/lua",
        "/home/alex/.local/share/nvim/lazy/tokyonight.nvim/lua",
        "/home/alex/.local/share/nvim/lazy/dashboard-nvim/lua",
        "/home/alex/.local/share/nvim/lazy/playground/lua",
        "/home/alex/.local/share/nvim/lazy/nvim-web-devicons/lua",
        "/home/alex/.local/share/nvim/lazy/lsp_signature.nvim/lua",
        "/home/alex/.local/share/nvim/lazy/leap.nvim/lua",
        "/home/alex/.local/share/nvim/lazy/gitsigns.nvim/lua",
        "/home/alex/.local/share/nvim/lazy/vim-illuminate/lua",
        "/home/alex/.local/share/nvim/lazy/nvim-colorizer.lua/lua",
        "/home/alex/.local/share/nvim/lazy/tmux.nvim/lua",
        "/home/alex/.local/share/nvim/lazy/neodev.nvim/lua",
        "/home/alex/.local/share/nvim/lazy/diffview.nvim/lua",
        "/home/alex/.local/share/nvim/lazy/telescope.nvim/lua",
        "/home/alex/.local/share/nvim/lazy/lazy.nvim/lua",
        "/home/alex/.local/share/nvim/lazy/nvim-treesitter/lua",
        "/home/alex/.local/share/nvim/lazy/mason.nvim/lua",
        "/home/alex/.local/share/nvim/lazy/which-key.nvim/lua",
        "/home/alex/.local/share/nvim/lazy/plenary.nvim/lua",
        "/home/alex/.local/share/nvim/lazy/lualine.nvim/lua",
        "/home/alex/.local/share/nvim/lazy/cheatsheet.nvim/lua",
        "/home/alex/.local/share/nvim/lazy/lspsaga.nvim/lua",
        "/home/alex/.local/share/nvim/lazy/LuaSnip/lua",
        "/home/alex/.local/share/nvim/lazy/popup.nvim/lua",
        "/home/alex/.local/share/nvim/lazy/nvim-cokeline/lua",
        "/home/alex/.local/share/nvim/lazy/cmp_luasnip/lua",
        "/home/alex/.local/share/nvim/lazy/nvim-cmp/lua",
        "/home/alex/.local/share/nvim/lazy/nvim-tree.lua/lua",
        "/home/alex/.local/share/nvim/lazy/nvim-lspconfig/lua",
        "/home/alex/.local/share/nvim/lazy/noice.nvim/lua",
        "/home/alex/.local/share/nvim/lazy/cmp-omni/lua",
        "/home/alex/.local/share/nvim/lazy/indent-blankline.nvim/lua",
        "/home/alex/.local/share/nvim/lazy/nvim-dap/lua",
        "/home/alex/.local/share/nvim/lazy/cmp-nvim-lsp/lua",
        "/home/alex/.config/nvim/lua",
        "${3rd}/luv/library"
    ]

# создание команды, может проекты на команды повесить? Може еще где понадобится
vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })




------------------------------------------------------------------------------

- [x] цветовые схемы посмотри, как они работают как их настраивать...
- [x] F5 - запуск скрипта питоновского в соседнем буфере.
- [x] автосохранение файла при потере фокуса
- [x] что то сделать с фолдингом, либо автокмд либо expression писать
- [x] глобальный буфер обмена чтобы работал
- [x] посмотреть интеграцию с git (GitHub Desctop лучше чем париться)
- [х] навигация по классам и функциям
- [х] цветовые схема потемнее
- [x] git разобраться
- [x] автодополнение
- [x] вызов документации по функциям python
- [x] подумать куда забиндить переключение вкладок... и лист всех буферов
- [x] telescope - разобраться
- [x] навигация по буферам, и окнами управлять, что делает :x
- [x] отключить jj
- [x] строка статуса улучшенная
- [x] русский ввод с клавиатуры
- [x] Ctrl-A - выделить все
- [x] Ctrl-С - в визуальном режиме - скопировать текст
- [x] разобраться почему макросы не работают
- [x] перейти на Plug
- [x] распихать по папкам настройки плагинов
- [x] запуск текущего файла в консоли справа - отладить
- [x] засовывание в скобки, https://habr.com/ru/articles/585222/, surround.vim
