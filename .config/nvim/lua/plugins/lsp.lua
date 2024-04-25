return {
  "neovim/nvim-lspconfig",

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "j-hui/fidget.nvim",
  },

  config = function()
    local cmp = require "cmp"
    local cmp_lsp = require "cmp_nvim_lsp"
    local lspconfig = require "lspconfig"
    local luasnip = require "luasnip"

    local capabilities = cmp_lsp.default_capabilities()

    local on_attach = function(client, bufnr)
      -- Disable semantic tokens as Treesitter is used for syntax highlighting instead
      client.server_capabilities.semanticTokensProvider = nil

      -- Set keymaps only for the buffer that the language server is attached to
      local opts = { buffer = bufnr }
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
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
      ensure_installed = {
        "tsserver",
        "eslint",
        "tailwindcss",
        "lua_ls",
        "rust_analyzer",
        "gopls",
      },
      handlers = {
        function(server) -- default handler
          lspconfig[server].setup {
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

    -- Global keymaps (these aren't tied to a buffer)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)

    -- Auto completion
    cmp.setup {
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body) -- For `luasnip` users.
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
        { name = "luasnip" }, -- For luasnip users.
      }, {
        { name = "buffer" },
      })
    }
  end
}
