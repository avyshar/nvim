local M = {}

M.get_deps = function()
  return {
    "Bilal2453/luvit-meta",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "folke/lazydev.nvim",
  }
end

M.cmp_setup = function()
  local cmp = require("cmp")
  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "vsnip" }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = "buffer" },
    }),
  })

  cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer" },
    },
  })

  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      { name = "cmdline" },
    }),
    matching = { disallow_symbol_nonprefix_matching = false },
  })

  vim.diagnostic.config({
    -- update_in_insert = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  })
end

M.capabilities = function()
  return require("cmp_nvim_lsp").default_capabilities()
end
M.on_attach = function(_, bufnr)
  local telescope = require("telescope.builtin")
  local opts = { buffer = bufnr, noremap = true, silent = true }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)

  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set("n", "gr", telescope.lsp_references, opts)
  vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", function()
    local prev_diag = vim.diagnostic.get_prev(opts)
    vim.diagnostic.jump({ diagnostic = prev_diag })
  end, opts)
  vim.keymap.set("n", "]d", function()
    local next_diag = vim.diagnostic.get_next(opts)
    vim.diagnostic.jump({ diagnostic = next_diag })
  end, opts)
  vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end

M.setup_servers = function(servers, capabilities, on_attach, root_dir)
  local nvim_lsp = require("lspconfig")
  table.foreach(servers, function(_, server)
    if server == "angularls" then
      local ng_lib_path = "/Users/avyshar/.nvm/versions/node/v20.11.1/bin/node_modules"
      local cmd = {
        "ngserver",
        "--stdio",
        "--ngProbeLocations",
        ng_lib_path,
        "--tsProbeLocations",
        ng_lib_path,
      }

      nvim_lsp.angularls.setup({
        cmd = cmd,
        capabilities = capabilities,
        on_attach = on_attach,
        on_new_config = function(new_config, new_root_dir)
          new_config.cmd = cmd
        end,
      })
    else
      nvim_lsp[server].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        root_dir = root_dir,
      })
    end
  end)
end

return M
