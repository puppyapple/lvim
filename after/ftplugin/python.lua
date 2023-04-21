local opts = {
  root_dir = function(fname)
    local util = require "lspconfig.util"
    local root_files = {
      "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt",
      "Pipfile", "manage.py", "pyrightconfig.json"
    }
    return util.root_pattern(unpack(root_files))(fname) or
        util.root_pattern ".git" (fname) or util.path.dirname(fname)
  end,
  settings = {
    pyright = {
      disableLanguageServices = false,
      disableOrganizeImports = false
    },
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true
      }
    }
  },
  single_file_support = true
}

require('lspconfig')["pyright"].setup({ opts })
-- require("lvim.lsp.manager").setup("pyright", opts)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { { command = "black", filetypes = { "python" } } }

local linters = require "lvim.lsp.null-ls.linters"
linters.setup { { command = "ruff", filetypes = { "python" } },
  { command = "codespell", filetypes = { "javascript", "python" } } }

local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup { { command = "proselint" } }
