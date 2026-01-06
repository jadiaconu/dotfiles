return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("neo-tree").setup({
        follow_current_file = true,
        close_if_last_window = true,
        filesystem = {
          hijack_netrw_behavior = "open_default",
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = true,
          },
        },
        window = {
          width = 30,
          mappings = {
            ["<space>"] = "none",
          },
        },
      })
    end,
  },
}
