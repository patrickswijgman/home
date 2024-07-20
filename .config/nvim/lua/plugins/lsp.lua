return {
  "neovim/nvim-lspconfig",

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",

    "j-hui/fidget.nvim",
  },

  config = function()
    local cmp = require "cmp"
    local cmp_lsp = require "cmp_nvim_lsp"
    local lspconfig = require "lspconfig"

    local capabilities = cmp_lsp.default_capabilities()

    local on_attach = function(client, bufnr)
      -- Disable semantic tokens as Treesitter is used for syntax highlighting instead
      client.server_capabilities.semanticTokensProvider = nil

      -- Set keymaps only for the buffer that the language server is attached to
      local opts = { buffer = bufnr }
      vim.keymap.set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, opts)
      vim.keymap.set({ "n", "v" }, "<leader>r", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
      vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
    end

    require "fidget".setup {}
    require "mason".setup {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    }
    require "mason-lspconfig".setup {
      automatic_installation = true,
      handlers = {
        function(name) -- default handler
          lspconfig[name].setup {
            on_attach = on_attach,
            capabilities = capabilities
          }
        end,

        tsserver = function()
          lspconfig.tsserver.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            init_options = {
              -- https://github.com/typescript-language-server/typescript-language-server/blob/master/docs/configuration.md#preferences-options
              preferences = {
                importModuleSpecifierPreference = "non-relative",
                importModuleSpecifierEnding = "js",
              },
            },
          }
        end,

        lua_ls = function()
          lspconfig.lua_ls.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
              Lua = {
                -- https://luals.github.io/wiki/settings/
                diagnostics = {
                  globals = { "vim" },
                },
                format = {
                  -- https://github.com/CppCXY/EmmyLuaCodeStyle/blob/master/docs/format_config_EN.md
                  defaultConfig = {
                    call_arg_parentheses = "remove",
                    quote_style = "double",
                  }
                }
              },
            },
          }
        end,
      },
    }

    -- Auto completion
    cmp.setup {
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          -- You need Neovim v0.10 to use vim.snippet
          vim.snippet.expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
        ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
        ["<C-y>"] = cmp.mapping.confirm { select = true },
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-space>"] = cmp.mapping.complete(),
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
      }, {
        { name = "buffer" },
      })
    }

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore)
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" }
      }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore)
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" }
      }),
      matching = { disallow_symbol_nonprefix_matching = false },
    })
  end
}
