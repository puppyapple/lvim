-- lvim.autocommands = {
--     {
--         {"BufEnter"}, {
--             pattern = "*",
--             desc = "Disable syntax highlighting in files larger than 1MB",
--             callback = function(args)
--                 local highlighter = require "vim.treesitter.highlighter"
--                 local ts_was_active = highlighter.active[args.buf]
--                 local file_size = vim.fn.getfsize(args.file)
--                 if (file_size > 1024 * 1024) then
--                     vim.cmd("TSBufDisable highlight")
--                     vim.cmd("syntax off")
--                     vim.cmd("syntax clear")
--                     vim.cmd("IlluminatePauseBuf")
--                     vim.cmd("IndentBlanklineDisable")
--                     vim.cmd("NoMatchParen")
--                     if (ts_was_active) then
--                         vim.notify(
--                             "File larger than 1MB, turned off syntax highlighting")
--                     end
--                 end
--             end
--         }
--     }
-- }
-- vim.cmd [[
-- " disable syntax highlighting in big files
-- function! DisableSyntaxTreesitter()
--     echo("Big file, disabling syntax, treesitter and folding")
--     if exists(':TSBufDisable')
--         exec 'TSBufDisable autotag'
--         exec 'TSBufDisable highlight'
--     endif
--     set foldmethod=manual
--     syntax clear
--     syntax off
--     filetype off
--     set noundofile
--     set noswapfile
--     set noloadplugins
--     set lazyredraw
-- endfunction
-- augroup BigFileDisable
--     autocmd!
--     autocmd BufReadPre,FileReadPre * if getfsize(expand("%")) > 1024 * 1024 | exec DisableSyntaxTreesitter() | endif
-- augroup END
--   ]]
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedark"
lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.terminal.direction = "horizontal"
lvim.builtin.terminal.size = 15
lvim.builtin.bufferline.options.separator_style = "slant"
lvim.builtin.bufferline.options.always_show_bufferline = true
lvim.lsp.diagnostics.virtual_text = true
lvim.builtin.cmp.cmdline.enable = true
lvim.builtin.cmp.experimental.ghost_text = true
lvim.builtin.breadcrumbs.active = false
lvim.lsp.diagnostics.update_in_insert = true
lvim.lsp.installer.setup.automatic_installation = true
-- table.insert(lvim.builtin.cmp.sources, {name = "pandoc_references"})
-- table.insert(lvim.builtin.cmp.sources, {name = "nvim_lsp_signature_help"})
local cmp = require("cmp")
lvim.builtin.cmp.sorting = {
    comparators = {
        cmp.config.compare.offset, cmp.config.compare.exact,
        cmp.config.compare.score, require"cmp-under-comparator".under,
        cmp.config.compare.recently_used, cmp.config.compare.locality,
        cmp.config.compare.kind, cmp.config.compare.sort_text,
        cmp.config.compare.length, cmp.config.compare.order
    }
}
vim.highlight.on_yank {timeout = 2000}
vim.opt.cursorcolumn = true
vim.opt.relativenumber = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
vim.opt.smartindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true

lvim.builtin.nvimtree.active = true
lvim.builtin.nvimtree.setup.git.enable = true
lvim.builtin.nvimtree.setup.renderer.highlight_git = true
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.renderer.icons.git_placement = "before"
lvim.builtin.nvimtree.setup.renderer.icons.glyphs.git = {
    unstaged = "✗",
    staged = "✓",
    unmerged = "",
    renamed = "➜",
    untracked = "★",
    deleted = "",
    ignored = "◌"
}
lvim.builtin.nvimtree.setup.renderer.indent_markers.enable = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
    "bash", "c", "javascript", "json", "lua", "python", "typescript", "tsx",
    "css", "rust", "java", "yaml"
}

lvim.builtin.treesitter.ignore_install = {"haskell"}
lvim.lsp.on_attach_callback = function(client, bufnr)
    require"lsp_signature".on_attach()
end
-- lvim.builtin.treesitter.highlight.enable = true
local options = {scrolloff = 0, sidescrolloff = 8, updatetime = 100}
for k, v in pairs(options) do vim.opt[k] = v end

-- vim.g.clipboard = {
--     name = "my",
--     copy = {
--         ['+'] = 'kitty +kitten clipboard',
--         ['*'] = 'kitty +kitten clipboard'
--     },
--     paste = {
--         ['+'] = 'kitty +kitten clipboard --get-clipboard',
--         ['*'] = 'kitty +kitten clipboard --get-clipboard'
--     }
-- }
-- vim.g.clipboard = {
--     name = 'myClipboard',
--     copy = {
--         ['+'] = {'tmux', 'load-buffer', '-'},
--         ['*'] = {'tmux', 'load-buffer', '-'}
--     },
--     paste = {
--         ['+'] = {'tmux', 'save-buffer', '-'},
--         ['*'] = {'tmux', 'save-buffer', '-'}
--     }
-- }
