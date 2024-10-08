local settings = {
  -- every line should be same width without escaped \
  header = {
    type = "text",
    oldfiles_directory = false,
    align = "center",
    fold_section = false,
    title = "Header",
    margin = 5,
    content = {
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "  ██████╗ ██████╗ ██╗     ██╗      ██████╗ █████╗ ███████╗",
      " ██╔════╝██╔═══██╗██║     ██║     ██╔════╝██╔══██╗╚══███╔╝",
      " ██║     ██║   ██║██║     ██║     ██║     ███████║  ███╔╝ ",
      " ██║     ██║   ██║██║     ██║     ██║     ██╔══██║ ███╔╝  ",
      " ╚██████╗╚██████╔╝███████╗███████╗╚██████╗██║  ██║███████╗",
      "  ╚═════╝ ╚═════╝ ╚══════╝╚══════╝ ╚═════╝╚═╝  ╚═╝╚══════╝",
    },
    highlight = "Statement",
    default_color = "",
    oldfiles_amount = 0,
  },
  -- name which will be displayed and command
  body = {
    type = "mapping",
    oldfiles_directory = false,
    align = "center",
    fold_section = false,
    title = "Basic Commands",
    margin = 5,

    content = {
      { " Find File", "Telescope find_files", "f" },
      { " Find Projects", "Telescope projects", "p" },
      { " File Browser", "Oil", "e" },
      { " Recent Files", "Telescope oldfiles", "r" },
      { " Nvim Config", "e /home/coll/.config/nvim/init.lua", "c" },
      { " quit", "quit", "q" },
    },
    highlight = "String",
    default_color = "",
    oldfiles_amount = 0,
  },
  footer = {
    type = "text",
    oldfiles_directory = false,
    align = "center",
    fold_section = false,
    title = "Footer",
    margin = 5,
    content = function()
      local editor = vim.g.neovide and "NeoVide" or "NeoVim"
      return { editor }
    end,
    highlight = "Statement",
    default_color = "",
    oldfiles_amount = 0,
  },

  options = {
    mapping_keys = true,
    cursor_column = 0.5,
    empty_lines_between_mappings = true,
    disable_statuslines = true,
    paddings = { 1, 3, 3, 0 },
  },
  mappings = {
    execute_command = "<CR>",
    open_file = "o",
    open_file_split = "<c-o>",
    open_section = "<TAB>",
    open_help = "?",
  },
  colors = {
    background = "#1f2227",
    folded_section = "#56b6c2",
  },
  parts = { "header", "body", "footer" },
}

vim.g.startup_bookmarks = {
  ["I"] = "~/.config/nvim/init.lua",
  ["K"] = "~/.config/kitty/kitty.conf",
}
return {
  "startup-nvim/startup.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  config = function()
    require("startup").setup(settings)
  end,
}
