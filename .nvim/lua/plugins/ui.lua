return {
  {
    "lunacookies/vim-colors-xcode",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme xcode")
      vim.o.background = "dark"
    end,
  },
  { "nvim-tree/nvim-web-devicons" },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, {
        function() return "😄" end,
      })
    end,
  },
}
