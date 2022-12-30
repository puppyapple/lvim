-- Palettes are the base color defines of a colorscheme.
-- You can override these palettes for each colorscheme defined by nightfox.
local palettes = {
}

-- Spec's (specifications) are a mapping of palettes to logical groups that will be
-- used by the groups. Some examples of the groups that specs map would be:
--   - syntax groups (functions, types, keywords, ...)
--   - diagnostic groups (error, warning, info, hints)
--   - git groups (add, removed, changed)
--
-- You can override these just like palettes
local specs = {
}

-- Groups are the highlight group definitions. The keys of this table are the name of the highlight
-- groups that will be overridden. The value is a table with the following values:
--   - fg, bg, style, sp, link,
--
-- Just like `spec` groups support templates. This time the template is based on a spec object.
local groups = {
  -- As with specs and palettes, the values defined under `all` will be applied to every style.
  -- all = {
  --   -- If `link` is defined it will be applied over any other values defined
  --   Whitespace = { link = "Comment" },

  --   -- Specs are used for the template. Specs have their palette's as a field that can be accessed
  --   IncSearch = { bg = "palette.cyan" },
  -- },
  -- nightfox = {
  --   -- As with specs and palettes, a specific style's value will be used over the `all`'s value.
  --   PmenuSel = { bg = "#73daca", fg = "bg0" },
  all = {
    ["@function"] = { fg = "#2c56ff" },
    parameter = { fmt = "italic" },
    field = { fg = "#10deb5" },
    variable = { fg = "#7b64ff" },
    type = { fg = "#e00f9a" },
    comment = { fg = "#278505" },
    keyword = { fmt = "italic" },
    ["@keyword.operator"] = { fmt = "italic" },
    ["@function.builtin"] = { fmt = "italic" },
    ["@repeat"] = { fmt = "italic" },
    conditional = { fmt = "italic" },
    include = { fmt = "italic" },
    ["@variable.builtin"] = { fg = "#e5c07b" },
    property = { fg = "red", fmt = "italic" },
    ["@local.definition"] = { fg = "red", fmt = "italic" }
  }, -- Override highlight groups

  -- },
}

require("nightfox").setup({ palettes = palettes, specs = specs, groups = groups })

require('onedark').setup {
  -- Main options --
  style = 'deep', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  transparent = false, -- Show/hide background
  term_colors = true, -- Change terminal color as per the selected theme style
  ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
  cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

  -- toggle theme style ---
  toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
  toggle_style_list = {
    'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
  }, -- List of styles to toggle between

  -- Change code style ---
  -- Options are italic, bold, underline, none
  -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
  code_style = {
    -- comments = 'italic',
    keywords = 'none',
    functions = 'none',
    strings = 'none',
    variables = 'none'
  },
  -- Lualine options --

  lualine = {
    transparent = false -- lualine center bar transparency
  },

  -- Custom Highlights --
  -- MiniCursorword = { fmt = "underline" }, MiniCursorwordCurrent = { fmt = "underline" },
  colors = {}, -- Override default colors
  highlights = {
    ["@function"] = { fg = "#2c56ff" },
    ["@parameter"] = { fmt = "italic" },
    ["@field"] = { fg = "#10deb5" },
    ["@variable"] = { fg = "#7b64ff" },
    ["@type"] = { fg = "#e00f9a" },
    ["@comment"] = { fg = "#278505" },
    ["@keyword"] = { fmt = "italic" },
    ["@keyword.operator"] = { fmt = "italic" },
    ["@function.builtin"] = { fmt = "italic" },
    ["@repeat"] = { fmt = "italic" },
    ["@conditional"] = { fmt = "italic" },
    ["@include"] = { fmt = "italic" },
    ["@variable.builtin"] = { fg = "#e5c07b" },
    ["@property"] = { fg = "red", fmt = "italic" },
    ["@local.definition"] = { fg = "red", fmt = "italic" },
    NvimTreeVertSplit = { fg = '$bg3', bg = '$bg0' },
  }, -- Override highlight groups

  -- Plugins Config --
  darker = true, -- darker colors for diagnostic
  diagnostics = {
    undercurl = true, -- use undercurl instead of underline for diagnostics
    background = true -- use background color for virtual text
  }
}
-- setup must be called before loading
vim.api.nvim_command "colorscheme carbonfox"