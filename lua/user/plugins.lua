-- Additional Plugins
lvim.plugins = {
    {"lukas-reineke/cmp-under-comparator"}, {
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            local saga = require("lspsaga")
            saga.init_lsp_saga({
                symbol_in_winbar = {enable = true},
                code_action_lightbulb = {enable = true}
            })
        end
    }, {
        "ahmedkhalf/lsp-rooter.nvim",
        config = function()
            require("lsp-rooter").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }, {
        "segeljakt/vim-silicon",
        config = function() vim.g.silicon = {pad_horiz = 0, pad_vert = 0} end
    }, {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function() require("lsp_lines").setup() end
    }, {
        "iamcco/markdown-preview.nvim",
        opt = true,
        ft = "markdown",
        run = function() vim.fn["mkdp#util#install"]() end,
        config = function() vim.g.mkdp_auto_start = 1 end
    }, {
        "ray-x/lsp_signature.nvim",
        config = function() require"lsp_signature".setup({}) end
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
    }, {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'},
    {"lvimuser/lsp-inlayhints.nvim"}, {"petertriho/nvim-scrollbar"},
    {"TimUntersberger/neogit"}, {
        "akinsho/git-conflict.nvim",
        tag = "*",
        config = function() require('git-conflict').setup() end
    }, {
        "m-demare/hlargs.nvim",
        config = function()
            require("hlargs").setup {
                color = '#D49DA5',
                -- use_colorpalette = true,
                paint_arg_declarations = false,
                extras = {named_parameters = false},
                excluded_argnames = {usages = {python = {'self', 'cls'}}}
            }
        end
    }, {"folke/trouble.nvim", cmd = "TroubleToggle"},
    {"mfussenegger/nvim-dap-python"}, {"heavenshell/vim-pydocstring"}, {
        "ellisonleao/glow.nvim",
        config = function()
            require("glow").setup {install_path = "/usr/bin"}
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
                hide_cursor = true, -- Hide cursor while scrolling
                stop_eof = true, -- Stop at <EOF> when scrolling downwards
                use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
                respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
                cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
                easing_function = nil, -- Default easing function
                pre_hook = nil, -- Function to run before the scrolling animation starts
                post_hook = nil -- Function to run after the scrolling animation ends
            })
        end
    }, {"metakirby5/codi.vim", cmd = "Codi"}, {
        "simrat39/symbols-outline.nvim",
        config = function() require('symbols-outline').setup() end
    }, {
        "ggandor/leap.nvim",
        config = function() require("leap").add_default_mappings() end
    }, {
        "rmagatti/goto-preview",
        config = function()
            require('goto-preview').setup {
                width = 120, -- Width of the floating window
                height = 25, -- Height of the floating window
                default_mappings = true, -- Bind default mappings
                debug = false, -- Print debug information
                opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
                post_open_hook = nil -- A function taking two arguments, a buffer and a window to be ran as a hook.
                -- You can use "default_mappings = true" setup option
                -- Or explicitly set keybindings
                -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
                -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
                -- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
            }
        end
    }, {
        "dccsillag/magma-nvim",
        commit = "0ab5ef297bf98d69f03bb069533444c14cd53383",
        run = ":UpdateRemotePlugins"
    }, {"jc-doyle/cmp-pandoc-references", requires = "hrsh7th/nvim-cmp"}, {
        "tzachar/cmp-tabnine",
        run = "./install.sh",
        requires = "hrsh7th/nvim-cmp",
        config = function()
            local tabnine = require "cmp_tabnine.config"
            tabnine:setup{
                max_lines = 1000,
                max_num_results = 10,
                sort = true,
                run_on_every_keystroke = true
            }
        end
        -- opt = true,
        -- event = "InsertEnter"
    }, {"p00f/nvim-ts-rainbow"}, {
        "kevinhwang91/rnvimr",
        cmd = "RnvimrToggle",
        config = function()
            vim.g.rnvimr_draw_border = 1
            vim.g.rnvimr_pick_enable = 1
            vim.g.rnvimr_bw_enable = 1
        end
    }, {"sindrets/diffview.nvim", event = "BufRead"}, {
        "andymass/vim-matchup",
        event = "CursorMoved",
        config = function()
            vim.g.matchup_matchparen_offscreen = {method = "popup"}
        end
    }, {
        "folke/todo-comments.nvim",
        event = "BufRead",
        config = function() require("todo-comments").setup() end
    }, {"nvim-treesitter/playground", event = "BufRead"}, -- {
    {"navarasu/onedark.nvim", as = "onedark"}, {"EdenEast/nightfox.nvim"}
    -- {
    --   "numirias/semshi",
    --   as = "semshi",
    --   -- run = ":hi semshiGlobal ctermfg=red guifg=#e06c75",
    --   config = function()
    --     -- vim.cmd("hi def semshiGlobal guifg=#2c56ff")
    --   end
    -- },
}
