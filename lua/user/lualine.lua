lvim.builtin.lualine.sections.lualine_z = { 'os.date("%I:%M", os.time())' }
local components = require "lvim.core.lualine.components"
lvim.builtin.lualine.sections.lualine_c = { components.diff, components.python_env, components.filename }
-- lvim.builtin.lualine.options.section_separators = { left = '', right = '' }
-- lvim.builtin.lualine.options.component_separators = { left = '', right = '' }
-- separators = {
--   rounded = { '', '' },
--   blank = { '', '' },
-- }