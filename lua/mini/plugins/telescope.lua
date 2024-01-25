return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      lazy = true
    }
  },
  config = function ()
    local telescope = require "telescope"
    local builtin = require 'telescope.builtin'
    local actions = require 'telescope.actions'

    telescope.setup({
      defaults = {
        entry_prefix = '   ',
        initial_mode = 'insert',
        selection_strategy = 'reset',
        path_display = { 'smart' },
        color_devicons = true,
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--hidden',
          '--glob=!.git/',
        },
        layout_config = {
          vertical = {
            width = 0.9,
            height = 0.9,
            preview_height = 0.5,
          },
        },

        mappings = {
          i = {
            ['<C-n>'] = actions.cycle_history_next,
            ['<C-p>'] = actions.cycle_history_prev,

            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
          },
          n = {
            ['<esc>'] = actions.close,
            ['j'] = actions.move_selection_next,
            ['k'] = actions.move_selection_previous,
            ['q'] = actions.close,
          },
        },
      },
      pickers = {
        live_grep = {
          theme = 'dropdown',
        },

        grep_string = {
          theme = 'dropdown',
        },

        find_files = {
          theme = 'dropdown',
          previewer = false,
        },

        buffers = {
          theme = 'dropdown',
          previewer = false,
          initial_mode = 'normal',
          mappings = {
            i = {
              ['<C-d>'] = actions.delete_buffer,
            },
            n = {
              ['dd'] = actions.delete_buffer,
            },
          },
        },

        planets = {
          show_pluto = true,
          show_moon = true,
        },

        colorscheme = {
          enable_preview = true,
        },

        lsp_references = {
          theme = 'dropdown',
          initial_mode = 'normal',
        },

        lsp_definitions = {
          theme = 'dropdown',
          initial_mode = 'normal',
        },

        lsp_declarations = {
          theme = 'dropdown',
          initial_mode = 'normal',
        },

        lsp_implementations = {
          theme = 'dropdown',
          initial_mode = 'normal',
        },
      },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
        },
      },
    })

    require('telescope').load_extension('fzf')

    local keymap = vim.keymap.set

    keymap("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
    keymap("n", "<leader>lg", builtin.live_grep, { desc = "Live Grep" })
    keymap("n", "<leader>gb", builtin.git_branches, { desc = "Git Branches" })
    keymap("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
    keymap("n", "<leader>of", builtin.oldfiles, { desc = "Old Files" })
    keymap("n", "<leader>ls", builtin.search_history, { desc = "Last Search" })
    keymap("n", "<leader>qf", builtin.quickfix, { desc = "Quick Fix" })
    keymap("n", "<leader>lr", builtin.lsp_references, { desc = "Lsp Ref" })
    keymap("n", "<leader>ld", builtin.lsp_definitions, { desc = "Lsp Definition" })
    keymap("n", "<leader>lt", builtin.lsp_type_definitions, { desc = "Lsp Type Definition" })
    keymap("n", "<leader>li", builtin.lsp_implementations, { desc = "Lsp Implementations" })
  end
}
