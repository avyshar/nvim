return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "zbirenbaum/copilot.lua",
        event = "InsertEnter",
        config = function()
          require("copilot").setup({})
        end,
      },
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/nvim-cmp',
      'folke/neodev.nvim',
      'folke/neoconf.nvim',
      {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
          require('trouble').setup()
          -- Lua
          vim.keymap.set("n", "<leader>xx", function() require("trouble").open() end)
          vim.keymap.set("n", "<leader>xw", function() require("trouble").open("workspace_diagnostics") end)
          vim.keymap.set("n", "<leader>xd", function() require("trouble").open("document_diagnostics") end)
          vim.keymap.set("n", "<leader>xq", function() require("trouble").open("quickfix") end)
          vim.keymap.set("n", "<leader>xl", function() require("trouble").open("loclist") end)
          vim.keymap.set("n", "gR", function() require("trouble").open("lsp_references") end)
        end
      },
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
      {
        'nvimdev/lspsaga.nvim',
        config = function()
          require('lspsaga').setup({})
        end,
        dependencies = {
          'nvim-treesitter/nvim-treesitter',
          'nvim-tree/nvim-web-devicons'
        }
      },
      {
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "LspAttach",
        opts = {
          -- options
        },
      }
    },
    config = function()
      require("neodev").setup({})
      require("neoconf").setup({})
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require('lspconfig')

      local servers = { 'rust_analyzer', 'tsserver', 'lua_ls' }
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
          capabilities = capabilities,
        }
      end
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace"
            }
          }
        },
      })
      local luasnip = require 'luasnip'

      -- nvim-cmp setup
      local cmp = require 'cmp'
      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
          ['<C-d>'] = cmp.mapping.scroll_docs(4),  -- Down
          -- C-b (back) C-f (forward) for snippet placeholder navigation.
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = {
          { name = 'copilot' },
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        },
      }
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          -- vim.keymap.set('n', 'gd', ':Lspsaga goto_definition<CR>', opts)
          -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          -- vim.keymap.set('n', 'K', ':Lspsaga peek_definition<CR>', opts)
          -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
          -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
          -- vim.keymap.set('n', '<space>wl', function()
          --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          -- end, opts)
          -- -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
          -- vim.keymap.set('n', '<leader>D', ':Lspsaga peek_type_definition<CR>', opts)
          -- vim.keymap.set('n', '<leader>td', ':Lspsaga goto_type_definition<CR>', opts)
          -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
          -- -- vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
          -- vim.keymap.set({ 'n', 'v' }, '<space>ca', ':Lspsaga code_action<CR>', opts)
          -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
          end, opts)
        end,
      })
    end
  },
}
