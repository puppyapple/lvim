lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.insert_mode["jj"] = "<Esc>"
lvim.keys.normal_mode["H"] = "^"
lvim.keys.normal_mode["L"] = "$"
lvim.keys.visual_mode["H"] = "^"
lvim.keys.visual_mode["L"] = "$"
lvim.keys.normal_mode["<tab>"] = ":bnext<CR>"
vim.keymap.set("o", "H", "^")
vim.keymap.set("o", "L", "$")


-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}

lvim.builtin.which_key.mappings["ba"] = { "<cmd>Telescope buffers<cr>", "Buffers" }

lvim.builtin.which_key.mappings["gf"] = {
  name = "+Conflict",
  n = { "<cmd>GitConflictNextConflict<cr>", "Next Conflict" },
  p = { "<cmd>GitConflictPrevConflict<cr>", "Previous Conflict" },
  i = { "<cmd>GitConflictChooseTheirs<cr>", "Use incoming changes" },
  o = { "<cmd>GitConflictChooseTheirs<cr>", "Use current changes" },
}


-- Lua
lvim.lsp.buffer_mappings.normal_mode['gr'] = { "<cmd>TroubleToggle lsp_references<cr>", "Go to references(Trouble)" }
lvim.lsp.buffer_mappings.normal_mode['gw'] = { "<cmd>TroubleToggle workspace_diagnostics<cr>",
  "Workspace diagnostics(Trouble)" }
lvim.lsp.buffer_mappings.normal_mode['gf'] = { "<cmd>TroubleToggle document_diagnostics<cr>",
  "Document diagnostics(Trouble)" }
lvim.lsp.buffer_mappings.normal_mode['gd'] = { "<cmd>TroubleToggle lsp_definitions<cr>", "Go to definitions(Trouble)" }
lvim.lsp.buffer_mappings.normal_mode['gt'] = { "<cmd>TroubleToggle lsp_type_definitions<cr>",
  "Go to type definitions(Trouble)" }
lvim.lsp.buffer_mappings.normal_mode['gj'] = { vim.diagnostic.goto_next, "Next Diagnostic" }
lvim.lsp.buffer_mappings.normal_mode['gk'] = { vim.diagnostic.goto_prev, "Prev Diagnostic" }
