lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedark"
lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.terminal.direction = "horizontal"
lvim.builtin.terminal.size = 15
lvim.builtin.lualine.sections.lualine_z = { 'os.date("%I:%M", os.time())' }
lvim.builtin.cmp.cmdline.enable = true
lvim.builtin.bufferline.options.separator_style = "slant"
lvim.builtin.bufferline.options.always_show_bufferline = true

vim.highlight.on_yank { timeout = 2000 }
vim.opt.relativenumber = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

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

lvim.builtin.treesitter.ignore_install = { "haskell" }
-- lvim.builtin.treesitter.highlight.enable = true
local options = { scrolloff = 0, sidescrolloff = 8, updatetime = 100 }
for k, v in pairs(options) do vim.opt[k] = v end
