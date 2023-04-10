local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    {command = "black", filetypes = {"python"}}, {
        command = "prettier",
        extra_args = {"--line-withd", "100"},
        filetypes = {"typescript", "typescriptreact"}
    }, {command = "lua-format", filetypes = {"lua"}},
    {command = "markdownlint", filetypes = {"markdown", "tex"}}
}

-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
    {command = "ruff", filetypes = {"python"}},
    {command = "shellcheck", extra_args = {"--severity", "warning"}},
    {command = "codespell", filetypes = {"javascript", "python"}}
}
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, {"marksman"})
require("lvim.lsp.manager").setup("marksman")
require("lvim.lsp.manager").setup("sumneko_lua")
require('lspconfig').pyright.setup {
    on_attach = require'virtualtypes'.on_attach(),
    settings = {
        pyright = {autoImportCompletion = true},
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = 'openFilesOnly',
                useLibraryCodeForTypes = true,
                typeCheckingMode = 'off'
            }
        }
    }
}
