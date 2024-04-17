return {
  "neovim/nvim-lspconfig",

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
  },

  config = function()
    local cmp = require "cmp"
    local lsp_capabilities = require "cmp_nvim_lsp".default_capabilities()

    require "mason".setup {}
    require "mason-lspconfig".setup {
      ensure_installed = { "tsserver", "eslint", "lua_ls", "rust_analyzer", "gopls", },
      handlers = {
        function(server) -- default handler (optional)
          require "lspconfig"[server].setup {
            capabilities = lsp_capabilities,
          }
        end,

        lua_ls = function()
          require "lspconfig".lua_ls.setup {
            capabilities = lsp_capabilities,
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

    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup {
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          require "luasnip".lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-y>"] = cmp.mapping.confirm { select = true },
        ["<C-Space>"] = cmp.mapping.complete(),
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- For luasnip users.
      }, {
        { name = "buffer" },
      })
    }

    -- Global mappings.
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)

    -- Use LspAttach autocommand to only map the following keys after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      desc = "LSP actions",
      callback = function(event)
        local opts = { buffer = event.buf }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
      end,
    })
  end
}
