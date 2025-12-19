return {
  -------------------------------------------------------------------
  -- Treesitter
  ---------------------------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "html",
        "javascript",
        "golang",
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
        "gopls", "goimports", "delve",
        -- TS/JS
        "typescript-language-server", "vtsls",
        -- Bash
        "bash-language-server", "shfmt", "shellcheck",
        -- Lua
        "stylua",
        -- Python
        "pyright", -- LSP
        "ruff",    -- Modern Linter/Formatter (extremely fast)
        "black",   -- Formatter (if you prefer it over ruff)
        "flake8",
        -- Java
        "jdtls",      -- The main Java LSP
        "java-debug-adapter",
        "java-test",
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
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
              },
            },
          },
        },
        -- The TS server is handled by vtsls in modern LazyVim
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
