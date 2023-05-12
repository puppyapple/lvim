-- Additional Plugins
lvim.plugins = {
  -- {
  --   "Pocco81/auto-save.nvim",
  --   config = function()
  --     require("auto-save").setup {
  --       enabled = false,
  --       debounce_delay = 1000
  --     }
  --   end,
  -- },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    config = function()
      require('telescope').load_extension('fzf')
    end
  },
  {
    'Exafunction/codeium.vim',
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set('i', '<c-i>', function() return vim.fn['codeium#Accept']() end, { expr = true })
      vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
      vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
      vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
      vim.g.codeium_filetypes = { markdown = false }
    end
  },
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup({
        mapping = { "jk", "jj" },  -- a table with mappings to use
        timeout = 800,             -- the time in which the keys must be hit in ms. Use option timeoutlen by default
        clear_empty_lines = false, -- clear line after escaping if there is only whitespace
        keys = "<Esc>"
      })
    end,
  },
  { "ojroques/vim-oscyank",  branch = "main" },
  { "ellisonleao/glow.nvim", config = true,  cmd = "Glow" }, {
  'HallerPatrick/py_lsp.nvim',
  config = function()
    require("py_lsp").setup({
      -- host_python = "/home/puppyapple/anaconda3/bin",
      source_strategies = { "conda" }
    })
  end
}, { 'folke/tokyonight.nvim' }, { "nvim-neotest/neotest-python" },
  { "nvim-neotest/neotest" }, {
  "giusgad/pets.nvim",
  dependencies = { "MunifTanjim/nui.nvim", "edluffy/hologram.nvim" },
  config = function() require("pets").setup() end
}, {
  "ray-x/lsp_signature.nvim",
  config = function()
    require "lsp_signature".setup({
      hint_enable = true,
      floating_window = false,
      toggle_key = "<C-x>"
    })
  end
}, { "itchyny/vim-cursorword" }, { "lukas-reineke/cmp-under-comparator" }, {
  "glepnir/lspsaga.nvim",
  -- branch = "main",
  event = "BufRead",
  config = function()
    local saga = require("lspsaga")
    saga.setup({
      symbol_in_winbar = { enable = true, color_mode = true },
      code_action_lightbulb = { enable = true },
      ui = { border = "double" }
      -- finder = {max_height = 0.6, force_max_height = true}
    })
  end
}, { "segeljakt/vim-silicon" }, {
  "iamcco/markdown-preview.nvim",
  lazy = true,
  ft = "markdown",
  build = function() vim.fn["mkdp#util#install"]() end,
  config = function() vim.g.mkdp_auto_start = 1 end
}, {
  "kevinhwang91/nvim-hlslens",
  config = function()
    require("hlslens").setup({
      build_position_cb = function(plist, _, _, _)
        require("scrollbar.handlers.search").handler.show(
          plist.start_pos)
      end
    })

    vim.cmd([[
        augroup scrollbar_search_hide
            autocmd!
            autocmd CmdlineLeave : lua require('scrollbar.handlers.search').handler.hide()
        augroup END
    ]])
  end
}, { 'kevinhwang91/nvim-ufo',    dependencies = 'kevinhwang91/promise-async' },
  { "lvimuser/lsp-inlayhints.nvim" }, { "petertriho/nvim-scrollbar" },
  { "TimUntersberger/neogit" }, {
  "akinsho/git-conflict.nvim",
  version = "*",
  config = function() require('git-conflict').setup() end
}, {
  "m-demare/hlargs.nvim",
}, { "folke/trouble.nvim",       cmd = "TroubleToggle" },
  { "mfussenegger/nvim-dap-python" }, {
  "ellisonleao/glow.nvim",
  config = function()
    require("glow").setup { install_path = "/usr/bin" }
  end
}, {
  "karb94/neoscroll.nvim",
  event = "WinScrolled",
  config = function()
    require('neoscroll').setup({
      -- All these keys will be mapped to their corresponding default scrolling animation
      mappings = {
        '<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt',
        'zz', 'zb'
      },
      hide_cursor = true,          -- Hide cursor while scrolling
      stop_eof = true,             -- Stop at <EOF> when scrolling downwards
      use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
      respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
      cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
      easing_function = nil,       -- Default easing function
      pre_hook = nil,              -- Function to run before the scrolling animation starts
      post_hook = nil              -- Function to run after the scrolling animation ends
    })
  end
}, { "metakirby5/codi.vim",         cmd = "Codi" }, {
  "simrat39/symbols-outline.nvim",
  config = function() require('symbols-outline').setup() end
}, {
  "ggandor/leap.nvim",
  config = function() require("leap").add_default_mappings() end
}, {
  "dccsillag/magma-nvim",
  commit = "0ab5ef297bf98d69f03bb069533444c14cd53383",
  build = ":UpdateRemotePlugins"
}, { "jc-doyle/cmp-pandoc-references", dependencies = "hrsh7th/nvim-cmp" }, {
  "tzachar/cmp-tabnine",
  build = "./install.sh",
  dependencies = "hrsh7th/nvim-cmp",
  config = function()
    local tabnine = require "cmp_tabnine.config"
    tabnine:setup {
      max_lines = 1000,
      max_num_results = 5,
      ignored_file_types = { markdown = true },
      sort = true,
      run_on_every_keystroke = true
    }
  end
  -- opt = true,
  -- event = "InsertEnter"
}, {
  "kevinhwang91/rnvimr",
  cmd = "RnvimrToggle",
  config = function()
    vim.g.rnvimr_draw_border = 1
    vim.g.rnvimr_pick_enable = 1
    vim.g.rnvimr_bw_enable = 1
  end
}, { "sindrets/diffview.nvim",  event = "BufRead" }, {
  "andymass/vim-matchup",
  event = "CursorMoved",
  config = function()
    vim.g.matchup_matchparen_offscreen = { method = "popup" }
  end
}, {
  "folke/todo-comments.nvim",
  event = "BufRead",
  config = function() require("todo-comments").setup() end
}, { "nvim-treesitter/playground", event = "BufRead" }, -- {
  { "navarasu/onedark.nvim",      name = "onedark" }, { "EdenEast/nightfox.nvim" }
  -- {
  --   "numirias/semshi",
  --   name = "semshi",
  --   -- run = ":hi semshiGlobal ctermfg=red guifg=#e06c75",
  --   config = function()
  --     -- vim.cmd("hi def semshiGlobal guifg=#2c56ff")
  --   end
  -- },
}
