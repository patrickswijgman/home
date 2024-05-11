return {
  "neovim/nvim-lspconfig",

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip",

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
        "html", "cssls", "tsserver", "eslint", "tailwindcss", "typos_lsp", "lua_ls", "rust_analyzer", "gopls",
        "pyright", "ruff", "jsonls", "yamlls", "spectral"
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
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

    -- Auto completion
    cmp.setup {
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          require "luasnip".lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
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
        { name = "nvim_lua" },
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
