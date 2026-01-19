return {
  ---------------------------------------------------------------------------
  -- Onform.nvim Configuration
  ---------------------------------------------------------------------------
  {
    "stevearc/conform.nvim",
    opts = function()
      local conform = require("conform")
      conform.setup({
        formatters_by_ft = {
          typescript = { "prettierd", "prettier" },
          typescriptreact = { "prettierd", "prettier" },
          javascript = { "prettierd", "prettier" },
          javascriptreact = { "prettierd", "prettier" },
          json = { "prettierd", "prettier" },
          html = { "prettierd", "prettier" },
          css = { "prettierd", "prettier" },
          go = { "gofmt" },
        },

        format_on_save = {
          -- These options will be passed to conform.format()
          timeout_ms = 500,
          lsp_format = "fallback",
        },
      })
    end,
  },

  ---------------------------------------------------------------------------
  -- Treesitter
  ---------------------------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "html",
        "javascript",
        "go",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      })
    end,
  },

  ---------------------------------------------------------------------------
  -- Telescope Configuration
  ---------------------------------------------------------------------------
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
    },
  },

  ---------------------------------------------------------------------------
  -- Symbols / Code Outline (Tagbar replacement)
  ---------------------------------------------------------------------------
  {
    "stevearc/aerial.nvim",
    opts = {},
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },

  ---------------------------------------------------------------------------
  -- Snacks.nvim Configuration
  ---------------------------------------------------------------------------
  {
    "folke/snacks.nvim",
    opts = {
      explorer = { enabled = false },
    },
  },

  ----------------------------------------------------------------------------
  -- LSP Configurations
  ----------------------------------------------------------------------------
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- Go
        "gopls",
        "goimports",
        "gofumpt",
        "delve",
        -- TS/JS
        "vtsls",
        -- Bash
        "bash-language-server",
        "shfmt",
        "shellcheck",
        -- Lua
        "stylua",
        -- Python
        "pyright", -- LSP
        "ruff", -- Modern Linter/Formatter (extremely fast)
        "black", -- Formatter (if you prefer it over ruff)
        "flake8",
        -- Java
        "jdtls", -- The main Java LSP
        "java-debug-adapter",
        "java-test",
        -- General
        "prettierd", -- Prettier daemon for formatting
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Go settings
        gopls = {
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
                shadow = true,
              },
              staticcheck = true,
              gofumpt = true,
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
              },
            },
          },
        },
        -- TypeScript / JavaScript
        vtsls = {},
        -- Bash
        bashls = {},
        -- Docker
        dockerls = {},
        docker_compose_language_service = {},
      },
    },
  },
}
