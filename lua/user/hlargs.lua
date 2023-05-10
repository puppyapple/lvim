local hlargs = require("hlargs")
hlargs.setup {
  color = '#D49DA5',
  -- use_colorpalette = true,
  paint_arg_declarations = false,
  extras = { named_parameters = false },
  excluded_argnames = { usages = { python = { 'self', 'cls' } } }
}
