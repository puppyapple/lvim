-- require("lvim.lsp.manager").setup("pyright")
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    {command = "black", filetypes = {"json"}}, {
        command = "prettier",
        args = {"--print-width", "100"},
        filetypes = {"typescript", "typescriptreact", "json"}
    }
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
    {command = "ruff"},
    {command = "shellcheck", args = {"--severity", "warning"}},
    {command = "codespell", filetypes = {"javascript", "python", "json"}}
}

local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {{command = "proselint"}}
