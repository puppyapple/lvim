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
lvim.builtin.which_key.mappings["T"] = {
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
