-- lvim.builtin.which_key.mappings["dm"] = { "<cmd>lua require('dap-python').test_method()<cr>", "Test Method" }
-- lvim.builtin.which_key.mappings["df"] = { "<cmd>lua require('dap-python').test_class()<cr>", "Test Class" }
-- lvim.builtin.which_key.vmappings["d"] = {
--   name = "Debug",
--   s = { "<cmd>lua require('dap-python').debug_selection()<cr>", "Debug Selection" }, }
-- pcall(function()
--   -- require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
--   require("dap-python").setup("python")
-- end)
-- pcall(function()
--   require("dap-python").test_runner = "pytest"
-- end)
-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
-- ... your lualine config
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
reload "user.plugins"
reload "user.options"
reload "user.lsp"
reload "user.pydocstring"
reload "user.scrollbar"
reload "user.dap"
reload "user.neoscroll"
reload "user.inlay-hints"
reload "user.toggleterm"
reload "user.ufo"
reload "user.themes"
reload "user.lualine"
reload "user.keymaps"
