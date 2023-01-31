local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    {command = "black"}, -- filetypes = { "python", "json"} },
    -- { command = "isort", filetypes = { "python" } },
    {
        -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
        command = "prettier",
        ---@usage arguments to pass to the formatter
        -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
        extra_args = {"--line-withd", "100"},
        ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
        filetypes = {"typescript", "typescriptreact"}
    }, {command = "lua-format", filetypes = {"lua"}},
    {command = "markdownlint", filetypes = {"markdown", "tex"}}
}

-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
    {command = "flake8", filetypes = {"python"}}, {
        -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
        command = "shellcheck",
        ---@usage arguments to pass to the formatter
        -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
        extra_args = {"--severity", "warning"}
    }, {
        command = "codespell"
        ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
        -- filetypes = { "javascript", "python" },
    }
}
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, {"marksman"})
require("lvim.lsp.manager").setup("marksman")
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
