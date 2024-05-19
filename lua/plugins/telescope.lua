return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make"
    },
  },
  tag = "0.1.6",
  config = function()
    local telescope = require("telescope")
    telescope.setup{
      file_ignore_patterns = { "%.git/." },
      defaults = {
        path_display = {
          "filename_first",
        },
        previewer = false,
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--glob=!.git/",
        },
        file_ignore_patterns = { "node_modules", "package-lock.json" },
        layout_config = {
          prompt_position = "top",
          preview_cutoff = 120,
        },
      },
      pickers = {
        find_files = {
          previewer = false,
          -- path_display = formattedName,
          layout_config = {
            height = 0.4,
            prompt_position = "top",
            preview_cutoff = 120,
          },
        },
        git_files = {
          previewer = false,
          -- path_display = formattedName,
          layout_config = {
            height = 0.4,
            prompt_position = "top",
            preview_cutoff = 120,
          },
        },
        buffers = {
          previewer = false,
          initial_mode = "normal",
          -- theme = "dropdown",
          layout_config = {
            height = 0.4,
            width = 0.6,
            prompt_position = "top",
            preview_cutoff = 120,
          },
        },
        current_buffer_fuzzy_find = {
          previewer = true,
          layout_config = {
            prompt_position = "top",
            preview_cutoff = 120,
          },
        },
        live_grep = {
          only_sort_text = true,
          previewer = true,
        },
        grep_string = {
          only_sort_text = true,
          previewer = true,
        },
        lsp_references = {
          show_line = false,
          previewer = true,
        },
        treesitter = {
          show_line = false,
          previewer = true,
        },
        colorscheme = {
          enable_preview = true,
        },
      },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({
            previewer = false,
            initial_mode = "normal",
            sorting_strategy = "ascending",
            layout_strategy = "horizontal",
            layout_config = {
              horizontal = {
                width = 0.5,
                height = 0.4,
                preview_width = 0.6,
              },
            },
          }),
        },
      },
    }
    telescope.load_extension("fzf")
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
  end
}
